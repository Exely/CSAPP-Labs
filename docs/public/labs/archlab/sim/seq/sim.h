
/********** Defines **************/

/* Get ra out of one byte regid field */
#define GET_RA(r) HI4(r)

/* Get rb out of one byte regid field */
#define GET_RB(r) LO4(r)


/************ Global state declaration ****************/

/* Determines whether running SEQ or SEQ+ */
extern int plusmode;

/* Both instruction and data memory */
extern mem_t mem;

/* Keep track of range of addresses that have been written */
extern word_t minAddr;
extern word_t memCnt;

/* Register file */
extern mem_t reg;
/* Condition code register */
extern cc_t cc;
/* Program counter */
extern word_t pc;

/* For seq+ */
/* Results computed by previous instruction.
   Used to compute PC in current instruction */
extern byte_t prev_icode;
extern byte_t prev_ifun;
extern word_t prev_valc;
extern word_t prev_valm;
extern word_t prev_valp;
extern bool_t prev_bcond;

/* Intermdiate stage values that must be used by control functions */
extern byte_t imem_icode;
extern byte_t imem_ifun;
extern byte_t icode;
extern word_t ifun;
extern word_t ra;
extern word_t rb;
extern word_t valc;
extern word_t valp;
extern bool_t imem_error;
extern bool_t instr_valid;
extern word_t vala;
extern word_t valb;
extern word_t vale;
extern bool_t bcond;
extern bool_t cond;
extern word_t valm;
extern bool_t dmem_error;
extern byte_t status;

/* Log file */
extern FILE *dumpfile;


/* Sets the simulator name (called from main routine in HCL file) */
void set_simname(char *name);

/* Initialize simulator */
void sim_init();

/* Reset simulator state, including register, instruction, and data memories */
void sim_reset();

/*
  Run processor until one of following occurs:
  - An status error is encountered
  - max_instr instructions have completed

  Return number of instructions executed.
  if statusp nonnull, then will be set to status of final instruction
  if ccp nonnull, then will be set to condition codes of final instruction
*/
word_t sim_run(word_t max_instr, byte_t *statusp, cc_t *ccp);

/* If dumpfile set nonNULL, lots of status info printed out */
void sim_set_dumpfile(FILE *file);

/*
 * sim_log dumps a formatted string to the dumpfile, if it exists
 * accepts variable argument list
 */
void sim_log( const char *format, ... );


/******************* GUI Interface Functions **********************/
#ifdef HAS_GUI

void signal_register_clear();

void report_pc(word_t pc);

void report_state(char *id, char *txt);

void show_cc(cc_t cc);

void create_memory_display();
void set_memory(word_t addr, word_t val);
#endif
								       
