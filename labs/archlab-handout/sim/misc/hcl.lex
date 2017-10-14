%{
#include <stdio.h>
#include "node.h"
#define YYSTYPE node_ptr
#include "hcl.tab.h"


extern YYSTYPE yylval;
extern int lineno;
%}
%%
[ \r\t\f]              ;
[\n]                  lineno++;
"#".*\n               lineno++ ;
quote                 return(QUOTE);
boolsig               return(BOOLARG);
bool                  return(BOOL);
wordsig               return(WORDARG);
word                   return(WORD);
in                    return(IN);
'[^']*'               yylval = make_quote(yytext); return(QSTRING);
[a-zA-Z][a-zA-Z0-9_]* yylval = make_var(yytext); return(VAR);
[0-9][0-9]*           yylval = make_num(yytext); return(NUM);
-[0-9][0-9]*          yylval = make_num(yytext); return(NUM);
"="                   return(ASSIGN);
";"                   return(SEMI);
":"                   return(COLON);
","                   return(COMMA);
"("                   return(LPAREN);
")"                   return(RPAREN);
"{"                   return(LBRACE);
"}"                   return(RBRACE);
"["                   return(LBRACK);
"]"                   return(RBRACK);
"&&"                   return(AND);
"||"                   return(OR);
"!="                  yylval = make_var(yytext); return(COMP);
"=="                  yylval = make_var(yytext); return(COMP);
"<"                   yylval = make_var(yytext); return(COMP);
"<="                  yylval = make_var(yytext); return(COMP);
">"                   yylval = make_var(yytext); return(COMP);
">="                  yylval = make_var(yytext); return(COMP);
"!"                   return(NOT);
%%

