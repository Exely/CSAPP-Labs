/* Assembler for Y86-64 instruction set */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "yas.h"
#include "isa.h"

void add_symbol(char *, int);
int find_symbol(char *);
int instr_size(char *);

int gui_mode = 0;

FILE *outfile;

int verbose = 0;
/* Generate initialized memory for Verilog? */
int vcode = 0;

/* Should it generate code for banked memory? */
int block_factor = 0;

int lineno = 1; /* Line number of input file */
int bytepos = 0; /* Address of current instruction being processed */
int error_mode = 0; /* Am I trying to finish off a line with an error? */
int hit_error = 0; /* Have I hit any errors? */

int pass = 1; /* Am I in pass 1 or 2? */

/* General strategy is to read tokens for a complete line and then
   process them.
*/
#define TOK_PER_LINE 12

/* Token types */
typedef enum{ TOK_IDENT, TOK_NUM, TOK_REG, TOK_INSTR, TOK_PUNCT, TOK_ERR }
  token_t;

/* Token representation */
typedef struct {
    char *sval; /* String    */
    word_t ival;   /* Integer   */
    char cval;  /* Character */
    token_t type; /* Type    */
} token_rec, *token_ptr;

/* Information about current input line */
token_rec tokens[TOK_PER_LINE];
int lineno;  /* What line number am I processing? */
int bytepos; /* What byte address is the current instruction */
int tcount;  /* How many tokens are there in this line? */
int tpos;    /* What token am I currently processing */

/* Storage for strings in current line */
#define STRMAX 4096
char strbuf[STRMAX];
int strpos;

/* Storage of current line */
char input_line[STRMAX];

void save_line(char *s)
{
    int len = strlen(s);
    int i;
    if (len >= STRMAX)
	fail("Input Line too long");
    strcpy(input_line, s);
    for (i = len-1; input_line[i] == '\n' || input_line[i] == '\r'; i--)
	input_line[i] = '\0'; /* Remove terminator */
}

/* Information about current instruction being generated */
char code[10];     /* Byte encoding */
int codepos = 0;  /* Current position in byte encoding */
int bcount = 0;   /* Length of current instruction */

/* Debugging information */
char token_type_names[] = {'I', 'N', 'R', 'X', 'P'};

void print_token(FILE *out, token_ptr t)
{
    fprintf(out, " [%c ", token_type_names[t->type]);
    switch(t->type) {
    case TOK_IDENT:
    case TOK_REG:
    case TOK_INSTR:
	fprintf(out, "%s]", t->sval);
	break;
    case TOK_NUM:
	fprintf(out, "%lld]", t->ival);
	break;
    case TOK_PUNCT:
	fprintf(out, "%c]", t->cval);
	break;
    case TOK_ERR:
	fprintf(out, "ERR]");
	break;
    default:
	fprintf(out, "?]");
	fail("Unknown token type");
    }
}

/* For debugging */
void print_instruction(FILE *out)
{
    int i;
    fprintf(out, "Line %d, Byte %d: ", lineno, bytepos);
    for (i = 0; i < tcount; i++)
	print_token(out, &tokens[i]);
    fprintf(out, " Code: ");
    for (i = 0; i < bcount; i++)
	fprintf(out, "%.2x ", code[i] & 0xFF);
    fprintf(out, "\n");
}

/* Write len least significant hex digits of value at dest.
   Don't null terminate */
static void hexstuff(char *dest, word_t value, int len)
{
    int i;
    for (i = 0; i < len; i++) {
	char c;
	int h = (value >> 4*i) & 0xF;
	c = h < 10 ? h + '0' : h - 10 + 'a';
	dest[len-i-1] = c;
    }
}

