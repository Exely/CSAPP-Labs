/******************************************************************************
 *	pipe.h
 *
 *	Code for implementing pipelined processor simulators
 ******************************************************************************/

#ifndef PIPE_H
#define PIPE_H

/******************************************************************************
 *	#includes
 ******************************************************************************/

#include <stdio.h>

/******************************************************************************
 *	typedefs
 ******************************************************************************/

/* Different control operations for pipeline register */
/* LOAD:   Copy next state to current   */
/* STALL:  Keep current state unchanged */
/* BUBBLE: Set current state to nop     */
/* ERROR:  Occurs when both stall & load signals set */

typedef enum { P_LOAD, P_STALL, P_BUBBLE, P_ERROR } p_stat_t;

typedef struct {
    /* Current and next register state */
    void *current;
    void *next;
    /* Contents of register when bubble occurs */
    void *bubble_val;
    /* Number of state bytes */
    int count;
    /* How should state be updated next time? */
    p_stat_t op;
} pipe_ele, *pipe_ptr;

/******************************************************************************
 *	function declarations
 ******************************************************************************/

/* Create new pipe with count bytes of state */
/* bubble_val indicates state corresponding to pipeline bubble */
pipe_ptr new_pipe(int count, void *bubble_val);

/* Update all pipes */
void update_pipes();

/* Set all pipes to bubble values */
void clear_pipes();

/* Utility code */

/* Print hex/oct/binary format with leading zeros */
/* bpd denotes bits per digit  Should be in range 1-4,
   bpw denotes bits per word.*/
void wprint(uword_t x, int bpd, int bpw, FILE *fp);
void wstring(uword_t x, int bpd, int bpw, char *s);

/******************************************************************************/

#endif /* PIPE_H */



