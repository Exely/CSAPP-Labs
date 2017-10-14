/* Grammar for Y86-64 Assembler */
 #include "yas.h"

Instr         rrmovq|cmovle|cmovl|cmove|cmovne|cmovge|cmovg|rmmovq|mrmovq|irmovq|addq|subq|andq|xorq|jmp|jle|jl|je|jne|jge|jg|call|ret|pushq|popq|"."byte|"."word|"."long|"."quad|"."pos|"."align|halt|nop|iaddq
Letter        [a-zA-Z]
Digit         [0-9]
Ident         {Letter}({Letter}|{Digit}|_)*
Hex           [0-9a-fA-F]
Blank         [ \t]
Newline       [\n\r]
Return        [\r]
Char          [^\n\r]
Reg           %rax|%rcx|%rdx|%rbx|%rsi|%rdi|%rsp|%rbp|%r8|%r9|%r10|%r11|%r12|%r13|%r14

%x ERR COM
%%

^{Char}*{Return}*{Newline}      { save_line(yytext); REJECT;} /* Snarf input line */
#{Char}*{Return}*{Newline}      {finish_line(); lineno++;}
"//"{Char}*{Return}*{Newline}     {finish_line(); lineno++;}
"/*"{Char}*{Return}*{Newline}   {finish_line(); lineno++;}
{Blank}*{Return}*{Newline}      {finish_line(); lineno++;}

{Blank}+          ;
"$"+              ;
{Instr}           add_instr(yytext);
{Reg}             add_reg(yytext);
[-]?{Digit}+      add_num(atoll(yytext));
"0"[xX]{Hex}+     add_num(atollh(yytext));
[():,]            add_punct(*yytext);
{Ident}           add_ident(yytext);
{Char}            {; BEGIN ERR;}
<ERR>{Char}*{Newline} {fail("Invalid line"); lineno++; BEGIN 0;}
%%

unsigned int atoh(const char *s)
{
    return(strtoul(s, NULL, 16));
}
