#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>

#include "outgen.h"
/* Output generator that ensures no line exceeds specified number of columns */

#define STRING_LENGTH 1024

FILE *outfile = NULL;
int max_column = 80;
int first_indent = 4;
int other_indents = 2;
int cur_pos = 0;
int indent = 0;


/* Controlling parameters */
void outgen_init(FILE *arg_outfile, int arg_max_column, int arg_first_indent, int arg_other_indents) {
  outfile = arg_outfile;
  max_column = arg_max_column;
  first_indent = arg_first_indent;
  other_indents = arg_other_indents;
  cur_pos = 0;
  indent = first_indent;
}

static void print_token(char *string) {
  if (outfile == NULL)
    outfile = stdout;
  int len = strlen(string);
  int i;
  if (len+cur_pos > max_column) {
    fprintf(outfile, "\n");
    for (i = 0; i < indent; i++)
      fprintf(outfile, " ");
    cur_pos = indent;
  }
  fprintf(outfile, "%s", string);
  cur_pos += len;
}


/* Terminate statement and reset indentations */
void outgen_terminate() {
  printf("\n");
  cur_pos = 0;
  indent = first_indent;
}

/* Output generator printing */
void outgen_print(char *fmt, ...) {
  char buf[STRING_LENGTH];
  va_list argp;
  va_start(argp, fmt);
  vsprintf(buf, fmt, argp);
  va_end(argp);
  print_token(buf);
}

/* Increase indentation level */
void outgen_upindent() {
  indent += other_indents;
}
/* Decrease indentation level */
void outgen_downindent() {
  indent -= other_indents;
}