void print_code(FILE *out, int pos)
{
    char outstring[33];
    if (pos > 0xFFF) {
	/* Printing format:
	   0xHHHH: cccccccccccccccccccc | <line>
	   where HHHH is address
	   cccccccccccccccccccc is code
	*/
	if (tcount) {
	    int i;
	    if (pos > 0xFFFF) {
		fail("Code address limit exceeded");
		exit(1);
	    }
	    strcpy(outstring, "0x0000:                      | ");
	    hexstuff(outstring+2, pos, 4);
	    for (i = 0; i < bcount; i++)
		hexstuff(outstring+7+2*i, code[i]&0xFF, 2);
	}
	else
	    strcpy(outstring, "                             | ");
    } else {
	/* Printing format:
	   0xHHH: cccccccccccccccccccc | <line>
	   where HHH is address
	   cccccccccccccccccccc is code
	*/
	if (tcount) {
	    int i;
	    if (pos > 0xFFF) {
		fail("Code address limit exceeded");
		exit(1);
	    }
	    strcpy(outstring, "0x000:                      | ");
	    hexstuff(outstring+2, pos, 3);
	    for (i = 0; i < bcount; i++)
		hexstuff(outstring+7+2*i, code[i]&0xFF, 2);
	}
	else
	    strcpy(outstring, "                            | ");
    }
    if (vcode) {
      fprintf(out, "//%s%s\n", outstring, input_line);
      if (tcount) {
	int i;
	for (i = 0; tcount && i < bcount; i++) {
	    if (block_factor) {
		fprintf(out, "    bank%d[%d] = 8\'h%.2x;\n", (pos+i)%block_factor, (pos+i)/block_factor, code[i] & 0xFF);
	    } else {
		fprintf(out, "    mem[%d] = 8\'h%.2x;\n", pos+i, code[i] & 0xFF);
	    }
	}
      }
    } else {
      fprintf(out, "%s%s\n", outstring, input_line);
    }
}

void fail(char *message)
{
    if (!error_mode) {
	fprintf(stderr, "Error on line %d: %s\n", lineno, message);
	fprintf(stderr, "Line %d, Byte 0x%.4x: %s\n",
		lineno, bytepos, input_line);
    }
    error_mode = 1;
    hit_error = 1;
}

/* Parse Register from set of tokens and put into high or low
   4 bits of code[codepos] */
void get_reg(int codepos, int hi)
{
    int rval = REG_NONE;
    char c;
    if (tokens[tpos].type != TOK_REG) {
	fail("Expecting Register ID");
	return;
    } else {
	rval = find_register(tokens[tpos].sval);
    }
    /* Insert into output */
    c = code[codepos];
    if (hi)
	c = (c & 0x0F) | (rval << 4);
    else
	c = (c & 0xF0) | rval;
    code[codepos] = c;
    tpos++;
}

/* Get numeric value of given number of bytes */
/* Offset indicates value to subtract from number (for PC relative) */
void get_num(int codepos, int bytes, int offset)
{
    word_t val = 0;
    int i;
    if (tokens[tpos].type == TOK_NUM) {
	val = tokens[tpos].ival;
    } else if (tokens[tpos].type == TOK_IDENT) {
	val = find_symbol(tokens[tpos].sval);
    } else {
	fail("Number Expected");
	return;
    }
    val -= offset;
    for (i = 0; i < bytes; i++)
	code[codepos+i] = (val >> (i * 8)) & 0xFF;
    tpos++;
}


/* Get memory reference.
   Can be of form:
   Num(Reg)
   (Reg)
   Num
   Ident
   Ident(Reg)
   Put Reg in low position of current byte, and Number in following bytes
   */
void get_mem(int codepos)
{
    char rval = REG_NONE;
    word_t val = 0;
    int i;
    char c;
    token_t type = tokens[tpos].type;
    /* Deal with optional displacement */
    if (type == TOK_NUM) {
	val = tokens[tpos++].ival;
	type = tokens[tpos].type;
    } else if (type == TOK_IDENT) {
	val = find_symbol(tokens[tpos++].sval);
	type = tokens[tpos].type;    
    }
    /* Check for optional register */
    if (type == TOK_PUNCT) {
	if (tokens[tpos].cval == '(') {
	    tpos++;
	    if (tokens[tpos].type == TOK_REG)
		rval = find_register(tokens[tpos++].sval);
	    else {
		fail("Expecting Register Id");
		return;
	    }
	    if (tokens[tpos].type != TOK_PUNCT ||
		tokens[tpos++].cval != ')') {
		fail("Expecting ')'");
		return;
	    }
	}
    }
    c = (code[codepos] & 0xF0) | (rval & 0xF);
    code[codepos++] = c;
    for (i = 0; i < 8; i++)
	code[codepos+i] = (val >> (i*8)) & 0xFF;
}

