#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <mpi.h>

int main(int argc, char** argv)
{
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
	MPI_Status status; 
	MPI_Comm_size(MPI_COMM_WORLD, &nprocs);
	MPI_Comm_rank(MPI_COMM_WORLD, &rank);

	int n = 1 << k;	
	int my_n = n/nprocs;
	int tag = 100;
	double my_sum = 0.0;
	double time_start;
	
	if (rank == 0) {
		time_start = MPI_Wtime();
		double* v = malloc(n*sizeof(double));	
		// Set Elements of Vector v_i = 1/(i^2).
		for(size_t i = 0; i < n; i++){
			v[i] = 1.0 / pow(i+1,2);
		}
		// Send these elements to the other processes.
		for(size_t i = 1; i < nprocs; i++){
			MPI_Send(&(v[i*my_n]), my_n, MPI_DOUBLE, i, tag, MPI_COMM_WORLD);
		}
		for(size_t i = 0; i < my_n; i++){
			my_sum += v[i];
		}
		free(v);
	}
	else {
		// A Vector to handle the values for summing.
		double* my_v = malloc((my_n)*sizeof(double));
		MPI_Recv(my_v, my_n, MPI_DOUBLE, 0, tag, MPI_COMM_WORLD, &status);
		// Summing the Vector
		for(size_t i = 0; i < my_n; i++){
			my_sum += my_v[i];
		}
		free(my_v);
	}
	
	double Sum;
	MPI_Reduce(&my_sum, &Sum, 1, MPI_DOUBLE, MPI_SUM, 0, MPI_COMM_WORLD);
	
	if ( rank == 0) {
		double S = (pow((acos(-1)),2)/ 6.0);
		double duration = MPI_Wtime () - time_start ;
		printf ("S = %e, Sn = %e, Error = %e\n", S, Sum, S-Sum);
		printf("Execution Time: %0.16f \n", duration);
	}
	
	MPI_Finalize ();
	return 0;
}


