/***********************************************************************
 *
 * ssim.c - Sequential Y86-64 simulator
 * 
 * Copyright (c) 2002, 2015. Bryant and D. O'Hallaron, All rights reserved.
 * May not be used, modified, or copied without permission.
 ***********************************************************************/ 

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include <string.h>
#include "isa.h"
#include "sim.h"

#define MAXBUF 1024

#ifdef HAS_GUI
#include <tk.h>
#endif /* HAS_GUI */

#define MAXARGS 128
#define MAXBUF 1024
#define TKARGS 3

/***************
 * Begin Globals
 ***************/

/* Simulator name defined and initialized by the compiled HCL file */
/* according to the -n argument supplied to hcl2c */
extern char simname[];

/* SEQ=0, SEQ+=1. Modified by HCL main() */
int plusmode = 0; 

/* Parameters modifed by the command line */
int gui_mode = FALSE;    /* Run in GUI mode instead of TTY mode? (-g) */
char *object_filename;   /* The input object file name. */
FILE *object_file;       /* Input file handle */
bool_t verbosity = 2;    /* Verbosity level [TTY only] (-v) */ 
word_t instr_limit = 10000; /* Instruction limit [TTY only] (-l) */
bool_t do_check = FALSE; /* Test with YIS? [TTY only] (-t) */

/************* 
 * End Globals 
 *************/


/***************************
 * Begin function prototypes 
 ***************************/

static void usage(char *name);           /* Print helpful usage message */
static void run_tty_sim();               /* Run simulator in TTY mode */

#ifdef HAS_GUI
void addAppCommands(Tcl_Interp *interp); /* Add application-dependent commands */
#endif /* HAS_GUI */

/*************************
 * End function prototypes
 *************************/


/*******************************************************************
 * Part 1: This part is the initial entry point that handles general
 * initialization. It parses the command line and does any necessary
 * setup to run in either TTY or GUI mode, and then starts the
 * simulation.
 *******************************************************************/

/* 
 * sim_main - main simulator routine. This function is called from the
 * main() routine in the HCL file.
 */
int sim_main(int argc, char **argv)
{
    int i;
    int c;
    char *myargv[MAXARGS];

    
    /* Parse the command line arguments */
    while ((c = getopt(argc, argv, "htgl:v:")) != -1) {
	switch(c) {
	case 'h':
	    usage(argv[0]);
	    break;
	case 'l':
	    instr_limit = atoll(optarg);
	    break;
	case 'v':
	    verbosity = atoi(optarg);
	    if (verbosity < 0 || verbosity > 2) {
		printf("Invalid verbosity %d\n", verbosity);
		usage(argv[0]);
	    }
	    break;
	case 't':
	    do_check = TRUE;
	    break;
	case 'g':
	    gui_mode = TRUE;
	    break;
	default:
	    printf("Invalid option '%c'\n", c);
	    usage(argv[0]);
	    break;
	}
    }


    /* Do we have too many arguments? */
    if (optind < argc - 1) {
	printf("Too many command line arguments:");
	for (i = optind; i < argc; i++)
	    printf(" %s", argv[i]);
	printf("\n");
	usage(argv[0]);
    }


    /* The single unflagged argument should be the object file name */
    object_filename = NULL;
    object_file = NULL;
    if (optind < argc) {
	object_filename = argv[optind];
	object_file = fopen(object_filename, "r");
	if (!object_file) {
	    fprintf(stderr, "Couldn't open object file %s\n", object_filename);
	    exit(1);
	}
    }


    /* Run the simulator in GUI mode (-g flag) */
    if (gui_mode) {

#ifndef HAS_GUI
	printf("To run in GUI mode, you must recompile with the HAS_GUI constant defined.\n");
	exit(1);
#endif /* HAS_GUI */

	/* In GUI mode, we must specify the object file on command line */ 
	if (!object_file) {
	    printf("Missing object file argument in GUI mode\n");
	    usage(argv[0]);
	}

	/* Build the command line for the GUI simulator */
	for (i = 0; i < TKARGS; i++) {
	    if ((myargv[i] = malloc(MAXBUF*sizeof(char))) == NULL) {
		perror("malloc error");
		exit(1);
	    }
	}
	strcpy(myargv[0], argv[0]);

#if 0
	printf("argv[0]=%s\n", argv[0]);
	{
	    char buf[1000]; 
	    getcwd(buf, 1000);
	    printf("cwd=%s\n", buf);
	}
#endif

	if (plusmode == 0) /* SEQ */
	    strcpy(myargv[1], "seq.tcl");
	else
	    strcpy(myargv[1], "seq+.tcl");
	strcpy(myargv[2], object_filename);
	myargv[3] = NULL;

	/* Start the GUI simulator */
#ifdef HAS_GUI
	Tk_Main(TKARGS, myargv, Tcl_AppInit);
#endif /* HAS_GUI */
	exit(0);
    }

    /* Otherwise, run the simulator in TTY mode (no -g flag) */
    run_tty_sim();

    exit(0);
}

