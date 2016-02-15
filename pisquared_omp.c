#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <omp.h>

double sumFromTo(double* x, int y)
{
	if (y == 0)
		return x[0];

	int n = pow(2,y-1);
	double sum = 0;
	#pragma omp parallel for schedule(static) reduction(+:sum)
	for (size_t i = n; i < n*2; i++)
	{
		sum += x[i];
	}

	return sum;
}

int main(int argc, char** argv)
{
	double start = omp_get_wtime();
	
	int k = atoi(argv[1]);
	if (k <= 0){
		printf("Give me a number >= 3 :)\n");
		exit (1);
	}

	// A Vector to store the values for v[i] = i^(-2).
	int n;
	n = (int) pow((double) 2,k);
	double v[n],sum[k],temp;
	double S = (pow((acos(-1)),2)/ 6.0);
	
	// Set Elements of Vector.
	for (size_t i = 0; i < n; i++){
		v[i] = 1.0 / pow(i+1,2);
	}
	
	sum[0] = sumFromTo(v,0);
	
	// Sum over the elements of Vector and calculate error.
	for (size_t i = 1; i < k; i++){
		temp = sumFromTo(v, i);		
		sum[i] = sum[i-1] + temp;
	}
	
	// Print the error vector.
	for (size_t i = 0; i < k; i++){
	printf ("S = %e, Sn = %e, Error = %e\n", S, sum[i], S-sum[i]);
	}
	printf("Execution Time: %0.16f \n", omp_get_wtime() - start);

	return 0;
}


