/* Functions to generate C or Verilog code from HCL */
/* This file maintains a parse tree representation of expressions */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>

#include "node.h"
#include "outgen.h"

#define MAXBUF 1024

void yyerror(const char *str);
void yyserror(const char *str, char *other);

/* For error reporting */
static char* show_expr(node_ptr expr);

/* The symbol table */
#define SYM_LIM 100
static node_ptr sym_tab[2][SYM_LIM];
static int sym_count = 0;

/* Optional simulator name */
char simname[MAXBUF] = "";

#ifdef UCLID
int annotate = 0;
/* Keep list of argument names encountered in node definition */
char *arg_names[SYM_LIM];
int arg_cnt = 0;
#endif


extern FILE *outfile;

/*
 * usage - print helpful diagnostic information
 */
static void usage(char *name)
{
#ifdef VLOG
    fprintf(stderr, "Usage: %s [-h] < HCL_file  > verilog_file\n", name);
#else
#ifdef UCLID
    fprintf(stderr, "Usage: %s [-ah] < HCL_file  > uclid_file\n", name);
    fprintf(stderr, "   -a     Add define/use annotations\n");
#else /* !UCLID */
    fprintf(stderr, "Usage: %s [-h][-n NAM] < HCL_file  > C_file\n", name);
#endif /* UCLID */
#endif /* VLOG */
    fprintf(stderr, "   -h     Print this message\n");
    fprintf(stderr, "   -n NAM Specify processor name\n");
    exit(0);
}


/* Initialization */
void init_node(int argc, char **argv)
{
    int c;
    int max_column = 75;
    int first_indent = 4;
    int other_indents = 2;

    /* Parse the command line arguments */
    while ((c = getopt(argc, argv, "hna")) != -1) {
	switch(c) {
	case 'h':
	    usage(argv[0]);
	    break;
	case 'n': /* Optional simulator name */
	    strcpy(simname, argv[optind]);
	    break;
#ifdef UCLID
	case 'a':
	    annotate = 1;
	    break;
#endif
	default:
	    printf("Invalid option '%c'\n", c);
	    usage(argv[0]);
	    break;
	}
    }

#if !defined(VLOG) && !defined(UCLID)
    /* Define and initialize the simulator name */
    if (!strcmp(simname, "")) 
	printf("char simname[] = \"Y86-64 Processor\";\n");
    else
	printf("char simname[] = \"Y86-64 Processor: %s\";\n", simname);
#endif
    outgen_init(outfile, max_column, first_indent, other_indents);
}

static void add_symbol(node_ptr name, node_ptr val)
{
    if (sym_count >= SYM_LIM) {
	yyerror("Symbol table limit exceeded");
	return;
    }
    sym_tab[0][sym_count] = name;
    sym_tab[1][sym_count] = val;
    sym_count++;
}


static char *node_names[] =
  {"quote", "var", "num", "and", "or", "not", "comp", "ele", "case"};

static void show_node(node_ptr node)
{
    printf("Node type: %s, Boolean ? %c, String value: %s\n",
	   node_names[node->type], node->isbool ? 'Y':'N', node->sval);
}


void finish_node(int check_ref)
{
    if (check_ref) {
	int i;
	for (i = 0; i < sym_count; i++)
	    if (!sym_tab[0][i]->ref) {
		fprintf(stderr, "Warning, argument '%s' not referenced\n",
			sym_tab[0][i]->sval);
	    }
    }
}

static node_ptr find_symbol(char *name)
{
    int i;
    for (i = 0; i < sym_count; i++) {
	if (strcmp(name, sym_tab[0][i]->sval) == 0) {
	    node_ptr result = sym_tab[1][i];
	    sym_tab[0][i]->ref++;
	    return result;
	}
    }
    yyserror("Symbol %s not found", name);
    return NULL;
}

#ifdef UCLID
/* See if string should be considered argument.
   Currently, omit strings that are all upper case */
static int is_arg(char *name)
{
    int upper = 1;
    int c;
    while ((c=*name++) != '\0')
	upper = upper && isupper(c);
    return !upper;
}

/* See if string is part of current argument list */
static void check_for_arg(char *name)
{
    int i;
    if (!is_arg(name))
	return;
    for (i = 0; i < arg_cnt; i++)
	if (strcmp(arg_names[i], name) == 0)
	    return;
    arg_names[arg_cnt++] = name;
}
#endif

static node_ptr new_node(node_type_t t, int isbool,
			 char *s, node_ptr a1, node_ptr a2)
{
    node_ptr result = malloc(sizeof(node_rec));
    result->type = t;
    result->isbool = isbool;
    result->sval = s;
    result->arg1 = a1;
    result->arg2 = a2;
    result->ref = 0;
    result->next = NULL;
    return result;
}