/* 
 * run_tty_sim - Run the simulator in TTY mode
 */
static void run_tty_sim() 
{
    word_t icount = 0;
    status = STAT_AOK;
    cc_t result_cc = 0;
    word_t byte_cnt = 0;
    mem_t mem0, reg0;
    state_ptr isa_state = NULL;


    /* In TTY mode, the default object file comes from stdin */
    if (!object_file) {
	object_file = stdin;
    }

    /* Initializations */
    if (verbosity >= 2)
	sim_set_dumpfile(stdout);
    sim_init();

    /* Emit simulator name */
    printf("%s\n", simname);

    byte_cnt = load_mem(mem, object_file, 1);
    if (byte_cnt == 0) {
	fprintf(stderr, "No lines of code found\n");
	exit(1);
    } else if (verbosity >= 2) {
	printf("%lld bytes of code read\n", byte_cnt);
    }
    fclose(object_file);
    if (do_check) {
	isa_state = new_state(0);
	free_mem(isa_state->r);
	free_mem(isa_state->m);
	isa_state->m = copy_mem(mem);
	isa_state->r = copy_mem(reg);
	isa_state->cc = cc;
    }

    mem0 = copy_mem(mem);
    reg0 = copy_mem(reg);
    

    icount = sim_run(instr_limit, &status, &result_cc);
    if (verbosity > 0) {
	printf("%lld instructions executed\n", icount);
	printf("Status = %s\n", stat_name(status));
	printf("Condition Codes: %s\n", cc_name(result_cc));
	printf("Changed Register State:\n");
	diff_reg(reg0, reg, stdout);
	printf("Changed Memory State:\n");
	diff_mem(mem0, mem, stdout);
    }
    if (do_check) {
	byte_t e = STAT_AOK;
	int step;
	bool_t match = TRUE;

	for (step = 0; step < instr_limit && e == STAT_AOK; step++) {
	    e = step_state(isa_state, stdout);
	}

	if (diff_reg(isa_state->r, reg, NULL)) {
	    match = FALSE;
	    if (verbosity > 0) {
		printf("ISA Register != Pipeline Register File\n");
		diff_reg(isa_state->r, reg, stdout);
	    }
	}
	if (diff_mem(isa_state->m, mem, NULL)) {
	    match = FALSE;
	    if (verbosity > 0) {
		printf("ISA Memory != Pipeline Memory\n");
		diff_mem(isa_state->m, mem, stdout);
	    }
	}
	if (isa_state->cc != result_cc) {
	    match = FALSE;
	    if (verbosity > 0) {
		printf("ISA Cond. Codes (%s) != Pipeline Cond. Codes (%s)\n",
		       cc_name(isa_state->cc), cc_name(result_cc));
	    }
	}
	if (match) {
	    printf("ISA Check Succeeds\n");
	} else {
	    printf("ISA Check Fails\n");
	}
    }
}



/*
 * usage - print helpful diagnostic information
 */
static void usage(char *name)
{
    printf("Usage: %s [-htg] [-l m] [-v n] file.yo\n", name);
    printf("file.yo required in GUI mode, optional in TTY mode (default stdin)\n");
    printf("   -h     Print this message\n");
    printf("   -g     Run in GUI mode instead of TTY mode (default TTY)\n");  
    printf("   -l m   Set instruction limit to m [TTY mode only] (default %lld)\n", instr_limit);
    printf("   -v n   Set verbosity level to 0 <= n <= 2 [TTY mode only] (default %d)\n", verbosity);
    printf("   -t     Test result against ISA simulator (yis) [TTY mode only]\n");
    exit(0);
}



