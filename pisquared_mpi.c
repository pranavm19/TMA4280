#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <mpi.h>

int main(int argc, char** argv)
{
	double time_start;
	if (argc < 2) {
		printf ("Requires argument: k.\n");
		return 1;
	}

	int k = atoi(argv[1]);
	if (k <= 2){
		printf("Give me a number greater than or equal to 3 :)\n");
		exit (1);
	}

	int nprocs, rank ;
	MPI_Init(&argc, &argv);
	MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);
	printf("%d\n",nprocs);
	int n = 1 << k;	
	// A Vector to store the values for v[i] = i^(-2).
	double* v = malloc(n*sizeof(double));

	if (rank == 0) {
		time_start = MPI_Wtime();	
		// Set Elements of Vector.
		for(size_t i = 0; i < n; i++){
			v[i] = 1.0 / pow(i+1,2);
		}
	}
	
	// Summing the Vector
	double sum = 0.0;
	int i;
	for(i = rank; i < n; i += nprocs){
		sum += v[i];
	}

	double Sum;
	MPI_Reduce(&sum, &Sum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
	
	if ( rank == 0) {
		double S = (pow((acos(-1)),2)/ 6.0);
		double duration = MPI_Wtime () - time_start ;
		printf ("S = %e, Sn = %e, Error = %e\n", S, Sum, S-Sum);
		printf("Execution Time: %0.16f \n", duration);
	}
	
	MPI_Finalize ();
	free(v);
	return 0;
}