void start_line()
{
    int t;
    error_mode = 0;
    tpos = 0;
    tcount = 0;
    bcount = 0;
    strpos = 0;
    for (t = 0; t < TOK_PER_LINE; t++)
	tokens[t].type = TOK_ERR;
}

void finish_line()
{
    int size;
    instr_ptr instr;
    int savebytepos = bytepos;
    tpos = 0;
    codepos = 0;
    if (tcount == 0) {
	if (pass > 1)
	    print_code(outfile, savebytepos);
	start_line();
	return; /* Empty line */
    }
    /* Completion of an erroneous line */
    if (error_mode) {
	start_line();
	return;
    }

    /* See if this is a labeled line */
    if (tokens[0].type == TOK_IDENT) {
	if (tokens[1].type != TOK_PUNCT ||
	    tokens[1].cval != ':') {
	    fail("Missing Colon");
	    start_line();
	    return;
	} else {
	    if (pass == 1)
		add_symbol(tokens[0].sval, bytepos);
	    tpos+=2;
	    if (tcount == 2) {
		/* That's all for this line */
		if (pass > 1)
		    print_code(outfile, savebytepos);
		start_line();
		return;
	    }
	}
    }
    /* Get instruction */
    if (tokens[tpos].type != TOK_INSTR) {
	fail("Bad Instruction");
	start_line();
	return;
    }
    /* Process .pos */
    if (strcmp(tokens[tpos].sval, ".pos") == 0) {
	if (tokens[++tpos].type != TOK_NUM) {
	    fail("Invalid Address");
	    start_line();
	    return;
	}
	bytepos = tokens[tpos].ival;
	if (pass > 1) {
	    print_code(outfile, bytepos);
	}
	start_line();
	return;
    }
    /* Process .align */
    if (strcmp(tokens[tpos].sval, ".align") == 0) {
	int a;
	if (tokens[++tpos].type != TOK_NUM || (a=tokens[tpos].ival) <= 0) {
	    fail("Invalid Alignment");
	    start_line();
	    return;
	}
	bytepos = ((bytepos+a-1)/a)*a;

	if (pass > 1) {
	    print_code(outfile, bytepos);
	}
	start_line();
	return;
    }
    /* Get instruction size */
    instr = find_instr(tokens[tpos++].sval);
    if (instr == NULL) {
	fail("Invalid Instruction");
	instr = bad_instr();
    }
    size = instr->bytes;
    bytepos += size;
    bcount = size;


    /* If this is pass 1, then we're done */
    if (pass == 1) {
	start_line();
	return;
    }

    /* Here's where we really process the instructions */
    code[0] = instr->code;
    code[1] = HPACK(REG_NONE, REG_NONE);
    switch(instr->arg1) {
    case R_ARG:
	get_reg(instr->arg1pos, instr->arg1hi);
	break;
    case M_ARG:
	get_mem(instr->arg1pos);
	break;
    case I_ARG:
	get_num(instr->arg1pos, instr->arg1hi, 0);
	break;
    case NO_ARG:
    default:
	break;
    }
    if (instr->arg2 != NO_ARG) {
	/* Get comma  */
	if (tokens[tpos].type != TOK_PUNCT ||
	    tokens[tpos].cval != ',') {
	    fail("Expecting Comma");
	    start_line();
	    return;
	}
	tpos++;
    
	/* Get second argument */ 
	switch(instr->arg2) {
	case R_ARG:
	    get_reg(instr->arg2pos, instr->arg2hi);
	    break;
	case M_ARG:
	    get_mem(instr->arg2pos);
	    break;
	case I_ARG:
	    get_num(instr->arg2pos, instr->arg2hi, 0);
	    break;
	case NO_ARG:
	default:
	    break;
	}
    }

    print_code(outfile, savebytepos);
    start_line();
}

void add_token(token_t type, char *s, word_t i, char c)
{
    char *t = NULL;
    if (!tcount)
	start_line();
    if (tpos >= TOK_PER_LINE-1) {
	fail("Line too long");
	return;
    }
    if (s) {
	int len = strlen(s)+1;
	if (strpos + len > STRMAX) {
	    fail("Line too long");
	    return;
	}
	t = strcpy(strbuf+strpos, s);
	strpos+= len;
    }
    tokens[tcount].type = type;
    tokens[tcount].sval = t;
    tokens[tcount].ival = i;
    tokens[tcount].cval = c;
    tcount++;
}