/*********************************************************
 * Part 2: This part contains the core simulator routines.
 *********************************************************/

/**********************
 * Begin Part 2 Globals
 **********************/

/*
 * Variables related to hardware units in the processor
 */
mem_t mem;  /* Instruction and data memory */
word_t minAddr = 0;
word_t memCnt = 0;

/* Other processor state */
mem_t reg;               /* Register file */
cc_t cc = DEFAULT_CC;    /* Condition code register */
cc_t cc_in = DEFAULT_CC; /* Input to condition code register */

/* 
 * SEQ+: Results computed by previous instruction.
 * Used to compute PC in current instruction 
 */
byte_t prev_icode = I_NOP;
byte_t prev_ifun = 0;
word_t prev_valc = 0;
word_t prev_valm = 0;
word_t prev_valp = 0;
bool_t prev_bcond = FALSE;

byte_t prev_icode_in = I_NOP;
byte_t prev_ifun_in = 0;
word_t prev_valc_in = 0;
word_t prev_valm_in = 0;
word_t prev_valp_in = 0;
bool_t prev_bcond_in = FALSE;


/* Program Counter */
word_t pc = 0; /* Program counter value */
word_t pc_in = 0;/* Input to program counter */

/* Intermediate values */
byte_t imem_icode = I_NOP;
byte_t imem_ifun = F_NONE;
byte_t icode = I_NOP;
word_t ifun = 0;
byte_t instr = HPACK(I_NOP, F_NONE);
word_t ra = REG_NONE;
word_t rb = REG_NONE;
word_t valc = 0;
word_t valp = 0;
bool_t imem_error;
bool_t instr_valid;

word_t srcA = REG_NONE;
word_t srcB = REG_NONE;
word_t destE = REG_NONE;
word_t destM = REG_NONE;
word_t vala = 0;
word_t valb = 0;
word_t vale = 0;

bool_t bcond = FALSE;
bool_t cond = FALSE;
word_t valm = 0;
bool_t dmem_error;

bool_t mem_write = FALSE;
word_t mem_addr = 0;
word_t mem_data = 0;
byte_t status = STAT_AOK;


/* Values computed by control logic */
word_t gen_pc();  /* SEQ+ */
word_t gen_icode();
word_t gen_ifun();
word_t gen_need_regids();
word_t gen_need_valC();
word_t gen_instr_valid();
word_t gen_srcA();
word_t gen_srcB();
word_t gen_dstE();
word_t gen_dstM();
word_t gen_aluA();
word_t gen_aluB();
word_t gen_alufun();
word_t gen_set_cc();
word_t gen_mem_addr();
word_t gen_mem_data();
word_t gen_mem_read();
word_t gen_mem_write();
word_t gen_Stat();
word_t gen_new_pc();

/* Log file */
FILE *dumpfile = NULL;

