#include <stdlib.h>
#include <stdio.h>
#include <math.h>

// double sumUpTo(double x[], int y);

int main(int argc, char** argv)
{
	// A Vector to store the values for v[i] = i^(-2).
	int k = 14, n;
	n = (int) pow((double) 2,k);
	double v[n],sum[k],temp;
	double S = (pow((acos(-1)),2)/ 6.0);
	
	// Set Elements of Vector.
	for (size_t i = 0; i < n; i++){
		v[i] = 1.0 / pow(i+1,2);
	}

	// Sum over the elements of Vector and calculate error.
	for (size_t i = 0; i < k; i++){
		temp = 0;
		for (size_t j = 0; j < (int) pow((double) 2,i+1); j++){
			temp += v[j];
		}
		sum[i] = temp;
	}
	
	// Print the error vector.
	for (size_t i = 0; i < k; i++){
	printf ("S = %.8f, Sn = %.8f, Error = %.8f\n", S, sum[i], S-sum[i]);
	}

	return 0;
}

/*double sumUpTo(double x[], int y)
{
	int n = 2^y;
	double sum = 0;
	for (size_t i = 0; i < n; i++)
	{
		sum += x[i];
	}
	return sum;
}*/