void add_ident(char *s)
{
    add_token(TOK_IDENT, s, 0, ' ');
}

void add_instr(char *s)
{
    add_token(TOK_INSTR, s, 0, ' ');
}

void add_reg(char *s)
{
    add_token(TOK_REG, s, 0, ' ');
}

void add_num(long long i)
{
    add_token(TOK_NUM, NULL, i, ' ');
}

void add_punct(char c)
{
    add_token(TOK_PUNCT, NULL, 0, c);
}

#define STAB 1000

#define INIT_CNT 0

int symbol_cnt = INIT_CNT;
struct {
    char *name;
    int pos;
} symbol_table[STAB];

void add_symbol(char *name, int p)
{
    char *t = (char *) malloc(strlen(name)+1);
    strcpy(t, name);
    symbol_table[symbol_cnt].name = t;
    symbol_table[symbol_cnt].pos = p;
    symbol_cnt++;
}

int find_symbol(char *name)
{
    int i;
    for (i = 0; i < symbol_cnt; i++)
	if (strcmp(name, symbol_table[i].name) == 0)
	    return symbol_table[i].pos;
    fail("Can't find label");
    return -1;
}

int yywrap()
{
    int i;
    if (tcount > 0) {
	fail("Missing end-of-line on final line\n");
    }
    if (verbose && pass > 1) {
	printf("Symbol Table:\n");
	for (i = INIT_CNT; i < symbol_cnt; i++)
	    printf(" %s\t0x%x\n", symbol_table[i].name, symbol_table[i].pos);
    }
    return 1;
}

extern FILE *yyin;
int yylex();

static void usage(char *pname)
{
    printf("Usage: %s [-V[n]] file.ys\n", pname);
    printf("   -V[n]  Generate memory initialization in Verilog format (n-way blocking)\n");
    exit(0);
}

int main(int argc, char *argv[])
{
    int rootlen;
    char infname[512];
    char outfname[512];
    int nextarg = 1;
    if (argc < 2)
	usage(argv[0]);
    if (argv[nextarg][0] == '-') {
      char flag = argv[nextarg][1];
      switch (flag) {
      case 'V':
	vcode = 1;
	if (argv[nextarg][2]) {
	    block_factor = atoi(argv[nextarg]+2);
	    if (block_factor != 8) {
		fprintf(stderr, "Unknown blocking factor %d\n", block_factor);
		exit(1);
	    }
	}
	nextarg++;
	break;
      default:
	usage(argv[0]);
      }
    }
    rootlen = strlen(argv[nextarg])-3;
    if (strcmp(argv[nextarg]+rootlen, ".ys"))
	usage(argv[0]);
    if (rootlen > 500) {
	fprintf(stderr, "File name too long\n");
	exit(1);
    }
    strncpy(infname, argv[nextarg], rootlen);
    strcpy(infname+rootlen, ".ys");

    yyin = fopen(infname, "r");
    if (!yyin) {
	fprintf(stderr, "Can't open input file '%s'\n", infname);
	exit(1);
    }

    if (vcode) {
      outfile = stdout;
    } else {
      strncpy(outfname, argv[nextarg], rootlen);
      strcpy(outfname+rootlen, ".yo");
      outfile = fopen(outfname, "w");
      if (!outfile) {
	fprintf(stderr, "Can't open output file '%s'\n", outfname);
	exit(1);
      }
    }

    pass = 1;

    yylex();
    fclose(yyin);

    if (hit_error)
	exit(1);

    pass = 2;
    lineno = 1;
    error_mode = 0;
    bytepos = 0;
    yyin = fopen(infname, "r");
    if (!yyin) {
	fprintf(stderr, "Can't open input file '%s'\n", infname);
	exit(1);
    }

    yylex();
    fclose(yyin);
    fclose(outfile);
    return hit_error;
}

unsigned long long atollh(const char *p) {
    return strtoull(p, (char **) NULL, 16);
}
