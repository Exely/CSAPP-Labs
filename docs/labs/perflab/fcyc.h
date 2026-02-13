
/* Fcyc measures the speed of any "test function."  Such a function
   is passed a list of integer parameters, which it may interpret
   in any way it chooses.
*/

typedef void (*test_funct)(int *);
typedef void (*test_funct_v)(void *);

/* Compute number of cycles used by function f on given set of parameters */
double fcyc(test_funct f, int* params);
double fcyc_v(test_funct_v f, void* params[]);

/***********************************************************/
/* Set the various parameters used by measurement routines */


/* When set, will run code to clear cache before each measurement 
   Default = 0
*/
void set_fcyc_clear_cache(int clear);

/* Set size of cache to use when clearing cache 
   Default = 1<<19 (512KB)
*/
void set_fcyc_cache_size(int bytes);

/* Set size of cache block 
   Default = 32
*/
void set_fcyc_cache_block(int bytes);

/* When set, will attempt to compensate for timer interrupt overhead 
   Default = 0
*/
void set_fcyc_compensate(int compensate);

/* Value of K in K-best
   Default = 3
*/
void set_fcyc_k(int k);

/* Maximum number of samples attempting to find K-best within some tolerance.
   When exceeded, just return best sample found.
   Default = 20
*/
void set_fcyc_maxsamples(int maxsamples);

/* Tolerance required for K-best
   Default = 0.01
*/
void set_fcyc_epsilon(double epsilon);



