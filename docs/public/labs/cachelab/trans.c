/*
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */
#include "cachelab.h"
#include <stdio.h>

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/*
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded.
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N]) {
  int i, j, ii, jj, a1, a2, a3, a4, a5, a6, a7, a0;
  if (M == 32) {

    for (i = 0; i < N; i += 8) {
      for (j = 0; j < M; j += 8) {
        for (ii = i; ii < i + 8; ii++) {
          jj = j;
          a0 = A[ii][jj];
          a1 = A[ii][jj + 1];
          a2 = A[ii][jj + 2];
          a3 = A[ii][jj + 3];
          a4 = A[ii][jj + 4];
          a5 = A[ii][jj + 5];
          a6 = A[ii][jj + 6];
          a7 = A[ii][jj + 7];
          B[jj][ii] = a0;
          B[jj + 1][ii] = a1;
          B[jj + 2][ii] = a2;
          B[jj + 3][ii] = a3;
          B[jj + 4][ii] = a4;
          B[jj + 5][ii] = a5;
          B[jj + 6][ii] = a6;
          B[jj + 7][ii] = a7;
        }
      }
    }
  } else if (M == 64) {
    for (i = 0; i < N; i += 4) {
      for (j = 0; j < M; j += 4) {
        for (ii = i; ii < i + 4; ii++) {
          jj = j;
          a0 = A[ii][jj];
          a1 = A[ii][jj + 1];
          a2 = A[ii][jj + 2];
          a3 = A[ii][jj + 3];
          B[jj][ii] = a0;
          B[jj + 1][ii] = a1;
          B[jj + 2][ii] = a2;
          B[jj + 3][ii] = a3;
        }
      }
    }
  } else {
    for (i = 0; i < N; i += 16) {
      for (j = 0; j < M; j += 16) {
        for (ii = i; ii < i + 16 && ii < N; ii++) {
          for (jj = j; jj < j + 16 && jj < M; jj++) {
            a0 = A[ii][jj];
            B[jj][ii] = a0;
          }
        }
      }
    }
  }
}
/*
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started.
 */

/*
 * trans - A simple baseline transpose function, not optimized for the
 * cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N]) {
  int i, j, tmp;

  for (i = 0; i < N; i++) {
    for (j = 0; j < M; j++) {
      tmp = A[i][j];
      B[j][i] = tmp;
    }
  }
}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions() {
  /* Register your solution function */
  registerTransFunction(transpose_submit, transpose_submit_desc);

  /* Register any additional transpose functions */
  registerTransFunction(trans, trans_desc);
}

/*
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N]) {
  int i, j;

  for (i = 0; i < N; i++) {
    for (j = 0; j < M; ++j) {
      if (A[i][j] != B[j][i]) {
        return 0;
      }
    }
  }
  return 1;
}