/* Concatenate two lists */
node_ptr concat(node_ptr n1, node_ptr n2)
{
    node_ptr tail = n1;
    if (!n1)
	return n2;
    while (tail->next)
	tail = tail->next;
    tail->next = n2;
    return n1;
}

static void free_node(node_ptr n)
{
    free(n->sval);
    free(n);
}

node_ptr make_quote(char *qstring)
{

    /* Quoted string still has quotes around it */
    int len = strlen(qstring)-2;
    char *sname = malloc(len+1);
    strncpy(sname, qstring+1, len);
    sname[len] = '\0';
    return new_node(N_QUOTE, 0, sname, NULL, NULL);
}

node_ptr make_var(char *name)
{
    char *sname = malloc(strlen(name)+1);
    strcpy(sname, name);
    /* Initially assume var is not Boolean */
    return new_node(N_VAR, 0, sname, NULL, NULL);
}

node_ptr make_num(char *name)
{
    char *sname = malloc(strlen(name)+1);
    strcpy(sname, name);
    return new_node(N_NUM, 0, sname, NULL, NULL);
}

void set_bool(node_ptr varnode)
{
    if (!varnode)
	yyerror("Null node encountered");
    varnode->isbool = 1;
}

/* Make sure argument is OK */
static int check_arg(node_ptr arg, int wantbool)
{
    if (!arg) {
	yyerror("Null node encountered");
	return 0;
    }
    if (arg->type == N_VAR) {
	node_ptr qval = find_symbol(arg->sval);
	if (!qval) {
	    yyserror("Variable '%s' not found", arg->sval);
	    return 0;
	}
	if (wantbool != qval->isbool) {
	    if (wantbool)
		yyserror("Variable '%s' not Boolean", arg->sval);
	    else
		yyserror("Variable '%s' not integer", arg->sval);
	    return 0;
	}
	return 1;
    }
    if (arg->type == N_NUM) {
        if (wantbool && strcmp(arg->sval,"0") != 0 &&
	    strcmp(arg->sval,"1") != 0) {
	    yyserror("Value '%s' not Boolean", arg->sval);
	    return 0;
        }
	return 1;
    }
    if (wantbool && !arg->isbool)
	yyserror("Non Boolean argument '%s'", show_expr(arg));
    if (!wantbool && arg->isbool)
	yyserror("Non integer argument '%s'", show_expr(arg));
    return (wantbool == arg->isbool);
}

node_ptr make_not(node_ptr arg)
{
    check_arg(arg, 1);
    return new_node(N_NOT, 1, "!", arg, NULL);
}

node_ptr make_and(node_ptr arg1, node_ptr arg2)
{
    check_arg(arg1, 1);
    check_arg(arg2, 1);
    return new_node(N_AND, 1, "&", arg1, arg2);
}

node_ptr make_or(node_ptr arg1, node_ptr arg2)
{
    check_arg(arg1, 1);
    check_arg(arg2, 1);
    return new_node(N_OR, 1, "|", arg1, arg2);
}

node_ptr make_comp(node_ptr op, node_ptr arg1, node_ptr arg2)
{
    check_arg(arg1, 0);
    check_arg(arg2, 0);
    return new_node(N_COMP, 1, op->sval, arg1, arg2);
}

node_ptr make_ele(node_ptr arg1, node_ptr arg2)
{
    node_ptr ele;
    check_arg(arg1, 0);
    for (ele = arg1; ele; ele = ele->next)
	check_arg(ele, 0);
    return new_node(N_ELE, 1, "in", arg1, arg2);
}

node_ptr make_case(node_ptr arg1, node_ptr arg2)
{
    check_arg(arg1, 1);
    check_arg(arg2, 0);
    return new_node(N_CASE, 0, ":", arg1, arg2);
}

void insert_code(node_ptr qstring)
{
    if (!qstring)
	yyerror("Null node");
    else {
#if !defined(VLOG) && !defined(UCLID)
	fputs(qstring->sval, outfile);
	fputs("\n", outfile);
#endif
    }
}

void add_arg(node_ptr var, node_ptr qstring, int isbool)
{
    if (!var || !qstring) {
	yyerror("Null node");
	return;
    }
    add_symbol(var, qstring);
    if (isbool) {
	set_bool(var);
	set_bool(qstring);
    }
}

static char expr_buf[1024];
static int errlen = 0;
#define MAXERRLEN 80

