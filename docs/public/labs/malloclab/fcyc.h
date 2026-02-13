/*
 * fcyc.h - prototypes for the routines in fcyc.c that estimate the
 *     time in CPU cycles used by a test function f
 * 
 * Copyright (c) 2002, R. Bryant and D. O'Hallaron, All rights reserved.
 * May not be used, modified, or copied without permission.
 *
 */

/* The test function takes a generic pointer as input */
typedef void (*test_funct)(void *);

/* Compute number of cycles used by test function f */
double fcyc(test_funct f, void* argp);

/*********************************************************
 * Set the various parameters used by measurement routines 
 *********************************************************/

/* 
 * set_fcyc_clear_cache - When set, will run code to clear cache 
 *     before each measurement. 
 *     Default = 0
 */
void set_fcyc_clear_cache(int clear);

/* 
 * set_fcyc_cache_size - Set size of cache to use when clearing cache 
 *     Default = 1<<19 (512KB)
 */
void set_fcyc_cache_size(int bytes);

/* 
 * set_fcyc_cache_block - Set size of cache block 
 *     Default = 32
 */
void set_fcyc_cache_block(int bytes);

/* 
 * set_fcyc_compensate- When set, will attempt to compensate for 
 *     timer interrupt overhead 
 *     Default = 0
 */
void set_fcyc_compensate(int compensate_arg);

/* 
 * set_fcyc_k - Value of K in K-best measurement scheme
 *     Default = 3
 */
void set_fcyc_k(int k);

/* 
 * set_fcyc_maxsamples - Maximum number of samples attempting to find 
 *     K-best within some tolerance.
 *     When exceeded, just return best sample found.
 *     Default = 20
 */
void set_fcyc_maxsamples(int maxsamples_arg);

/* 
 * set_fcyc_epsilon - Tolerance required for K-best
 *     Default = 0.01
 */
void set_fcyc_epsilon(double epsilon_arg);




