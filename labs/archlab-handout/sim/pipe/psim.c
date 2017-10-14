/**************************************************************************
 * psim.c - Pipelined Y86-64 simulator
 * 
 * Copyright (c) 2010, 2015. Bryant and D. O'Hallaron, All rights reserved.
 * May not be used, modified, or copied without permission.
 **************************************************************************/ 

#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <unistd.h>
#include <string.h>

#include "isa.h"
#include "pipeline.h"
#include "stages.h"
#include "sim.h"

#define MAXBUF 1024
#define DEFAULTNAME "Y86-64 Simulator: "

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
extern  char simname[];

/* Parameters modifed by the command line */
int gui_mode = FALSE;    /* Run in GUI mode instead of TTY mode? (-g) */
char *object_filename;   /* The input object file name. */
FILE *object_file;       /* Input file handle */
bool_t verbosity = 2;    /* Verbosity level [TTY only] (-v) */ 
word_t instr_limit = 10000; /* Instruction limit [TTY only] (-l) */
bool_t do_check = FALSE; /* Test with ISA simulator? [TTY only] (-t) */

/************* 
 * End Globals 
 *************/


/***************************
 * Begin function prototypes 
 ***************************/

word_t sim_run_pipe(word_t max_instr, word_t max_cycle, byte_t *statusp, cc_t *ccp);
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
	strcpy(myargv[1], "pipe.tcl");
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
    byte_t run_status = STAT_AOK;
    cc_t result_cc = 0;
    word_t byte_cnt = 0;
    mem_t mem0, reg0;
    state_ptr isa_state = NULL;


    /* In TTY mode, the default object file comes from stdin */
    if (!object_file) {
	object_file = stdin;
    }

    if (verbosity >= 2)
	sim_set_dumpfile(stdout);
    sim_init();

    /* Emit simulator name */
    if (verbosity >= 2)
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
    
    icount = sim_run_pipe(instr_limit, 5*instr_limit, &run_status, &result_cc);
    if (verbosity > 0) {
	printf("%lld instructions executed\n", icount);
	printf("Status = %s\n", stat_name(run_status));
	printf("Condition Codes: %s\n", cc_name(result_cc));
	printf("Changed Register State:\n");
	diff_reg(reg0, reg, stdout);
	printf("Changed Memory State:\n");
	diff_mem(mem0, mem, stdout);
    }
    if (do_check) {
	byte_t e = STAT_AOK;
	word_t step;
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

    /* Emit CPI statistics */
    {
	double cpi = instructions > 0 ? (double) cycles/instructions : 1.0;
	printf("CPI: %lld cycles/%lld instructions = %.2f\n",
	       cycles, instructions, cpi);
    }

}

/*
 * usage - print helpful diagnostic information
 */
static void usage(char *name)
{
    printf("Usage: %s [-htg] [-l m] [-v n] file.yo\n", name);
    printf("file.yo arg required in GUI mode, optional in TTY mode (default stdin)\n");
    printf("   -h     Print this message\n");
    printf("   -g     Run in GUI mode instead of TTY mode (default TTY)\n");  
    printf("   -l m   Set instruction limit to m [TTY mode only] (default %lld)\n", instr_limit);
    printf("   -v n   Set verbosity level to 0 <= n <= 2 [TTY mode only] (default %d)\n", verbosity);
    printf("   -t     Test result against ISA simulator [TTY mode only]\n");
    exit(0);
}


/*********************************************************
 * Part 2: This part contains the core simulator routines.
 *********************************************************/


/*****************
 *  Part 2 Globals
 *****************/

/* Performance monitoring */
/* How many cycles have been simulated? */
word_t cycles = 0;
/* How many instructions have passed through the WB stage? */
word_t instructions = 0;

/* Has simulator gotten past initial bubbles? */
static int starting_up = 1;



/* Both instruction and data memory */
mem_t mem;
word_t minAddr = 0;
word_t memCnt = 0;

/* Register file */
mem_t reg;
/* Condition code register */
cc_t cc;
/* Status code */
stat_t status;


/* Pending updates to state */
word_t cc_in = DEFAULT_CC;
word_t wb_destE = REG_NONE;
word_t wb_valE = 0;
word_t wb_destM = REG_NONE;
word_t wb_valM = 0;
word_t mem_addr = 0;
word_t mem_data = 0;
bool_t mem_write = FALSE;

/* EX Operand sources */
mux_source_t amux = MUX_NONE;
mux_source_t bmux = MUX_NONE;

/* Current and next states of all pipeline registers */
pc_ptr pc_curr;
if_id_ptr if_id_curr;
id_ex_ptr id_ex_curr;
ex_mem_ptr ex_mem_curr;
mem_wb_ptr mem_wb_curr;