/* Recursively display expression for error reporting */
static void show_expr_helper(node_ptr expr)
{
    switch(expr->type) {
	int len;
	node_ptr ele;
    case N_QUOTE:
	len = strlen(expr->sval) + 2;
	if (len + errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "'%s'", expr->sval);
	    errlen += len;
	}
	break;
    case N_VAR:
	len = strlen(expr->sval);
	if (len + errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "%s", expr->sval);
	    errlen += len;
	}
	break;
    case N_NUM:
	len = strlen(expr->sval);
	if (len + errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "%s", expr->sval);
	    errlen += len;
	}
	break;
    case N_AND:
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "(");
	    errlen+=1;
	    show_expr_helper(expr->arg1);
	    sprintf(expr_buf+errlen, " & ");
	    errlen+=3;
	}
	if (errlen < MAXERRLEN) {
	    show_expr_helper(expr->arg2);
	    sprintf(expr_buf+errlen, ")");
	    errlen+=1;
	}
	break;
    case N_OR:
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "(");
	    errlen+=1;
	    show_expr_helper(expr->arg1);
	    sprintf(expr_buf+errlen, " | ");
	    errlen+=3;
	}
	if (errlen < MAXERRLEN) {
	    show_expr_helper(expr->arg2);
	    sprintf(expr_buf+errlen, ")");
	    errlen+=1;
	}
	break;
    case N_NOT:
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "!");
	    errlen+=1;
	    show_expr_helper(expr->arg1);
	}
	break;
    case N_COMP:
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "(");
	    errlen+=1;
	    show_expr_helper(expr->arg1);
	    sprintf(expr_buf+errlen, " %s ", expr->sval);
	    errlen+=4;
	}
	if (errlen < MAXERRLEN) {
	    show_expr_helper(expr->arg2);
	    sprintf(expr_buf+errlen, ")");
	    errlen+=1;
	}
	break;
    case N_ELE:
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "(");
	    errlen+=1;
	    show_expr_helper(expr->arg1);
	    sprintf(expr_buf+errlen, " in {");
	    errlen+=5;
	}
	for (ele = expr->arg2; ele; ele=ele->next) {
	    if (errlen < MAXERRLEN) {
		show_expr_helper(ele);
		if (ele->next) {
		    sprintf(expr_buf+errlen, ", ");
		    errlen+=2;
		}
	    }
	}
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "})");
	    errlen+=2;
	}
	break;
    case N_CASE:
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "[ ");
	    errlen+=2;
	}
	for (ele = expr; errlen < MAXERRLEN && ele; ele=ele->next) {
	    show_expr_helper(ele->arg1);
	    sprintf(expr_buf+errlen, " : ");
	    errlen += 3;
	    show_expr_helper(ele->arg2);
	}
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, " ]");
	    errlen+=2;
	}
	break;
    default:
	if (errlen < MAXERRLEN) {
	    sprintf(expr_buf+errlen, "??");
	    errlen+=2;
	}
	break;
    }
}

static char *show_expr(node_ptr expr)
{
    errlen = 0;
    show_expr_helper(expr);
    if (errlen >= MAXERRLEN)
	sprintf(expr_buf+errlen, "...");
    return expr_buf;
}

