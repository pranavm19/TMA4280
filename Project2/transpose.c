// Just the Transpose function first!!
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <math.h>
#include "mpi.h"

#define true 1
#define false 0

typedef double real;
typedef int bool;

// Function prototypes
real **mk_2D_array(size_t n1, size_t n2, bool zero);
//void transpose(real **bt, real **b, size_t m);

int main(int argc, char **argv)
{
    MPI_Init(&argc, &argv);
    int nprocs, rank;
    MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    if (argc < 2) {
        if (rank == 0) {
            printf("Usage: ex2.5 n\n");
            printf("  n = vector/matrix size\n");
        }
        MPI_Finalize();
        return 1;
    }

    // Get the matrix size: n*n:
    int n = atoi(argv[1]);
    // Matrix size and unknowns for each process:
    int exact = floor(n/nprocs);
    int remain = n - (nprocs-1)*exact;
    // Size of each matrix is now exact*n or remain*n.
    // We consider that each such a matrix is made of 'nprocs' blocks.
    int block_len = exact;
    int block_uk = exact*exact;
    int rem_uk = exact*remain;
    if (rank+1 == nprocs){
    	block_len = remain;
    	block_uk = remain*exact;
    	rem_uk = remain*remain;
    }
    // Initialize the matrix:
    real **b = mk_2D_array(block_len, n, false);
    for (size_t i = 0; i < block_len; i++){
        for (size_t j = 0; j < n; j++) {
        	b[i][j] = rank;
        }
    }

    // Transpose
    
    // Print!
    MPI_Finalize();
	return 0;
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