#ifdef HAS_GUI
/* Representations of digits */
static char digits[16] =
    {'0', '1', '2', '3', '4', '5', '6', '7',
     '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
#endif /* HAS_GUI */

/********************
 * End Part 2 Globals
 ********************/

#ifdef HAS_GUI

/* Create string in hex/oct/binary format with leading zeros */
/* bpd denotes bits per digit  Should be in range 1-4,
   bpw denotes bits per word.*/
void wstring(uword_t x, int bpd, int bpw, char *str)
{
    int digit;
    uword_t mask = ((uword_t) 1 << bpd) - 1;
    for (digit = (bpw-1)/bpd; digit >= 0; digit--) {
	uword_t val = (x >> (digit * bpd)) & mask;
	*str++ = digits[val];
    }
    *str = '\0';
}

/* used for formatting instructions */
static char status_msg[128];

/* SEQ+ */
static char *format_prev()
{
    char istring[17];
    char mstring[17];
    char pstring[17];
    wstring(prev_valc, 4, 64, istring);
    wstring(prev_valm, 4, 64, mstring);
    wstring(prev_valp, 4, 64, pstring);
    sprintf(status_msg, "%c %s %s %s %s",
	    prev_bcond ? 'Y' : 'N',
	    iname(HPACK(prev_icode, prev_ifun)),
	    istring, mstring, pstring);

    return status_msg;
}

static char *format_pc()
{
    char pstring[17];
    wstring(pc, 4, 64, pstring);
    sprintf(status_msg, "%s", pstring);
    return status_msg;
}

static char *format_f()
{
    char valcstring[17];
    char valpstring[17];
    wstring(valc, 4, 64, valcstring);
    wstring(valp, 4, 64, valpstring);
    sprintf(status_msg, "%s %s %s %s %s", 
	    iname(HPACK(icode, ifun)),
	    reg_name(ra),
	    reg_name(rb),
	    valcstring,
	    valpstring);
    return status_msg;
}

static char *format_d()
{
    char valastring[17];
    char valbstring[17];
    wstring(vala, 4, 64, valastring);
    wstring(valb, 4, 64, valbstring);
    sprintf(status_msg, "%s %s %s %s %s %s",
	    valastring,
	    valbstring,
	    reg_name(destE),
	    reg_name(destM),
	    reg_name(srcA),
	    reg_name(srcB));

    return status_msg;
}

static char *format_e()
{
    char valestring[17];
    wstring(vale, 4, 64, valestring);
    sprintf(status_msg, "%c %s",
	    bcond ? 'Y' : 'N',
	    valestring);
    return status_msg;
}

static char *format_m()
{
    char valmstring[17];
    wstring(valm, 4, 64, valmstring);
    sprintf(status_msg, "%s", valmstring);
    return status_msg;
}

static char *format_npc()
{
    char npcstring[17];
    wstring(pc_in, 4, 64, npcstring);
    sprintf(status_msg, "%s", npcstring);
    return status_msg;
}
#endif /* HAS_GUI */

/* Report system state */
static void sim_report() {

#ifdef HAS_GUI
    if (gui_mode) {
	report_pc(pc);
	if (plusmode) {
	    report_state("PREV", format_prev());
	    report_state("PC", format_pc());
	} else {
	    report_state("OPC", format_pc());
	}
	report_state("F", format_f());
	report_state("D", format_d());
	report_state("E", format_e());
	report_state("M", format_m());
	if (!plusmode) {
	    report_state("NPC", format_npc());
	}
	show_cc(cc);
    }
#endif /* HAS_GUI */

}

static int initialized = 0;
void sim_init()
{

    /* Create memory and register files */
    initialized = 1;
    mem = init_mem(MEM_SIZE);
    reg = init_reg();
    sim_reset();
    clear_mem(mem);
}

void sim_reset()
{
    if (!initialized)
	sim_init();
    clear_mem(reg);
    minAddr = 0;
    memCnt = 0;

#ifdef HAS_GUI
    if (gui_mode) {
	signal_register_clear();
	create_memory_display();
	sim_report();
    }
#endif

    if (plusmode) {
	prev_icode = prev_icode_in = I_NOP;
	prev_ifun = prev_ifun_in = 0;
	prev_valc = prev_valc_in = 0;
	prev_valm = prev_valm_in = 0;
	prev_valp = prev_valp_in = 0;
	prev_bcond = prev_bcond_in = FALSE;
	pc = 0;
    } else {
	pc_in = 0;
    }
    cc = DEFAULT_CC;
    cc_in = DEFAULT_CC;
    destE = REG_NONE;
    destM = REG_NONE;
    mem_write = FALSE;
    mem_addr = 0;
    mem_data = 0;

    /* Reset intermediate values to clear display */
    icode = I_NOP;
    ifun = 0;
    instr = HPACK(I_NOP, F_NONE);
    ra = REG_NONE;
    rb = REG_NONE;
    valc = 0;
    valp = 0;

    srcA = REG_NONE;
    srcB = REG_NONE;
    destE = REG_NONE;
    destM = REG_NONE;
    vala = 0;
    valb = 0;
    vale = 0;

    cond = FALSE;
    bcond = FALSE;
    valm = 0;

    sim_report();
}

/* Update the processor state */
static void update_state()
{
    if (plusmode) {
	prev_icode = prev_icode_in;
	prev_ifun  = prev_ifun_in;
	prev_valc  = prev_valc_in;
	prev_valm  = prev_valm_in;
	prev_valp  = prev_valp_in;
	prev_bcond = prev_bcond_in;
    } else {
	pc = pc_in;
    }
    cc = cc_in;
    /* Writeback */
    if (destE != REG_NONE)
	set_reg_val(reg, destE, vale);
    if (destM != REG_NONE)
	set_reg_val(reg, destM, valm);

    if (mem_write) {
      /* Should have already tested this address */
      set_word_val(mem, mem_addr, mem_data);
	sim_log("Wrote 0x%llx to address 0x%llx\n", mem_data, mem_addr);
#ifdef HAS_GUI
	    if (gui_mode) {
		if (mem_addr % 8 != 0) {
		    /* Just did a misaligned write.
		       Need to display both words */
		    word_t align_addr = mem_addr & ~0x3;
		    word_t val;
		    get_word_val(mem, align_addr, &val);
		    set_memory(align_addr, val);
		    align_addr+=8;
		    get_word_val(mem, align_addr, &val);
		    set_memory(align_addr, val);
		} else {
		    set_memory(mem_addr, mem_data);
		}
	    }
#endif /* HAS_GUI */
    }
}

/* Execute one instruction */
/* Return resulting status */
static byte_t sim_step()
{
    word_t aluA;
    word_t aluB;
    word_t alufun;

    status = STAT_AOK;
    imem_error = dmem_error = FALSE;

    update_state(); /* Update state from last cycle */

    if (plusmode) {
	pc = gen_pc();
    }
    valp = pc;
    instr = HPACK(I_NOP, F_NONE);
    imem_error = !get_byte_val(mem, valp, &instr);
    if (imem_error) {
	sim_log("Couldn't fetch at address 0x%llx\n", valp);
    }
    imem_icode = HI4(instr);
    imem_ifun = LO4(instr);
    icode = gen_icode();
    ifun  = gen_ifun();
    instr_valid = gen_instr_valid();
    valp++;
    if (gen_need_regids()) {
	byte_t regids;
	if (get_byte_val(mem, valp, &regids)) {
	    ra = GET_RA(regids);
	    rb = GET_RB(regids);
	} else {
	    ra = REG_NONE;
	    rb = REG_NONE;
	    status = STAT_ADR;
	    sim_log("Couldn't fetch at address 0x%llx\n", valp);
	}
	valp++;
    } else {
	ra = REG_NONE;
	rb = REG_NONE;
    }

    if (gen_need_valC()) {
	if (get_word_val(mem, valp, &valc)) {
	} else {
	    valc = 0;
	    status = STAT_ADR;
	    sim_log("Couldn't fetch at address 0x%llx\n", valp);
	}
	valp+=8;
    } else {
	valc = 0;
    }
    sim_log("IF: Fetched %s at 0x%llx.  ra=%s, rb=%s, valC = 0x%llx\n",
	    iname(HPACK(icode,ifun)), pc, reg_name(ra), reg_name(rb), valc);

    if (status == STAT_AOK && icode == I_HALT) {
	status = STAT_HLT;
    }
    
    srcA = gen_srcA();
    if (srcA != REG_NONE) {
	vala = get_reg_val(reg, srcA);
    } else {
	vala = 0;
    }
    
    srcB = gen_srcB();
    if (srcB != REG_NONE) {
	valb = get_reg_val(reg, srcB);
    } else {
	valb = 0;
    }

    cond = cond_holds(cc, ifun);

    destE = gen_dstE();
    destM = gen_dstM();

    aluA = gen_aluA();
    aluB = gen_aluB();
    alufun = gen_alufun();
    vale = compute_alu(alufun, aluA, aluB);
    cc_in = cc;
    if (gen_set_cc())
	cc_in = compute_cc(alufun, aluA, aluB);

    bcond =  cond && (icode == I_JMP);

    mem_addr = gen_mem_addr();
    mem_data = gen_mem_data();


    if (gen_mem_read()) {
      dmem_error = dmem_error || !get_word_val(mem, mem_addr, &valm);
      if (dmem_error) {
	sim_log("Couldn't read at address 0x%llx\n", mem_addr);
      }
    } else
      valm = 0;

    mem_write = gen_mem_write();
    if (mem_write) {
      /* Do a test read of the data memory to make sure address is OK */
      word_t junk;
      dmem_error = dmem_error || !get_word_val(mem, mem_addr, &junk);
    }

    status = gen_Stat();

    if (plusmode) {
	prev_icode_in = icode;
	prev_ifun_in = ifun;
	prev_valc_in = valc;
	prev_valm_in = valm;
	prev_valp_in = valp;
	prev_bcond_in = bcond;
    } else {
	/* Update PC */
	pc_in = gen_new_pc();
    } 
    sim_report();
    return status;
}

/*
  Run processor until one of following occurs:
  - An error status is encountered in WB.
  - max_instr instructions have completed through WB

  Return number of instructions executed.
  if statusp nonnull, then will be set to status of final instruction
  if ccp nonnull, then will be set to condition codes of final instruction
*/
word_t sim_run(word_t max_instr, byte_t *statusp, cc_t *ccp)
{
    word_t icount = 0;
    byte_t run_status = STAT_AOK;
    while (icount < max_instr) {
	run_status = sim_step();
	icount++;
	if (run_status != STAT_AOK)
	    break;
    }
    if (statusp)
	*statusp = run_status;
    if (ccp)
	*ccp = cc;
    return icount;
}

/* If dumpfile set nonNULL, lots of status info printed out */
void sim_set_dumpfile(FILE *df)
{
    dumpfile = df;
}

/*
 * sim_log dumps a formatted string to the dumpfile, if it exists
 * accepts variable argument list
 */
void sim_log( const char *format, ... ) {
    if (dumpfile) {
	va_list arg;
	va_start( arg, format );
	vfprintf( dumpfile, format, arg );
	va_end( arg );
    }
}


/*************************************************************
 * Part 3: This part contains simulation control for the TK
 * simulator. 
 *************************************************************/

#ifdef HAS_GUI

/**********************
 * Begin Part 3 globals	
 **********************/

/* Hack for SunOS */
extern int matherr();
int *tclDummyMathPtr = (int *) matherr;

static char tcl_msg[256];

/* Keep track of the TCL Interpreter */
static Tcl_Interp *sim_interp = NULL;

static mem_t post_load_mem;

/**********************
 * End Part 3 globals	
 **********************/


/* function prototypes */
int simResetCmd(ClientData clientData, Tcl_Interp *interp,
		int argc, char *argv[]);
int simLoadCodeCmd(ClientData clientData, Tcl_Interp *interp,
		   int argc, char *argv[]);
int simLoadDataCmd(ClientData clientData, Tcl_Interp *interp,
		   int argc, char *argv[]);
int simRunCmd(ClientData clientData, Tcl_Interp *interp,
	      int argc, char *argv[]);
void addAppCommands(Tcl_Interp *interp);

/******************************************************************************
 *	tcl command definitions
 ******************************************************************************/

/* Implement command versions of the simulation functions */
int simResetCmd(ClientData clientData, Tcl_Interp *interp,
		int argc, char *argv[])
{
    sim_interp = interp;
    if (argc != 1) {
	interp->result = "No arguments allowed";
	return TCL_ERROR;
    }
    sim_reset();
    if (post_load_mem) {
	free_mem(mem);
	mem = copy_mem(post_load_mem);
    }
    interp->result = stat_name(STAT_AOK);
    return TCL_OK;
}

int simLoadCodeCmd(ClientData clientData, Tcl_Interp *interp,
		   int argc, char *argv[])
{
    FILE *object_file;
    word_t code_count;
    sim_interp = interp;
    if (argc != 2) {
	interp->result = "One argument required";
	return TCL_ERROR;
    }
    object_file = fopen(argv[1], "r");
    if (!object_file) {
	sprintf(tcl_msg, "Couldn't open code file '%s'", argv[1]);
	interp->result = tcl_msg;
	return TCL_ERROR;
    }
    sim_reset();
    code_count = load_mem(mem, object_file, 0);
    post_load_mem = copy_mem(mem);
    sprintf(tcl_msg, "%lld", code_count);
    interp->result = tcl_msg;
    fclose(object_file);
    return TCL_OK;
}

int simLoadDataCmd(ClientData clientData, Tcl_Interp *interp,
		   int argc, char *argv[])
{
    FILE *data_file;
    word_t word_count = 0;
    interp->result = "Not implemented";
    return TCL_ERROR;


    sim_interp = interp;
    if (argc != 2) {
	interp->result = "One argument required";
	return TCL_ERROR;
    }
    data_file = fopen(argv[1], "r");
    if (!data_file) {
	sprintf(tcl_msg, "Couldn't open data file '%s'", argv[1]);
	interp->result = tcl_msg;
	return TCL_ERROR;
    }
    sprintf(tcl_msg, "%lld", word_count);
    interp->result = tcl_msg;
    fclose(data_file);
    return TCL_OK;
}


int simRunCmd(ClientData clientData, Tcl_Interp *interp,
	      int argc, char *argv[])
{
    word_t step_limit = 1;
    byte_t run_status;
    cc_t cc;
    sim_interp = interp;
    if (argc > 2) {
	interp->result = "At most one argument allowed";
	return TCL_ERROR;
    }
    if (argc >= 2 &&
	(sscanf(argv[1], "%lld", &step_limit) != 1 ||
	 step_limit < 0)) {
	sprintf(tcl_msg, "Cannot run for '%s' cycles!", argv[1]);
	interp->result = tcl_msg;
	return TCL_ERROR;
    }
    sim_run(step_limit, &run_status, &cc);
    interp->result = stat_name(run_status);
    return TCL_OK;
}

/******************************************************************************
 *	registering the commands with tcl
 ******************************************************************************/

void addAppCommands(Tcl_Interp *interp)
{
    sim_interp = interp;
    Tcl_CreateCommand(interp, "simReset", (Tcl_CmdProc *) simResetCmd,
		      (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL);
    Tcl_CreateCommand(interp, "simCode", (Tcl_CmdProc *) simLoadCodeCmd,
		      (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL);
    Tcl_CreateCommand(interp, "simData", (Tcl_CmdProc *) simLoadDataCmd,
		      (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL);
    Tcl_CreateCommand(interp, "simRun", (Tcl_CmdProc *) simRunCmd,
		      (ClientData) NULL, (Tcl_CmdDeleteProc *) NULL);
} 

/******************************************************************************
 *	tcl functionality called from within C
 ******************************************************************************/

/* Provide mechanism for simulator to update register display */
void signal_register_update(reg_id_t r, word_t val) {
    int code;
    sprintf(tcl_msg, "setReg %d %lld 1", (int) r, (word_t) val);
    code = Tcl_Eval(sim_interp, tcl_msg);
    if (code != TCL_OK) {
	fprintf(stderr, "Failed to signal register set\n");
	fprintf(stderr, "Error Message was '%s'\n", sim_interp->result);
    }
}

/* Provide mechanism for simulator to generate memory display */
void create_memory_display() {
    int code;
    sprintf(tcl_msg, "createMem %lld %lld", minAddr, memCnt);
    code = Tcl_Eval(sim_interp, tcl_msg);
    if (code != TCL_OK) {
	fprintf(stderr, "Command '%s' failed\n", tcl_msg);
	fprintf(stderr, "Error Message was '%s'\n", sim_interp->result);
    } else {
	word_t i;
	for (i = 0; i < memCnt && code == TCL_OK; i+=8) {
	    word_t addr = minAddr+i;
	    word_t val;
	    if (!get_word_val(mem, addr, &val)) {
		fprintf(stderr, "Out of bounds memory display\n");
		return;
	    }
	    sprintf(tcl_msg, "setMem %lld %lld", addr, val);
	    code = Tcl_Eval(sim_interp, tcl_msg);
	}
	if (code != TCL_OK) {
	    fprintf(stderr, "Couldn't set memory value\n");
	    fprintf(stderr, "Error Message was '%s'\n", sim_interp->result);
	}
    }
}

/* Provide mechanism for simulator to update memory value */
void set_memory(word_t addr, word_t val) {
    int code;
    word_t nminAddr = minAddr;
    word_t nmemCnt = memCnt;

    /* First see if we need to expand memory range */
    if (memCnt == 0) {
	nminAddr = addr;
	nmemCnt = 8;
    } else if (addr < minAddr) {
	nminAddr = addr;
	nmemCnt = minAddr + memCnt - addr;
    } else if (addr >= minAddr+memCnt) {
	nmemCnt = addr-minAddr+8;
    }
    /* Now make sure nminAddr & nmemCnt are multiples of 16 */
    nmemCnt = ((nminAddr & 0xF) + nmemCnt + 0xF) & ~0xF;
    nminAddr = nminAddr & ~0xF;

    if (nminAddr != minAddr || nmemCnt != memCnt) {
	minAddr = nminAddr;
	memCnt = nmemCnt;
	create_memory_display();
    } else {
	sprintf(tcl_msg, "setMem %lld %lld", addr, val);
	code = Tcl_Eval(sim_interp, tcl_msg);
	if (code != TCL_OK) {
	    fprintf(stderr, "Couldn't set memory value 0x%llx to 0x%llx\n",
		    addr, val);
	    fprintf(stderr, "Error Message was '%s'\n", sim_interp->result);
	}
    }
}

/* Provide mechanism for simulator to update condition code display */
void show_cc(cc_t cc)
{
    int code;
    sprintf(tcl_msg, "setCC %d %d %d",
	    GET_ZF(cc), GET_SF(cc), GET_OF(cc));
    code = Tcl_Eval(sim_interp, tcl_msg);
    if (code != TCL_OK) {
	fprintf(stderr, "Failed to display condition codes\n");
	fprintf(stderr, "Error Message was '%s'\n", sim_interp->result);
    }
}

/* Provide mechanism for simulator to clear register display */
void signal_register_clear() {
    int code;
    code = Tcl_Eval(sim_interp, "clearReg");
    if (code != TCL_OK) {
	fprintf(stderr, "Failed to signal register clear\n");
	fprintf(stderr, "Error Message was '%s'\n", sim_interp->result);
    }
}

/* Provide mechanism for simulator to report instructions as they are 
   read in
*/

void report_line(word_t line_no, word_t addr, char *hex, char *text) {
    int code;
    sprintf(tcl_msg, "addCodeLine %lld %lld {%s} {%s}", line_no, addr, hex, text);
    code = Tcl_Eval(sim_interp, tcl_msg);
    if (code != TCL_OK) {
	fprintf(stderr, "Failed to report code line 0x%llx\n", addr);
	fprintf(stderr, "Error Message was '%s'\n", sim_interp->result);
    }
}


/* Provide mechanism for simulator to report which instruction
   is being executed */
void report_pc(word_t pc)
{
    int t_status;
    char addr[18];
    char code[20];
    Tcl_DString cmd;
    Tcl_DStringInit(&cmd);
    Tcl_DStringAppend(&cmd, "simLabel ", -1);
    Tcl_DStringStartSublist(&cmd);
    sprintf(addr, "%llu", pc);
    Tcl_DStringAppendElement(&cmd, addr);

    Tcl_DStringEndSublist(&cmd);
    Tcl_DStringStartSublist(&cmd);
    sprintf(code, "%s","*");
    Tcl_DStringAppend(&cmd, code, -1);
    Tcl_DStringEndSublist(&cmd);
    t_status = Tcl_Eval(sim_interp, Tcl_DStringValue(&cmd));
    if (t_status != TCL_OK) {
	fprintf(stderr, "Failed to report code '%s'\n", code);
	fprintf(stderr, "Error Message was '%s'\n", sim_interp->result);
    }
}

/* Report single line of stage state */
void report_state(char *id, char *txt)
{
    int t_status;
    sprintf(tcl_msg, "updateStage %s {%s}", id, txt);
    t_status = Tcl_Eval(sim_interp, tcl_msg);
    if (t_status != TCL_OK) {
	fprintf(stderr, "Failed to report processor status\n");
	fprintf(stderr, "\tStage %s, status '%s'\n",
		id, txt);
	fprintf(stderr, "\tError Message was '%s'\n", sim_interp->result);
    }
}

/*
 * Tcl_AppInit - Called by TCL to perform application-specific initialization.
 */
int Tcl_AppInit(Tcl_Interp *interp)
{
    /* Tell TCL about the name of the simulator so it can  */
    /* use it as the title of the main window */
    Tcl_SetVar(interp, "simname", simname, TCL_GLOBAL_ONLY);

    if (Tcl_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
    if (Tk_Init(interp) == TCL_ERROR)
	return TCL_ERROR;
    Tcl_StaticPackage(interp, "Tk", Tk_Init, Tk_SafeInit);

    /* Call procedure to add new commands */
    addAppCommands(interp);

    /*
     * Specify a user-specific startup file to invoke if the application
     * is run interactively.  Typically the startup file is "~/.apprc"
     * where "app" is the name of the application.  If this line is deleted
     * then no user-specific startup file will be run under any conditions.
     */
    Tcl_SetVar(interp, "tcl_rcFileName", "~/.wishrc", TCL_GLOBAL_ONLY);
    return TCL_OK;

}

 
#endif /* HAS_GUI */
