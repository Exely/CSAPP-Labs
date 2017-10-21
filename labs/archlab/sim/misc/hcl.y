%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "node.h"
#define YYSTYPE node_ptr

/* Current line number.  Maintained by lex */
int lineno = 1;
#define ERRLIM 5
int errcnt = 0;



FILE *outfile;

int yyparse(void);
int yylex(void);

void yyerror(const char *str)
{
  fprintf(stderr, "Error, near line %d: %s\n", lineno, str);
  if (++errcnt > ERRLIM) {
      fprintf(stderr, "Too many errors, aborting\n");
      exit(1);
  }
}

static char errmsg[1024];
void yyserror(const char *str, char *other)
{
    sprintf(errmsg, str, other);
    yyerror(errmsg);
}

int yywrap()
{
  return 1;
}
  
int main(int argc, char **argv)
{
    init_node(argc, argv);
    outfile = stdout;
    yyparse();
    finish_node(0);
    return errcnt != 0;
}

%}

%token QUOTE BOOLARG BOOL WORDARG WORD QSTRING
  VAR NUM ASSIGN SEMI COLON COMMA LPAREN RPAREN LBRACE 
  RBRACE LBRACK RBRACK AND OR NOT COMP IN

/* All operators are left associative.  Listed from lowest to highest */
%left OR
%left AND
%left NOT
%left COMP
%left IN

%%

statements: /* empty */
       | statements statement
       ;

statement:
       QUOTE QSTRING                       { insert_code($2); }
       | BOOLARG VAR QSTRING               { add_arg($2, $3, 1); }
       | WORDARG VAR QSTRING                { add_arg($2, $3, 0); }
       | BOOL VAR ASSIGN expr SEMI         { gen_funct($2, $4, 1); }
       | WORD VAR ASSIGN expr SEMI          { gen_funct($2, $4, 0); }
       ;

expr:
       VAR                    { $$=$1; }
       | NUM                  { $$=$1; }
       | LPAREN expr RPAREN   { $$=$2; }
       | NOT expr             { $$=make_not($2); }
       | expr AND expr        { $$=make_and($1, $3); }
       | expr OR expr         { $$=make_or($1, $3); }
       | expr COMP expr       { $$=make_comp($2,$1,$3); }
       | expr IN LBRACE exprlist RBRACE     { $$=make_ele($1, $4);}
       | LBRACK caselist RBRACK { $$=$2; } 
       ;

exprlist:
       expr { $$=$1; }
       | exprlist COMMA expr { $$=concat($1, $3); }

caselist:
       /* Empty */ { $$=NULL; }
       | caselist expr COLON expr SEMI { $$=concat($1, make_case($2, $4));}