pc_ptr pc_next;
if_id_ptr if_id_next;
id_ex_ptr id_ex_next;
ex_mem_ptr ex_mem_next;
mem_wb_ptr mem_wb_next;

/* Intermediate values */
word_t f_pc;
byte_t imem_icode;
byte_t imem_ifun;
bool_t imem_error;
bool_t instr_valid;
word_t d_regvala;
word_t d_regvalb;
word_t e_vala;
word_t e_valb;
bool_t e_bcond;
bool_t dmem_error;

/* The pipeline state */
pipe_ptr pc_state, if_id_state, id_ex_state, ex_mem_state, mem_wb_state;

/* Simulator operating mode */
sim_mode_t sim_mode = S_FORWARD;
/* Log file */
FILE *dumpfile = NULL;

/*****************************************************************************
 * reporting code
 *****************************************************************************/

#ifdef HAS_GUI
/* used for formatting instructions */
static char status_msg[128];

static char *format_pc(pc_ptr state)
{
    char pstring[17];
    wstring(state->pc, 4, 64, pstring);
    sprintf(status_msg, "%s %s", stat_name(state->status), pstring);
    return status_msg;
}

static char *format_if_id(if_id_ptr state)
{
    char valcstring[17];
    char valpstring[17];
    wstring(state->valc, 4, 64, valcstring);
    wstring(state->valp, 4, 64, valpstring);
    sprintf(status_msg, "%s %s %s %s %s %s",
	    stat_name(state->status),
	    iname(HPACK(state->icode,state->ifun)),
	    reg_name(state->ra),
	    reg_name(state->rb),
	    valcstring,
	    valpstring);
    return status_msg;
}

static char *format_id_ex(id_ex_ptr state)
{
    char valcstring[17];
    char valastring[17];
    char valbstring[17];
    wstring(state->valc, 4, 64, valcstring);
    wstring(state->vala, 4, 64, valastring);
    wstring(state->valb, 4, 64, valbstring);
    sprintf(status_msg, "%s %s %s %s %s %s %s %s %s",
	    stat_name(state->status),
	    iname(HPACK(state->icode, state->ifun)),
	    valcstring,
	    valastring,
	    valbstring,
	    reg_name(state->deste),
	    reg_name(state->destm),
	    reg_name(state->srca),
	    reg_name(state->srcb));
    return status_msg;
}

static char *format_ex_mem(ex_mem_ptr state)
{
    char valestring[17];
    char valastring[17];
    wstring(state->vale, 4, 64, valestring);
    wstring(state->vala, 4, 64, valastring);
    sprintf(status_msg, "%s %s %c %s %s %s %s",
	    stat_name(state->status),
	    iname(HPACK(state->icode, state->ifun)),
	    state->takebranch ? 'Y' : 'N',
	    valestring,
	    valastring,
	    reg_name(state->deste),
	    reg_name(state->destm));

    return status_msg;
}

static char *format_mem_wb(mem_wb_ptr state)
{
    char valestring[17];
    char valmstring[17];
    wstring(state->vale, 4, 64, valestring);
    wstring(state->valm, 4, 64, valmstring);
    sprintf(status_msg, "%s %s %s %s %s %s",
	    stat_name(state->status),
	    iname(HPACK(state->icode, state->ifun)),
	    valestring,
	    valmstring,
	    reg_name(state->deste),
	    reg_name(state->destm));

    return status_msg;
}
#endif /* HAS_GUI */

/* Report system state */
static void sim_report() 
{

#ifdef HAS_GUI
    if (gui_mode) {
	report_pc(f_pc, pc_curr->status != STAT_BUB,
		  if_id_curr->stage_pc, if_id_curr->status != STAT_BUB,
		  id_ex_curr->stage_pc, id_ex_curr->status != STAT_BUB,
		  ex_mem_curr->stage_pc, ex_mem_curr->status != STAT_BUB,
		  mem_wb_curr->stage_pc, mem_wb_curr->status != STAT_BUB);
	report_state("F", 0, format_pc(pc_next));
	report_state("F", 1, format_pc(pc_curr));
	report_state("D", 0, format_if_id(if_id_next));
	report_state("D", 1, format_if_id(if_id_curr));
	report_state("E", 0, format_id_ex(id_ex_next));
	report_state("E", 1, format_id_ex(id_ex_curr));
	report_state("M", 0, format_ex_mem(ex_mem_next));
	report_state("M", 1, format_ex_mem(ex_mem_curr));
	report_state("W", 0, format_mem_wb(mem_wb_next));
	report_state("W", 1, format_mem_wb(mem_wb_curr));
	/* signal_sources(); */
	show_cc(cc);
	show_stat(status);
	show_cpi();
    }
#endif

}

/*****************************************************************************
 * pipeline control
 * These functions can be used to handle hazards
 *****************************************************************************/

