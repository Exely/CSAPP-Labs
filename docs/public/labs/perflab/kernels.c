/********************************************************
 * Kernels to be optimized for the CS:APP Performance Lab
 ********************************************************/

#include <stdio.h>
#include <stdlib.h>
#include "defs.h"

/* 
 * Please fill in the following team struct 
 */
team_t team = {
    "Exely", /* Team name */

    "Exely",            /* First member full name */
    "Exely@github.com", /* First member email address */

    "", /* Second member full name (leave blank if none) */
    ""  /* Second member email addr (leave blank if none) */
};

/***************
 * ROTATE KERNEL
 ***************/

/******************************************************
 * Your different versions of the rotate kernel go here
 ******************************************************/

/* 
 * naive_rotate - The naive baseline version of rotate 
 */
char naive_rotate_descr[] = "naive_rotate: Naive baseline implementation";
void naive_rotate(int dim, pixel *src, pixel *dst)
{
    int i, j;

    for (i = 0; i < dim; i++)
        for (j = 0; j < dim; j++)
            dst[RIDX(dim - 1 - j, i, dim)] = src[RIDX(i, j, dim)];
}

/* 
 * rotate - Your current working version of rotate
 * IMPORTANT: This is the version you will be graded on
 */
char rotate_descr[] = "rotate: Current working version";
void rotate(int dim, pixel *src, pixel *dst)
{
    int i, j, a, b;
    int sdim = dim - 1;
    for (i = 0; i < dim; i += 8)
    {
        for (j = 0; j < dim; j += 8)
        {
            for (a = i; a < i + 8; a++)
            {
                for (b = j; b < j + 8; b++)
                {
                    dst[RIDX(sdim - b, a, dim)] = src[RIDX(a, b, dim)];
                }
            }
        }
    }
}

/*********************************************************************
 * register_rotate_functions - Register all of your different versions
 *     of the rotate kernel with the driver by calling the
 *     add_rotate_function() for each test function. When you run the
 *     driver program, it will test and report the performance of each
 *     registered test function.  
 *********************************************************************/

void register_rotate_functions()
{
    add_rotate_function(&naive_rotate, naive_rotate_descr);
    add_rotate_function(&rotate, rotate_descr);
    /* ... Register additional test functions here */
}

/***************
 * SMOOTH KERNEL
 **************/

/***************************************************************
 * Various typedefs and helper functions for the smooth function
 * You may modify these any way you like.
 **************************************************************/

/* A struct used to compute averaged pixel value */
typedef struct
{
    int red;
    int green;
    int blue;
    int num;
} pixel_sum;

/* Compute min and max of two integers, respectively */
static int min(int a, int b) { return (a < b ? a : b); }
static int max(int a, int b) { return (a > b ? a : b); }

/* 
 * initialize_pixel_sum - Initializes all fields of sum to 0 
 */
static void initialize_pixel_sum(pixel_sum *sum)
{
    sum->red = sum->green = sum->blue = 0;
    sum->num = 0;
    return;
}

/* 
 * accumulate_sum - Accumulates field values of p in corresponding 
 * fields of sum 
 */
static void accumulate_sum(pixel_sum *sum, pixel p)
{
    sum->red += (int)p.red;
    sum->green += (int)p.green;
    sum->blue += (int)p.blue;
    sum->num++;
    return;
}

/* 
 * assign_sum_to_pixel - Computes averaged pixel value in current_pixel 
 */
static void assign_sum_to_pixel(pixel *current_pixel, pixel_sum sum)
{
    current_pixel->red = (unsigned short)(sum.red / sum.num);
    current_pixel->green = (unsigned short)(sum.green / sum.num);
    current_pixel->blue = (unsigned short)(sum.blue / sum.num);
    return;
}

/* 
 * avg - Returns averaged pixel value at (i,j) 
 */
static pixel avg(int dim, int i, int j, pixel *src)
{
    int ii, jj;
    pixel_sum sum;
    pixel current_pixel;

    initialize_pixel_sum(&sum);
    for (ii = max(i - 1, 0); ii <= min(i + 1, dim - 1); ii++)
        for (jj = max(j - 1, 0); jj <= min(j + 1, dim - 1); jj++)
            accumulate_sum(&sum, src[RIDX(ii, jj, dim)]);

    assign_sum_to_pixel(&current_pixel, sum);
    return current_pixel;
}

