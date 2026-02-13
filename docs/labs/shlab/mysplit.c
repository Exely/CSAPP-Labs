/* 
 * mysplit.c - Another handy routine for testing your tiny shell
 * 
 * usage: mysplit <n>
 * Fork a child that spins for <n> seconds in 1-second chunks.
 */
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <signal.h>

int main(int argc, char **argv) 
{
    int i, secs;

    if (argc != 2) {
	fprintf(stderr, "Usage: %s <n>\n", argv[0]);
	exit(0);
    }
    secs = atoi(argv[1]);


    if (fork() == 0) { /* child */
	for (i=0; i < secs; i++)
	    sleep(1);
	exit(0);
    }

    /* parent waits for child to terminate */
    wait(NULL);

    exit(0);
}