/* bubble stage (has effect at next update) */
void sim_bubble_stage(stage_id_t stage) 
{
    switch (stage)
	{
	case IF_STAGE : pc_state->op     = P_BUBBLE; break;
	case ID_STAGE : if_id_state->op  = P_BUBBLE; break;
	case EX_STAGE : id_ex_state->op  = P_BUBBLE; break;
	case MEM_STAGE: ex_mem_state->op = P_BUBBLE; break;
	case WB_STAGE : mem_wb_state->op = P_BUBBLE; break;
	}
}

/* stall stage (has effect at next update) */
void sim_stall_stage(stage_id_t stage) {
    switch (stage)
	{
	case IF_STAGE : pc_state->op     = P_STALL; break;
	case ID_STAGE : if_id_state->op  = P_STALL; break;
	case EX_STAGE : id_ex_state->op  = P_STALL; break;
	case MEM_STAGE: ex_mem_state->op = P_STALL; break;
	case WB_STAGE : mem_wb_state->op = P_STALL; break;
	}
}


static int initialized = 0;

void sim_init()
{
    /* Create memory and register files */
    initialized = 1;
    mem = init_mem(MEM_SIZE);
    reg = init_reg();
    
    /* create 5 pipe registers */
    pc_state     = new_pipe(sizeof(pc_ele), (void *) &bubble_pc);
    if_id_state  = new_pipe(sizeof(if_id_ele), (void *) &bubble_if_id);
    id_ex_state  = new_pipe(sizeof(id_ex_ele), (void *) &bubble_id_ex);
    ex_mem_state = new_pipe(sizeof(ex_mem_ele), (void *) &bubble_ex_mem);
    mem_wb_state = new_pipe(sizeof(mem_wb_ele), (void *) &bubble_mem_wb);
  
    /* connect them to the pipeline stages */
    pc_next   = pc_state->next;
    pc_curr   = pc_state->current;
  
    if_id_next = if_id_state->next;
    if_id_curr = if_id_state->current;

    id_ex_next = id_ex_state->next;
    id_ex_curr = id_ex_state->current;

    ex_mem_next = ex_mem_state->next;
    ex_mem_curr = ex_mem_state->current;

    mem_wb_next = mem_wb_state->next;
    mem_wb_curr = mem_wb_state->current;

    sim_reset();
    clear_mem(mem);
}

void sim_reset()
{
    if (!initialized)
	sim_init();
    clear_pipes();
    clear_mem(reg);
    minAddr = 0;
    memCnt = 0;
    starting_up = 1;
    cycles = instructions = 0;
    cc = DEFAULT_CC;
    status = STAT_AOK;

#ifdef HAS_GUI
    if (gui_mode) {
	signal_register_clear();
	create_memory_display();
    }
#endif

    amux = bmux = MUX_NONE;
    cc = cc_in = DEFAULT_CC;
    wb_destE = REG_NONE;
    wb_valE = 0;
    wb_destM = REG_NONE;
    wb_valM = 0;
    mem_addr = 0;
    mem_data = 0;
    mem_write = FALSE;
    sim_report();
}

/* Update state elements */
/* May need to disable updating of memory & condition codes */
static void update_state(bool_t update_mem, bool_t update_cc)
{
    /* Writeback(s):
       If either register is REG_NONE, write will have no effect .
       Order of two writes determines semantics of
       popl %rsp.  According to ISA, %rsp will get popped value
    */

    if (wb_destE != REG_NONE) {
	sim_log("\tWriteback: Wrote 0x%llx to register %s\n",
		wb_valE, reg_name(wb_destE));
	set_reg_val(reg, wb_destE, wb_valE);
    }
    if (wb_destM != REG_NONE) {
	sim_log("\tWriteback: Wrote 0x%llx to register %s\n",
		wb_valM, reg_name(wb_destM));
	set_reg_val(reg, wb_destM, wb_valM);
    }

    /* Memory write */
    if (mem_write && !update_mem) {
	sim_log("\tDisabled write of 0x%llx to address 0x%llx\n", mem_data, mem_addr);
    }
    if (update_mem && mem_write) {
	if (!set_word_val(mem, mem_addr, mem_data)) {
	    sim_log("\tCouldn't write to address 0x%llx\n", mem_addr);
	} else {
	    sim_log("\tWrote 0x%llx to address 0x%llx\n", mem_data, mem_addr);

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
#endif

	}
    }
    if (update_cc)
	cc = cc_in;
}

