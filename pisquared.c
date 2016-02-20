#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <omp.h>

int main(int argc, char** argv)
{
	double start = omp_get_wtime();
	if (argc < 2) {
		printf ("Requires argument: k.\n");
		return 1;
	}

	int k = atoi(argv[1]);
	if (k <= 2){
		printf("Give me a number >= 3 :)\n");
		exit (1);
	}

	// A Vector to store the values for v[i] = i^(-2).
	int n = 1 << k;
	double sum = 0.0;
	double S = (pow((acos(-1)),2)/ 6.0);
	
	double* v = malloc(n*sizeof(double));

	// Set Elements of Vector.
	for(size_t i = 0; i < n; i++){
		v[i] = 1.0 / pow(i+1,2);
	}
	
	for(size_t i = 0; i < n; i++){
		sum += v[i];
	}
	
	// Print the error vector.
	printf ("S = %e, Sn = %e, Error = %e\n", S, sum, S-sum);
	
	printf("Execution Time: %0.16f \n", omp_get_wtime() - start);

	free(v);
	return 0;
}
