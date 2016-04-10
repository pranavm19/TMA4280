#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv){
	//int recvV[27] = {55,56,64,65,73,74,57,58,66,67,75,76,59,60,68,69,77,78,61,62,63,70,71,72,79,80,81};
    double B[2][7];
	//int B[3][7] = {1,8,15,22,29,36,43,2,9,16,23,30,37,44,3,10,17,24,31,38,45};
	//int sendV[21];
    double recvV[14] = {0.000000,0.000000,0.295073,0.545224,0.000000,0.000000,0.712369,0.771063,0.000000,0.000000,0.000000,0.712369,0.545224,0.295073};
	int rcount[3] = {4,4,6}, nprocs = 3, block_col = 2, rdisp[3] = {0,4,8}, m = 7;

    for (size_t i = 0; i < nprocs; i++){
        int offset = rdisp[i], count = (rcount[i])/block_col;
        for (size_t k = 0; k < block_col; k++){
            for (size_t j = 0; j < count; j++){
                B[k][j+(m/nprocs)*i] = recvV[offset + k*count + j];
            }
        }
    }

	// int rem[nprocs];
 //    for (int i = 0; i < nprocs; ++i) {
 //        rem[i] = rcount[i]/block_col;
 //    }

 //    for (int i = 0; i < block_col; i++) {
 //        int r, k, k1;
 //        r  = 0;
 //        k  = rdisp[r] + rem[r]*i;
 //        k1 = k + rem[r] - 1;

 //        for (int j = 0; j < m; j++) {
 //            B[i][j] = recvV[k];

 //            if(k == k1) {
 //                r++;
 //                k  = rdisp[r] + rem[r]*i;
 //                k1 = k + rem[r] - 1;
 //            } else {
 //                k++;
 //            }
 //        }
 //    }

	// for (size_t i = 0; i < m; i++){
 //        for (size_t j = 0; j < block_col; j++){
 //            sendV[j + i*block_col] = B[j][i];
 //        }
 //    }

    for (size_t i = 0; i < 2; i++){
    	for (size_t j = 0; j < 7; j++){
    		printf("%f\t", B[i][j]);
    	}
    	printf("\n");
    }

    // for (size_t i = 0; i < 14; i++){
    // 	printf("%d\t", recvV[i]);
    // }

    printf("\n");

    return 0;
}