/* Text representation of status */
void tty_report(word_t cyc) {
  sim_log("\nCycle %lld. CC=%s, Stat=%s\n", cyc, cc_name(cc), stat_name(status));

  sim_log("F: predPC = 0x%llx\n", pc_curr->pc);

  sim_log("D: instr = %s, rA = %s, rB = %s, valC = 0x%llx, valP = 0x%llx, Stat = %s\n",
	  iname(HPACK(if_id_curr->icode, if_id_curr->ifun)),
	  reg_name(if_id_curr->ra), reg_name(if_id_curr->rb),
	  if_id_curr->valc, if_id_curr->valp,
	  stat_name(if_id_curr->status));

  sim_log("E: instr = %s, valC = 0x%llx, valA = 0x%llx, valB = 0x%llx\n   srcA = %s, srcB = %s, dstE = %s, dstM = %s, Stat = %s\n",
	  iname(HPACK(id_ex_curr->icode, id_ex_curr->ifun)),
	  id_ex_curr->valc, id_ex_curr->vala, id_ex_curr->valb,
	  reg_name(id_ex_curr->srca), reg_name(id_ex_curr->srcb),
	  reg_name(id_ex_curr->deste), reg_name(id_ex_curr->destm),
	  stat_name(id_ex_curr->status));

  sim_log("M: instr = %s, Cnd = %d, valE = 0x%llx, valA = 0x%llx\n   dstE = %s, dstM = %s, Stat = %s\n",
	  iname(HPACK(ex_mem_curr->icode, ex_mem_curr->ifun)),
	  ex_mem_curr->takebranch,
	  ex_mem_curr->vale, ex_mem_curr->vala,
	  reg_name(ex_mem_curr->deste), reg_name(ex_mem_curr->destm),
	  stat_name(ex_mem_curr->status));

  sim_log("W: instr = %s, valE = 0x%llx, valM = 0x%llx, dstE = %s, dstM = %s, Stat = %s\n",
	  iname(HPACK(mem_wb_curr->icode, mem_wb_curr->ifun)),
	  mem_wb_curr->vale, mem_wb_curr->valm,
	  reg_name(mem_wb_curr->deste), reg_name(mem_wb_curr->destm),
	  stat_name(mem_wb_curr->status));
}

/* Run pipeline for one cycle */
/* Return status of processor */
/* Max_instr indicates maximum number of instructions that
   want to complete during this simulation run.  */
static byte_t sim_step_pipe(word_t max_instr, word_t ccount)
{
    byte_t wb_status = mem_wb_curr->status;
    byte_t mem_status = mem_wb_next->status;
    /* How many instructions are ahead of one in wb / ex? */
    int ahead_mem = (wb_status != STAT_BUB);
    int ahead_ex = ahead_mem + (mem_status != STAT_BUB);
    bool_t update_mem = ahead_mem < max_instr;
    bool_t update_cc = ahead_ex < max_instr;

    /* Update program-visible state */
    update_state(update_mem, update_cc);
    /* Update pipe registers */
    update_pipes();
    tty_report(ccount);
    if (pc_state->op == P_ERROR)
	pc_curr->status = STAT_PIP;
    if (if_id_state->op == P_ERROR)
	if_id_curr->status = STAT_PIP;
    if (id_ex_state->op == P_ERROR)
	id_ex_curr->status = STAT_PIP;
    if (ex_mem_state->op == P_ERROR)
	ex_mem_curr->status = STAT_PIP;
    if (mem_wb_state->op == P_ERROR)
	mem_wb_curr->status = STAT_PIP;
    
    /* Need to do decode after execute & memory stages,
       and memory stage before execute, in order to propagate
       forwarding values properly */
    do_if_stage();
    do_mem_stage();
    do_ex_stage();
    do_id_wb_stages();

    do_stall_check();
#if 0
    /* This doesn't seem necessary */
    if (id_ex_curr->status != STAT_AOK
	&& id_ex_curr->status != STAT_BUB) {
	if_id_state->op = P_BUBBLE;
	id_ex_state->op = P_BUBBLE;
    }
#endif

    /* Performance monitoring */
    if (mem_wb_curr->status != STAT_BUB && mem_wb_curr->icode != I_POP2) {
	starting_up = 0;
	instructions++;
	cycles++;
    } else {
	if (!starting_up)
	    cycles++;
    }
    
    sim_report();
    return status;
}

