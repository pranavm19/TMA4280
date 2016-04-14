#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <mpi.h>
#include <omp.h>

#define PI 3.14159265358979323846
#define true 1
#define false 0

typedef double real;
typedef int bool;

// Function prototypes
real *mk_1D_array(size_t n, bool zero);
real **mk_2D_array(size_t n1, size_t n2, bool zero);
void transpose(real **B, size_t m, size_t n, size_t size, size_t block_uk, size_t rem_uk, size_t rank);
real rhs(real x, real y);
void fst_(real *v, int *n, real *w, int *nn);
void fstinv_(real *v, int *n, real *w, int *nn);

int main(int argc, char **argv)
{
    MPI_Init(&argc, &argv);
    int nprocs, rank;
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    int numthreads = omp_get_max_threads();

    if (argc < 2) {
        printf("Usage:\n");
        printf("  poisson n\n\n");
        printf("Arguments:\n");
        printf("  n: the problem size (must be a power of 2)\n");
    }

    double time_start;
    if (rank == 0) {
        time_start = MPI_Wtime();
    }

    // The number of grid points in each direction is n+1
    // The number of degrees of freedom in each direction is n-1 = m
    int n = atoi(argv[1]);
    int m = n - 1;
    int nn = 4 * n;
    real h = 1.0 / n;

    // Splitting the matrix into columns:
    int exact = m/nprocs;
    int rem = m - (nprocs - 1)*exact;
    // Size of each process owns a strip matrix which is m*exact or m*remain.
    // We consider that each such a matrix is made of 'nprocs' blocks vertically.
    int block_col = exact;
    int block_uk = exact*exact;
    int rem_uk = exact*rem;
    // For the last such strip, number of columns is rem. Consequently:
    if (rank == nprocs-1){
        block_col = rem;
        block_uk = rem*exact;
        rem_uk = rem*rem;
    }

    // Grid points
    real *grid = mk_1D_array(n+1, false);
    #pragma omp parallel for schedule(static)
    for (size_t i = 0; i < n+1; i++) {
        grid[i] = i * h;
    }

    // The diagonal of the eigenvalue matrix of T
    real *diag = mk_1D_array(m, false);
    #pragma omp parallel for schedule(static)
    for (size_t i = 0; i < m; i++) {
        diag[i] = 2.0 * (1.0 - cos((i+1) * PI / n));
    }

    // Initialize the right hand side data
    // B is the column strip that the process owns.*
    real **B = mk_2D_array(block_col, m, false);
    #pragma omp parallel for schedule(static)
    for (size_t i = 0; i < block_col; i++) {
        for (size_t j = 0; j < m; j++) {
            B[i][j] = h * h * rhs(grid[i+1+(rank*exact)], grid[j+1]);
        }
    }

    // For the Sine Transform:
    real **z = mk_2D_array(numthreads, nn, false);

    // Calculate Btilde^T = S^-1 * (S * B)^T
    #pragma omp parallel for schedule(static)
    for (size_t i = 0; i < block_col; i++) {
        fst_(B[i], &n, z[omp_get_thread_num()], &nn);
    }
    transpose(B, block_col, m, nprocs, block_uk, rem_uk, rank);
    #pragma omp parallel for schedule(static)
    for (size_t i = 0; i < block_col; i++) {
        fstinv_(B[i], &n, z[omp_get_thread_num()], &nn);
    }

    // Solve Lambda * Xtilde = Btilde
    #pragma omp parallel for schedule(static)
    for (size_t i = 0; i < block_col; i++) {
        for (size_t j = 0; j < m; j++) {
            B[i][j] = B[i][j] / (diag[i+(rank*exact)] + diag[j]);
        }
    }

    // Calculate X = S^-1 * (S * Xtilde^T) ^ T
    #pragma omp parallel for schedule(static)
    for (size_t i = 0; i < block_col; i++) {
        fst_(B[i], &n, z[omp_get_thread_num()], &nn);
    }
    transpose(B, block_col, m, nprocs, block_uk, rem_uk, rank);
    #pragma omp parallel for schedule(static)
    for (size_t i = 0; i < block_col; i++) {
        fstinv_(B[i], &n, z[omp_get_thread_num()], &nn);
    }

    // Calculate maximal value of solution
    double U_max = 0.0, e_max = 0.0, global_max, global_emax, error;
    for (size_t i = 0; i < block_col; i++){
        for (size_t j = 0; j < m; j++){
        	error = fabs(B[i][j] - sin(PI*(i+1+(rank*exact))*h)*sin(2*PI*(j+1)*h));
            U_max = U_max > B[i][j] ? U_max : B[i][j];
            e_max = e_max > error ? e_max : error;
        }
    }

    // MPI_Max to find the true maximum:
    MPI_Reduce(&U_max, &global_max, 1, MPI_DOUBLE, MPI_MAX, 0, MPI_COMM_WORLD);
    MPI_Reduce(&e_max, &global_emax, 1, MPI_DOUBLE, MPI_MAX, 0, MPI_COMM_WORLD);

    // Print the Global Maximum on process 0:
    if (rank == 0){
    	printf("Problem Size = %d\nNumprocs = %d\n", n, nprocs);
        printf("U_max = %0.16f\n", global_max);
		printf("E_max = %0.16f\n", global_emax);
        double duration = MPI_Wtime() - time_start ;
        printf("Execution Time: %0.16f \n", duration);
    }

    MPI_Finalize();
    return 0;
}

