/* Output generator that ensures no line exceeds specified number of columns */

/* Controlling parameters */
void outgen_init(FILE *outfile, int max_column, int first_indent, int other_indents);

/* Terminate statement and reset indentations */
void outgen_terminate();

/* Output generator printing */
void outgen_print(char *fmt, ...);

/* Increase indentation level */
void outgen_upindent();
/* Decrease indentation level */
void outgen_downindent();