/*
  Run pipeline until one of following occurs:
  - An error status is encountered in WB.
  - max_instr instructions have completed through WB
  - max_cycle cycles have been simulated

  Return number of instructions executed.
  if statusp nonnull, then will be set to status of final instruction
  if ccp nonnull, then will be set to condition codes of final instruction
*/
word_t sim_run_pipe(word_t max_instr, word_t max_cycle, byte_t *statusp, cc_t *ccp)
{
    word_t icount = 0;
    word_t ccount = 0;
    byte_t run_status = STAT_AOK;
    while (icount < max_instr && ccount < max_cycle) {
        run_status = sim_step_pipe(max_instr-icount, ccount);
	if (run_status != STAT_BUB)
	    icount++;
	if (run_status != STAT_AOK && run_status != STAT_BUB)
	    break;
	ccount++;
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
 * Part 3: This part contains support for the GUI simulator
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


/******************************************************************************
 *	function declarations
 ******************************************************************************/

int simResetCmd(ClientData clientData, Tcl_Interp *interp,
		int argc, char *argv[]);

int simLoadCodeCmd(ClientData clientData, Tcl_Interp *interp,
		   int argc, char *argv[]);

int simLoadDataCmd(ClientData clientData, Tcl_Interp *interp,
		   int argc, char *argv[]);

int simRunCmd(ClientData clientData, Tcl_Interp *interp,
	      int argc, char *argv[]);

int simModeCmd(ClientData clientData, Tcl_Interp *interp,
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
    FILE *code_file;
    word_t code_count;
    sim_interp = interp;
    if (argc != 2) {
	interp->result = "One argument required";
	return TCL_ERROR;
    }
    code_file = fopen(argv[1], "r");
    if (!code_file) {
	sprintf(tcl_msg, "Couldn't open code file '%s'", argv[1]);
	interp->result = tcl_msg;
	return TCL_ERROR;
    }
    sim_reset();
    code_count = load_mem(mem, code_file, 0);
    post_load_mem = copy_mem(mem);
    sprintf(tcl_msg, "%lld", code_count);
    interp->result = tcl_msg;
    fclose(code_file);
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
    word_t cycle_limit = 1;
    byte_t status;
    cc_t cc;
    sim_interp = interp;
    if (argc > 2) {
	interp->result = "At most one argument allowed";
	return TCL_ERROR;
    }
    if (argc >= 2 &&
	(sscanf(argv[1], "%lld", &cycle_limit) != 1 ||
	 cycle_limit < 0)) {
	sprintf(tcl_msg, "Cannot run for '%s' cycles!", argv[1]);
	interp->result = tcl_msg;
	return TCL_ERROR;
    }
    sim_run_pipe(cycle_limit + 5, cycle_limit, &status, &cc);
    interp->result = stat_name(status);
    return TCL_OK;
}

int simModeCmd(ClientData clientData, Tcl_Interp *interp,
	       int argc, char *argv[])
{
    sim_interp = interp;
    if (argc != 2) {
	interp->result = "One argument required";
	return TCL_ERROR;
    }
    interp->result = argv[1];
    if (strcmp(argv[1], "wedged") == 0)
	sim_mode = S_WEDGED;
    else if (strcmp(argv[1], "stall") == 0)
	sim_mode = S_STALL;
    else if (strcmp(argv[1], "forward") == 0)
	sim_mode = S_FORWARD;
    else {
	sprintf(tcl_msg, "Unknown mode '%s'", argv[1]);
	interp->result = tcl_msg;
	return TCL_ERROR;
    }
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
    Tcl_CreateCommand(interp, "setSimMode", (Tcl_CmdProc *) simModeCmd,
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

/* Provide mechanism for simulator to update status display */
void show_stat(stat_t stat)
{
    int code;
    sprintf(tcl_msg, "showStat %s", stat_name(stat));
    code = Tcl_Eval(sim_interp, tcl_msg);
    if (code != TCL_OK) {
	fprintf(stderr, "Failed to display status\n");
	fprintf(stderr, "Error Message was '%s'\n", sim_interp->result);
    }
}



/* Provide mechanism for simulator to update performance information */
void show_cpi() {
    int code;
    double cpi = instructions > 0 ? (double) cycles/instructions : 1.0;
    sprintf(tcl_msg, "showCPI %lld %lld %.2f",
	    cycles, instructions, (double) cpi);
    code = Tcl_Eval(sim_interp, tcl_msg);
    if (code != TCL_OK) {
	fprintf(stderr, "Failed to display CPI\n");
	fprintf(stderr, "Error Message was '%s'\n", sim_interp->result);
    }
}

char *rname[] = {"none", "ea", "eb", "me", "wm", "we"};

/* provide mechanism for simulator to specify source registers */
void signal_sources() {
    int code;
    sprintf(tcl_msg, "showSources %s %s",
	    rname[amux], rname[bmux]);
    code = Tcl_Eval(sim_interp, tcl_msg);
    if (code != TCL_OK) {
	fprintf(stderr, "Failed to signal forwarding sources\n");
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


/* Provide mechanism for simulator to report which instructions are in
   which stages */
void report_pc(unsigned fpc, unsigned char fpcv,
	       unsigned dpc, unsigned char dpcv,
	       unsigned epc, unsigned char epcv,
	       unsigned mpc, unsigned char mpcv,
	       unsigned wpc, unsigned char wpcv)
{
    int status;
    char addr[10];
    char code[12];
    Tcl_DString cmd;
    Tcl_DStringInit(&cmd);
    Tcl_DStringAppend(&cmd, "simLabel ", -1);
    Tcl_DStringStartSublist(&cmd);
    if (fpcv) {
	sprintf(addr, "%u", fpc);
	Tcl_DStringAppendElement(&cmd, addr);
    }
    if (dpcv) {
	sprintf(addr, "%u", dpc);
	Tcl_DStringAppendElement(&cmd, addr);
    }
    if (epcv) {
	sprintf(addr, "%u", epc);
	Tcl_DStringAppendElement(&cmd, addr);
    }
    if (mpcv) {
	sprintf(addr, "%u", mpc);
	Tcl_DStringAppendElement(&cmd, addr);
    }
    if (wpcv) {
	sprintf(addr, "%u", wpc);
	Tcl_DStringAppendElement(&cmd, addr);
    }
    Tcl_DStringEndSublist(&cmd);
    Tcl_DStringStartSublist(&cmd);
    sprintf(code, "%s %s %s %s %s",
	    fpcv ? "F" : "",
	    dpcv ? "D" : "",
	    epcv ? "E" : "",
	    mpcv ? "M" : "",
	    wpcv ? "W" : "");
    Tcl_DStringAppend(&cmd, code, -1);
    Tcl_DStringEndSublist(&cmd);
    /* Debug 
       fprintf(stderr, "Code '%s'\n", Tcl_DStringValue(&cmd));
    */
    status = Tcl_Eval(sim_interp, Tcl_DStringValue(&cmd));
    if (status != TCL_OK) {
	fprintf(stderr, "Failed to report pipe code '%s'\n", code);
	fprintf(stderr, "Error Message was '%s'\n", sim_interp->result);
    }
}

/* Report single line of pipeline state */
void report_state(char *id, word_t current, char *txt)
{
    int status;
    sprintf(tcl_msg, "updateStage %s %lld {%s}", id, current,txt);
    status = Tcl_Eval(sim_interp, tcl_msg);
    if (status != TCL_OK) {
	fprintf(stderr, "Failed to report pipe status\n");
	fprintf(stderr, "\tStage %s.%s, status '%s'\n",
		id, current ? "current" : "next", txt);
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


/**************************************************************
 * Part 4: Code for implementing pipelined processor simulators
 *************************************************************/

/******************************************************************************
 *	defines
 ******************************************************************************/

#define MAX_STAGE 10

/******************************************************************************
 *	static variables
 ******************************************************************************/

static pipe_ptr pipes[MAX_STAGE];
static int pipe_count = 0;

/******************************************************************************
 *	function definitions
 ******************************************************************************/

/* Create new pipe with count bytes of state */
/* bubble_val indicates state corresponding to pipeline bubble */
pipe_ptr new_pipe(int count, void *bubble_val)
{
  pipe_ptr result = (pipe_ptr) malloc(sizeof(pipe_ele));
  result->current = malloc(count);
  result->next = malloc(count);
  memcpy(result->current, bubble_val, count);
  memcpy(result->next, bubble_val, count);
  result->count = count;
  result->op = P_LOAD;
  result->bubble_val = bubble_val;
  pipes[pipe_count++] = result; 
  return result;
}

/* Update all pipes */
void update_pipes()
{
  int s;
  for (s = 0; s < pipe_count; s++) {
    pipe_ptr p = pipes[s];
    switch (p->op)
      {
      case P_BUBBLE:
      	/* insert a bubble into the next stage */
      	memcpy(p->current, p->bubble_val, p->count);
      	break;
      
      case P_LOAD:
      	/* copy calculated state from previous stage */
      	memcpy(p->current, p->next, p->count);
      	break;
      case P_ERROR:
	  /* Like a bubble, but insert error condition */
      	memcpy(p->current, p->bubble_val, p->count);
      	break;
      case P_STALL:
      default:
      	/* do nothing: next stage gets same instr again */
      	;
      }
    if (p->op != P_ERROR)
	p->op = P_LOAD;
  }
}

/* Set all pipes to bubble values */
void clear_pipes()
{
  int s;
  for (s = 0; s < pipe_count; s++) {
    pipe_ptr p = pipes[s];
    memcpy(p->current, p->bubble_val, p->count);
    memcpy(p->next, p->bubble_val, p->count);
    p->op = P_LOAD;
  }
}

/******************** Utility Code *************************/

/* Representations of digits */
static char digits[16] =
   {'0', '1', '2', '3', '4', '5', '6', '7',
    '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};

/* Print hex/oct/binary format with leading zeros */
/* bpd denotes bits per digit  Should be in range 1-4,
   pbw denotes bits per word.*/
void wprint(uword_t x, int bpd, int bpw, FILE *fp)
{
  int digit;
  uword_t mask = ((uword_t) 1 << bpd) - 1;
  for (digit = (bpw-1)/bpd; digit >= 0; digit--) {
    uword_t val = (x >> (digit * bpd)) & mask;
    putc(digits[val], fp);
  }
}

/* Create string in hex/oct/binary format with leading zeros */
/* bpd denotes bits per digit  Should be in range 1-4,
   pbw denotes bits per word.*/
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


/********************************
 * Part 5: Stage implementations
 *********************************/

/*************** Bubbled version of stages *************/

pc_ele bubble_pc = {0,STAT_AOK};
if_id_ele bubble_if_id = { I_NOP, 0, REG_NONE,REG_NONE,
			   0, 0, STAT_BUB, 0};
id_ex_ele bubble_id_ex = { I_NOP, 0, 0, 0, 0,
			   REG_NONE, REG_NONE, REG_NONE, REG_NONE,
			   STAT_BUB, 0};

ex_mem_ele bubble_ex_mem = { I_NOP, 0, FALSE, 0, 0,
			     REG_NONE, REG_NONE, STAT_BUB, 0};

mem_wb_ele bubble_mem_wb = { I_NOP, 0, 0, 0, REG_NONE, REG_NONE,
			     STAT_BUB, 0};

/*************** Stage Implementations *****************/

word_t gen_f_pc();
word_t gen_need_regids();
word_t gen_need_valC();
word_t gen_instr_valid();
word_t gen_f_predPC();
word_t gen_f_icode();
word_t gen_f_ifun();
word_t gen_f_stat();
word_t gen_instr_valid();

void do_if_stage()
{
    byte_t instr = HPACK(I_NOP, F_NONE);
    byte_t regids = HPACK(REG_NONE, REG_NONE);
    word_t valc = 0;
    word_t valp = f_pc = gen_f_pc();

    /* Ready to fetch instruction.  Speculatively fetch register byte
       and immediate word
    */
    imem_error = !get_byte_val(mem, valp, &instr);
    imem_icode = HI4(instr);
    imem_ifun = LO4(instr);
    if (!imem_error) {
      byte_t junk;
      /* Make sure can read maximum length instruction */
      imem_error = !get_byte_val(mem, valp+5, &junk);
    }
    if_id_next->icode = gen_f_icode();
    if_id_next->ifun  = gen_f_ifun();
    if (!imem_error) {
	sim_log("\tFetch: f_pc = 0x%llx, imem_instr = %s, f_instr = %s\n",
		f_pc, iname(instr),
		iname(HPACK(if_id_next->icode, if_id_next->ifun)));
    }

    instr_valid = gen_instr_valid();
    if (!instr_valid) 
      sim_log("\tFetch: Instruction code 0x%llx invalid\n", instr);
    if_id_next->status = gen_f_stat();

    valp++;
    if (gen_need_regids()) {
	get_byte_val(mem, valp, &regids);
	valp ++;
    }
    if_id_next->ra = HI4(regids);
    if_id_next->rb = LO4(regids);
    if (gen_need_valC()) {
	get_word_val(mem, valp, &valc);
	valp+= 8;
    }
    if_id_next->valp = valp;
    if_id_next->valc = valc;

    pc_next->pc = gen_f_predPC();

    pc_next->status = (if_id_next->status == STAT_AOK) ? STAT_AOK : STAT_BUB;

    if_id_next->stage_pc = f_pc;
}

word_t gen_d_srcA();
word_t gen_d_srcB();
word_t gen_d_dstE();
word_t gen_d_dstM();
word_t gen_d_valA();
word_t gen_d_valB();
word_t gen_w_dstE();
word_t gen_w_valE();
word_t gen_w_dstM();
word_t gen_w_valM();
word_t gen_Stat();

/* Implements both ID and WB */
void do_id_wb_stages()
{
    /* Set up write backs.  Don't occur until end of cycle */
    wb_destE = gen_w_dstE();
    wb_valE = gen_w_valE();
    wb_destM = gen_w_dstM();
    wb_valM = gen_w_valM();

    /* Update processor status */
    status = gen_Stat();

    id_ex_next->srca = gen_d_srcA();
    id_ex_next->srcb = gen_d_srcB();
    id_ex_next->deste = gen_d_dstE();
    id_ex_next->destm = gen_d_dstM();

    /* Read the registers */
    d_regvala = get_reg_val(reg, id_ex_next->srca);
    d_regvalb = get_reg_val(reg, id_ex_next->srcb);

    /* Do forwarding and valA selection */
    id_ex_next->vala = gen_d_valA();
    id_ex_next->valb = gen_d_valB();

    id_ex_next->icode = if_id_curr->icode;
    id_ex_next->ifun = if_id_curr->ifun;
    id_ex_next->valc = if_id_curr->valc;
    id_ex_next->stage_pc = if_id_curr->stage_pc;
    id_ex_next->status = if_id_curr->status;
}

word_t gen_alufun();
word_t gen_set_cc();
word_t gen_Bch();
word_t gen_aluA();
word_t gen_aluB();
word_t gen_e_valA();
word_t gen_e_dstE();

void do_ex_stage()
{
    alu_t alufun = gen_alufun();
    bool_t setcc = gen_set_cc();
    word_t alua, alub;

    alua = gen_aluA();
    alub = gen_aluB();

    e_bcond = 	cond_holds(cc, id_ex_curr->ifun);
    
    ex_mem_next->takebranch = e_bcond;

    if (id_ex_curr->icode == I_JMP)
      sim_log("\tExecute: instr = %s, cc = %s, branch %staken\n",
	      iname(HPACK(id_ex_curr->icode, id_ex_curr->ifun)),
	      cc_name(cc),
	      ex_mem_next->takebranch ? "" : "not ");
    
    /* Perform the ALU operation */
    word_t aluout = compute_alu(alufun, alua, alub);
    ex_mem_next->vale = aluout;
    sim_log("\tExecute: ALU: %c 0x%llx 0x%llx --> 0x%llx\n",
	    op_name(alufun), alua, alub, aluout);

    if (setcc) {
	cc_in = compute_cc(alufun, alua, alub);
	sim_log("\tExecute: New cc = %s\n", cc_name(cc_in));
    }

    ex_mem_next->icode = id_ex_curr->icode;
    ex_mem_next->ifun = id_ex_curr->ifun;
    ex_mem_next->vala = gen_e_valA();
    ex_mem_next->deste = gen_e_dstE();
    ex_mem_next->destm = id_ex_curr->destm;
    ex_mem_next->srca = id_ex_curr->srca;
    ex_mem_next->status = id_ex_curr->status;
    ex_mem_next->stage_pc = id_ex_curr->stage_pc;
}

/* Functions defined using HCL */
word_t gen_mem_addr();
word_t gen_mem_read();
word_t gen_mem_write();
word_t gen_m_stat();

void do_mem_stage()
{
    bool_t read = gen_mem_read();

    word_t valm = 0;

    mem_addr = gen_mem_addr();
    mem_data = ex_mem_curr->vala;
    mem_write = gen_mem_write();
    dmem_error = FALSE;

    if (read) {
	dmem_error = dmem_error || !get_word_val(mem, mem_addr, &valm);
	if (!dmem_error)
	  sim_log("\tMemory: Read 0x%llx from 0x%llx\n",
		  valm, mem_addr);
    }
    if (mem_write) {
	word_t sink;
	/* Do a read of address just to check validity */
	dmem_error = dmem_error || !get_word_val(mem, mem_addr, &sink);
	if (dmem_error)
	  sim_log("\tMemory: Invalid address 0x%llx\n",
		  mem_addr);
    }
    mem_wb_next->icode = ex_mem_curr->icode;
    mem_wb_next->ifun = ex_mem_curr->ifun;
    mem_wb_next->vale = ex_mem_curr->vale;
    mem_wb_next->valm = valm;
    mem_wb_next->deste = ex_mem_curr->deste;
    mem_wb_next->destm = ex_mem_curr->destm;
    mem_wb_next->status = gen_m_stat();
    mem_wb_next->stage_pc = ex_mem_curr->stage_pc;
}

/* Set stalling conditions for different stages */

word_t gen_F_stall(), gen_F_bubble();
word_t gen_D_stall(), gen_D_bubble();
word_t gen_E_stall(), gen_E_bubble();
word_t gen_M_stall(), gen_M_bubble();
word_t gen_W_stall(), gen_W_bubble();

p_stat_t pipe_cntl(char *name, word_t stall, word_t bubble)
{
    if (stall) {
	if (bubble) {
	    sim_log("%s: Conflicting control signals for pipe register\n",
		    name);
	    return P_ERROR;
	} else 
	    return P_STALL;
    } else {
	return bubble ? P_BUBBLE : P_LOAD;
    }
}

void do_stall_check()
{
    pc_state->op = pipe_cntl("PC", gen_F_stall(), gen_F_bubble());
    if_id_state->op = pipe_cntl("ID", gen_D_stall(), gen_D_bubble());
    id_ex_state->op = pipe_cntl("EX", gen_E_stall(), gen_E_bubble());
    ex_mem_state->op = pipe_cntl("MEM", gen_M_stall(), gen_M_bubble());
    mem_wb_state->op = pipe_cntl("WB", gen_W_stall(), gen_W_bubble());
}