real rhs(real x, real y) {
    // return 2 * (y - y*y + x - x*x);
    return 5*PI*PI*sin(PI*x)*sin(2*PI*y);
}

void transpose(real **B, size_t block_col, size_t m, size_t nprocs, size_t block_uk, size_t rem_uk, size_t rank)
{
    // Create send and recv Vectors:
    real *sendV = mk_1D_array(block_col*m, false);
    real *recvV = mk_1D_array(block_col*m, false);

    // Create send and recv Count and Displacement for MPI:
    int scount[nprocs], sdisp[nprocs], rcount[nprocs], rdisp[nprocs];
    for (size_t i = 0; i < nprocs; i++){
        scount[i] = block_uk;
        sdisp[i]  = block_uk*i;
        rcount[i] = block_uk;
        rdisp[i]  = block_uk*i;
    }
    scount[nprocs-1] = rem_uk;
    rcount[nprocs-1] = rem_uk;

    // Wrap Data into the 1D Array sendV:
    #pragma omp parallel for schedule(static)
    for (size_t i = 0; i < m; i++){
        for (size_t j = 0; j < block_col; j++){
            sendV[j + i*block_col] = B[j][i];
        }
    }

    // Communicate with all processes:
    MPI_Alltoallv(sendV, scount, sdisp, MPI_DOUBLE, recvV, rcount, rdisp, MPI_DOUBLE, MPI_COMM_WORLD);

    // Unwrap the Data into the 2D array B, from recvV:
    #pragma omp parallel for schedule(static)
    for (size_t i = 0; i < nprocs; i++){
        int offset = rdisp[i], count = (rcount[i])/block_col;
        #pragma omp parallel for schedule(static)
        for (size_t k = 0; k < block_col; k++){
            for (size_t j = 0; j < count; j++){
                B[k][j+(m/nprocs)*i] = recvV[offset + k*count + j];
            }
        }
    }
}

real *mk_1D_array(size_t n, bool zero)
{
    if (zero) {
        return (real *)calloc(n, sizeof(real));
    }
    return (real *)malloc(n * sizeof(real));
}

real **mk_2D_array(size_t n1, size_t n2, bool zero)
{
    real **ret = (real **)malloc(n1 * sizeof(real *));

    if (zero) {
        ret[0] = (real *)calloc(n1 * n2, sizeof(real));
    }
    else {
        ret[0] = (real *)malloc(n1 * n2 * sizeof(real));
    }

    for (size_t i = 1; i < n1; i++) {
        ret[i] = ret[i-1] + n2;
    }
    return ret;
}