/******************************************************
 * Your different versions of the smooth kernel go here
 ******************************************************/

/*
 * naive_smooth - The naive baseline version of smooth 
 */
char naive_smooth_descr[] = "naive_smooth: Naive baseline implementation";
void naive_smooth(int dim, pixel *src, pixel *dst)
{
    int i, j;

    for (i = 0; i < dim; i++)
        for (j = 0; j < dim; j++)
            dst[RIDX(i, j, dim)] = avg(dim, i, j, src);
}

/*
 * smooth - Your current working version of smooth. 
 * IMPORTANT: This is the version you will be graded on
 */
char smooth_descr[] = "smooth: Current working version";

void smooth(int dim, pixel *src, pixel *dst)
{
    int i, j;

    pixel current_pixel;
    pixel *pcurrent_pixel = &current_pixel;

    i = 0;
    j = 0;
    pcurrent_pixel->red =
        (unsigned short)(((int)(src[RIDX(0, 0, dim)].red + src[RIDX(0, 1, dim)].red +
                                src[RIDX(1, 0, dim)].red + src[RIDX(1, 1, dim)].red)) /
                         4);
    pcurrent_pixel->green =
        (unsigned short)(((int)(src[RIDX(0, 0, dim)].green + src[RIDX(0, 1, dim)].green +
                                src[RIDX(1, 0, dim)].green + src[RIDX(1, 1, dim)].green)) /
                         4);
    pcurrent_pixel->blue =
        (unsigned short)(((int)(src[RIDX(0, 0, dim)].blue + src[RIDX(0, 1, dim)].blue +
                                src[RIDX(1, 0, dim)].blue + src[RIDX(1, 1, dim)].blue)) /
                         4);
    dst[RIDX(0, 0, dim)] = current_pixel;

    i = 0;
    j = dim - 1;
    pcurrent_pixel->red =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].red + src[RIDX(i + 1, j, dim)].red +
                                src[RIDX(i, j - 1, dim)].red + src[RIDX(i + 1, j - 1, dim)].red)) /
                         4);
    pcurrent_pixel->green =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].green + src[RIDX(i + 1, j, dim)].green +
                                src[RIDX(i, j - 1, dim)].green + src[RIDX(i + 1, j - 1, dim)].green)) /
                         4);
    pcurrent_pixel->blue =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].blue + src[RIDX(i + 1, j, dim)].blue +
                                src[RIDX(i, j - 1, dim)].blue + src[RIDX(i + 1, j - 1, dim)].blue)) /
                         4);
    dst[RIDX(i, j, dim)] = current_pixel;

    i = dim - 1;
    j = 0;
    pcurrent_pixel->red =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].red + src[RIDX(i - 1, j, dim)].red +
                                src[RIDX(i, j + 1, dim)].red + src[RIDX(i - 1, j + 1, dim)].red)) /
                         4);
    pcurrent_pixel->green =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].green + src[RIDX(i - 1, j, dim)].green +
                                src[RIDX(i, j + 1, dim)].green + src[RIDX(i - 1, j + 1, dim)].green)) /
                         4);
    pcurrent_pixel->blue =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].blue + src[RIDX(i - 1, j, dim)].blue +
                                src[RIDX(i, j + 1, dim)].blue + src[RIDX(i - 1, j + 1, dim)].blue)) /
                         4);
    dst[RIDX(i, j, dim)] = current_pixel;

    i = dim - 1;
    j = dim - 1;
    pcurrent_pixel->red =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].red + src[RIDX(i - 1, j, dim)].red +
                                src[RIDX(i, j - 1, dim)].red + src[RIDX(i - 1, j - 1, dim)].red)) /
                         4);
    pcurrent_pixel->green =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].green + src[RIDX(i - 1, j, dim)].green +
                                src[RIDX(i, j - 1, dim)].green + src[RIDX(i - 1, j - 1, dim)].green)) /
                         4);
    pcurrent_pixel->blue =
        (unsigned short)(((int)(src[RIDX(i, j, dim)].blue + src[RIDX(i - 1, j, dim)].blue +
                                src[RIDX(i, j - 1, dim)].blue + src[RIDX(i - 1, j - 1, dim)].blue)) /
                         4);
    dst[RIDX(i, j, dim)] = current_pixel;

    j = 0;
    for (i = 1; i < dim - 1; i++)
    {
        pcurrent_pixel->red =
            (unsigned short)(((int)(src[RIDX(i - 1, j, dim)].red + src[RIDX(i - 1, j + 1, dim)].red +
                                    src[RIDX(i, j, dim)].red + src[RIDX(i, j + 1, dim)].red +
                                    src[RIDX(i + 1, j, dim)].red + src[RIDX(i + 1, j + 1, dim)].red)) /
                             6);
        pcurrent_pixel->green =
            (unsigned short)(((int)(src[RIDX(i - 1, j, dim)].green + src[RIDX(i - 1, j + 1, dim)].green +
                                    src[RIDX(i, j, dim)].green + src[RIDX(i, j + 1, dim)].green +
                                    src[RIDX(i + 1, j, dim)].green + src[RIDX(i + 1, j + 1, dim)].green)) /
                             6);
        pcurrent_pixel->blue =
            (unsigned short)(((int)(src[RIDX(i - 1, j, dim)].blue + src[RIDX(i - 1, j + 1, dim)].blue +
                                    src[RIDX(i, j, dim)].blue + src[RIDX(i, j + 1, dim)].blue +
                                    src[RIDX(i + 1, j, dim)].blue + src[RIDX(i + 1, j + 1, dim)].blue)) /
                             6);
        dst[RIDX(i, j, dim)] = current_pixel;
    }

    i = dim - 1;
    for (j = 1; j < dim - 1; j++)
    {
        pcurrent_pixel->red =
            (unsigned short)(((int)(src[RIDX(i, j, dim)].red + src[RIDX(i - 1, j, dim)].red +
                                    src[RIDX(i, j - 1, dim)].red + src[RIDX(i - 1, j - 1, dim)].red +
                                    src[RIDX(i, j + 1, dim)].red + src[RIDX(i - 1, j + 1, dim)].red)) /
                             6);
        pcurrent_pixel->green =
            (unsigned short)(((int)(src[RIDX(i, j, dim)].green + src[RIDX(i - 1, j, dim)].green +
                                    src[RIDX(i, j - 1, dim)].green + src[RIDX(i - 1, j - 1, dim)].green +
                                    src[RIDX(i, j + 1, dim)].green + src[RIDX(i - 1, j + 1, dim)].green)) /
                             6);
        pcurrent_pixel->blue =
            (unsigned short)(((int)(src[RIDX(i, j, dim)].blue + src[RIDX(i - 1, j, dim)].blue +
                                    src[RIDX(i, j - 1, dim)].blue + src[RIDX(i - 1, j - 1, dim)].blue +
                                    src[RIDX(i, j + 1, dim)].blue + src[RIDX(i - 1, j + 1, dim)].blue)) /
                             6);
        dst[RIDX(i, j, dim)] = current_pixel;
    }

    j = dim - 1;
    for (i = 1; i < dim - 1; i++)
    {
        pcurrent_pixel->red =
            (unsigned short)(((int)(src[RIDX(i - 1, j, dim)].red + src[RIDX(i - 1, j - 1, dim)].red +
                                    src[RIDX(i, j, dim)].red + src[RIDX(i, j - 1, dim)].red +
                                    src[RIDX(i + 1, j, dim)].red + src[RIDX(i + 1, j - 1, dim)].red)) /
                             6);
        pcurrent_pixel->green =
            (unsigned short)(((int)(src[RIDX(i - 1, j, dim)].green + src[RIDX(i - 1, j - 1, dim)].green +
                                    src[RIDX(i, j, dim)].green + src[RIDX(i, j - 1, dim)].green +
                                    src[RIDX(i + 1, j, dim)].green + src[RIDX(i + 1, j - 1, dim)].green)) /
                             6);
        pcurrent_pixel->blue =
            (unsigned short)(((int)(src[RIDX(i - 1, j, dim)].blue + src[RIDX(i - 1, j - 1, dim)].blue +
                                    src[RIDX(i, j, dim)].blue + src[RIDX(i, j - 1, dim)].blue +
                                    src[RIDX(i + 1, j, dim)].blue + src[RIDX(i + 1, j - 1, dim)].blue)) /
                             6);
        dst[RIDX(i, j, dim)] = current_pixel;
    }

    i = 0;
    for (j = 1; j < dim - 1; j++)
    {
        pcurrent_pixel->red =
            (unsigned short)(((int)(src[RIDX(i, j, dim)].red + src[RIDX(i + 1, j, dim)].red +
                                    src[RIDX(i, j - 1, dim)].red + src[RIDX(i + 1, j - 1, dim)].red +
                                    src[RIDX(i, j + 1, dim)].red + src[RIDX(i + 1, j + 1, dim)].red)) /
                             6);
        pcurrent_pixel->green =
            (unsigned short)(((int)(src[RIDX(i, j, dim)].green + src[RIDX(i + 1, j, dim)].green +
                                    src[RIDX(i, j - 1, dim)].green + src[RIDX(i + 1, j - 1, dim)].green +
                                    src[RIDX(i, j + 1, dim)].green + src[RIDX(i + 1, j + 1, dim)].green)) /
                             6);
        pcurrent_pixel->blue =
            (unsigned short)(((int)(src[RIDX(i, j, dim)].blue + src[RIDX(i + 1, j, dim)].blue +
                                    src[RIDX(i, j - 1, dim)].blue + src[RIDX(i + 1, j - 1, dim)].blue +
                                    src[RIDX(i, j + 1, dim)].blue + src[RIDX(i + 1, j + 1, dim)].blue)) /
                             6);
        dst[RIDX(i, j, dim)] = current_pixel;
    }

    for (i = 1; i < dim - 1; i++)
    {
        for (j = 1; j < dim - 1; j++)
        {
            pcurrent_pixel->red =
                (unsigned short)(((int)(src[RIDX(i + 1, j, dim)].red + src[RIDX(i + 1, j - 1, dim)].red +
                                        src[RIDX(i, j, dim)].red + src[RIDX(i - 1, j, dim)].red +
                                        src[RIDX(i, j - 1, dim)].red + src[RIDX(i - 1, j - 1, dim)].red +
                                        src[RIDX(i, j + 1, dim)].red + src[RIDX(i - 1, j + 1, dim)].red +
                                        src[RIDX(i + 1, j + 1, dim)].red)) /
                                 9);
            pcurrent_pixel->green =
                (unsigned short)(((int)(src[RIDX(i + 1, j, dim)].green + src[RIDX(i + 1, j - 1, dim)].green +
                                        src[RIDX(i, j, dim)].green + src[RIDX(i - 1, j, dim)].green +
                                        src[RIDX(i, j - 1, dim)].green + src[RIDX(i - 1, j - 1, dim)].green +
                                        src[RIDX(i, j + 1, dim)].green + src[RIDX(i - 1, j + 1, dim)].green +
                                        src[RIDX(i + 1, j + 1, dim)].green)) /
                                 9);
            pcurrent_pixel->blue =
                (unsigned short)(((int)(src[RIDX(i + 1, j, dim)].blue + src[RIDX(i + 1, j - 1, dim)].blue +
                                        src[RIDX(i, j, dim)].blue + src[RIDX(i - 1, j, dim)].blue +
                                        src[RIDX(i, j - 1, dim)].blue + src[RIDX(i - 1, j - 1, dim)].blue +
                                        src[RIDX(i, j + 1, dim)].blue + src[RIDX(i - 1, j + 1, dim)].blue +
                                        src[RIDX(i + 1, j + 1, dim)].blue)) /
                                 9);
            dst[RIDX(i, j, dim)] = current_pixel;
        }
    }
}
/********************************************************************* 
 * register_smooth_functions - Register all of your different versions
 *     of the smooth kernel with the driver by calling the
 *     add_smooth_function() for each test function.  When you run the
 *     driver program, it will test and report the performance of each
 *     registered test function.  
 *********************************************************************/

void register_smooth_functions()
{
    add_smooth_function(&smooth, smooth_descr);
    add_smooth_function(&naive_smooth, naive_smooth_descr);
    /* ... Register additional test functions here */
}