/* Recursively generate code for function */
static void gen_expr(node_ptr expr)
{
    node_ptr ele;
    switch(expr->type) {
    case N_QUOTE:
	yyserror("Unexpected quoted string", expr->sval);
	break;
    case N_VAR:
	{
	    node_ptr qstring = find_symbol(expr->sval);
	    if (qstring)
#if defined(VLOG) || defined(UCLID)
		outgen_print("%s", expr->sval);
#else
		outgen_print("(%s)", qstring->sval);
#endif
	    else
		yyserror("Invalid variable '%s'", expr->sval);
#ifdef UCLID
	    check_for_arg(expr->sval);
#endif
	    
	}
	break;
    case N_NUM:
#ifdef UCLID
      {
	long long int val = atoll(expr->sval);
	if (val < -1)
	  outgen_print("pred^%d(CZERO)", -val);
	else if (val == -1)
	  outgen_print("pred(CZERO)");
	else if (val == 0)
	  outgen_print("CZERO");
	else if (val == 1)
	  outgen_print("succ(CZERO)");
	else
	  outgen_print("succ^%d(CZERO)", val);
      }
#else /* !UCLID */
 	fputs(expr->sval, outfile);
#endif /* UCLID */
	break;
    case N_AND:
	outgen_print("(");
	outgen_upindent();
	gen_expr(expr->arg1);
	outgen_print(" & ");
	gen_expr(expr->arg2);
	outgen_print(")");
	outgen_downindent();
	break;
    case N_OR:
	outgen_print("(");
	outgen_upindent();
	gen_expr(expr->arg1);
	outgen_print(" | ");
	gen_expr(expr->arg2);
	outgen_print(")");
	outgen_downindent();
	break;
    case N_NOT:
#if defined(VLOG) || defined(UCLID)
	outgen_print("~");
#else
	outgen_print("!");
#endif
	gen_expr(expr->arg1);
	break;
    case N_COMP:
	outgen_print("(");
	outgen_upindent();
	gen_expr(expr->arg1);
#ifdef UCLID
	{
	  char *cval = expr->sval;
	  if (strcmp(cval, "==") == 0)
	    cval = "=";
	  outgen_print(" %s ", cval);
	}
#else /* !UCLID */
	outgen_print(" %s ", expr->sval);
#endif /* UCLID */
	gen_expr(expr->arg2);
	outgen_print(")");
	outgen_downindent();
	break;
    case N_ELE:
	outgen_print("(");
	outgen_upindent();
	for (ele = expr->arg2; ele; ele=ele->next) {
	    gen_expr(expr->arg1);
#ifdef UCLID
	    outgen_print(" = ");
#else
	    outgen_print(" == ");
#endif
	    gen_expr(ele);
	    if (ele->next)
#if defined(VLOG) || defined(UCLID)
		outgen_print(" | ");
#else
		outgen_print(" || ");
#endif
	}
	outgen_print(")");
	outgen_downindent();
	break;
    case N_CASE:
#ifdef UCLID
      outgen_print("case");
      outgen_terminate();
      {
	  /* Use this to keep track of last case when no default is given */
	  node_ptr last_arg2 = NULL;
	  for (ele = expr; ele; ele=ele->next) {
	      outgen_print("      ");
	      if (ele->arg1->type == N_NUM && atoll(ele->arg1->sval) == 1) {
		  outgen_print("default");
		  last_arg2 = NULL;
	      }
	      else {
		  gen_expr(ele->arg1);
		  last_arg2 = ele->arg2;
	      }
	      outgen_print(" : ");
	      gen_expr(ele->arg2);
	      outgen_print(";");
	      outgen_terminate();
	  }
	  if (last_arg2) {
	      /* Use final case as default */
	      outgen_print("      default : ");
	      gen_expr(last_arg2);
	      outgen_print(";");
	      outgen_terminate();
	  }
      }
      outgen_print("    esac");
#else /* !UCLID */
	outgen_print("(");
	outgen_upindent();
	int done = 0;
	for (ele = expr; ele && !done; ele=ele->next) {
	  if (ele->arg1->type == N_NUM && atoll(ele->arg1->sval) == 1) {
	    gen_expr(ele->arg2);
	    done = 1;
	  } else {
	    gen_expr(ele->arg1);
	    outgen_print(" ? ");
	    gen_expr(ele->arg2);
	    outgen_print(" : ");
	  }
	}
	if (!done)
	  outgen_print("0");
	outgen_print(")");
	outgen_downindent();
#endif
	break;
    default:
	yyerror("Unknown node type");
	break;
    }
}


/* Generate code defining function for var */
void gen_funct(node_ptr var, node_ptr expr, int isbool)
{
    if (!var || !expr) {
	yyerror("Null node");
	return;
    }
    check_arg(expr, isbool);
#ifdef VLOG
    outgen_print("assign %s = ", var->sval);
    outgen_terminate();
    outgen_print("    ");
    gen_expr(expr);
    outgen_print(";");
    outgen_terminate();
    outgen_terminate();
#else /* !VLOG */
#ifdef UCLID
    if (annotate) {
	/* Print annotation information*/
	outgen_print("(* $define %s *)", var->sval);
	outgen_terminate();
    }
    outgen_print("%s := ", var->sval);
    outgen_terminate();
    outgen_print("    ");
    if (isbool && expr->type == N_NUM) {
      outgen_print("%d", atoll(var->sval));
    } else
      gen_expr(expr);
    outgen_print(";");
    outgen_terminate();
    if (annotate) {
	int i;
	outgen_print("(* $args");
	for (i = 0; i < arg_cnt; i++)
	    outgen_print("%c%s", i == 0 ? ' ' : ':', arg_names[i]);
	outgen_print(" *)");
	outgen_terminate();
	arg_cnt = 0;
    }
    outgen_terminate();
#else /* !UCLID */
    /* Print function header */
    outgen_print("long long gen_%s()", var->sval);
    outgen_terminate();
    outgen_print("{");
    outgen_terminate();
    outgen_print("    return ");
    gen_expr(expr);
    outgen_print(";");
    outgen_terminate();
    outgen_print("}");
    outgen_terminate();
    outgen_terminate();
#endif /* UCLID */
#endif /* VLOG */
}
