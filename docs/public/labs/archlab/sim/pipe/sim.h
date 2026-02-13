
/********** Typedefs ************/

/* EX stage mux settings */
typedef enum { MUX_NONE, MUX_EX_A, MUX_EX_B, MUX_MEM_E,
	       MUX_WB_M, MUX_WB_E } mux_source_t;

/* Simulator operating modes */
typedef enum { S_WEDGED, S_STALL, S_FORWARD } sim_mode_t;

/* Pipeline stage identifiers for stage operation control */
typedef enum { IF_STAGE, ID_STAGE, EX_STAGE, MEM_STAGE, WB_STAGE } stage_id_t;

/********** Defines **************/

/* Get ra out of one byte regid field */
#define GET_RA(r) HI4(r)

/* Get rb out of one byte regid field */
#define GET_RB(r) LO4(r)


/************ Global state declaration ****************/

/* How many cycles have been simulated? */
extern word_t cycles;
/* How many instructions have passed through the EX stage? */
extern word_t instructions;

/* Both instruction and data memory */
extern mem_t mem;

/* Keep track of range of addresses that have been written */
extern word_t minAddr;
extern word_t memCnt;

/* Register file */
extern mem_t reg;
/* Condition code register */
extern cc_t cc;
extern stat_t stat;

/* Operand sources in EX (to show forwarding) */
extern mux_source_t amux, bmux;

/* Provide global access to current states of all pipeline registers */
pipe_ptr pc_state, if_id_state, id_ex_state, ex_mem_state, mem_wb_state;

/* Current States */
extern pc_ptr pc_curr;
extern if_id_ptr if_id_curr;
extern id_ex_ptr id_ex_curr;
extern ex_mem_ptr ex_mem_curr;
extern mem_wb_ptr mem_wb_curr;

/* Next States */
extern pc_ptr pc_next;
extern if_id_ptr if_id_next;
extern id_ex_ptr id_ex_next;
extern ex_mem_ptr ex_mem_next;
extern mem_wb_ptr mem_wb_next;

/* Pending updates to state */
extern word_t cc_in;
extern word_t wb_destE;
extern word_t wb_valE;
extern word_t wb_destM;
extern word_t wb_valM;
extern word_t mem_addr;
extern word_t mem_data;
extern bool_t mem_write;


/* Intermdiate stage values that must be used by control functions */
extern word_t f_pc;
extern byte_t imem_icode;
extern byte_t imem_ifun;
extern bool_t imem_error;
extern bool_t instr_valid;
extern word_t d_regvala;
extern word_t d_regvalb;
extern word_t e_vala;
extern word_t e_valb;
extern bool_t e_bcond;
extern bool_t dmem_error;

/* Simulator operating mode */
extern sim_mode_t sim_mode;
/* Log file */
extern FILE *dumpfile;

/*************** Simulation Control Functions ***********/

/* Bubble next execution of specified stage */
void sim_bubble_stage(stage_id_t stage);

/* Stall stage (has effect at next update) */
void sim_stall_stage(stage_id_t stage);

/* Sets the simulator name (called from main routine in HCL file) */
void set_simname(char *name);

/* Initialize simulator */
void sim_init();

/* Reset simulator state, including register, instruction, and data memories */
void sim_reset();

/*
  Run pipeline until one of following occurs:
  - A status error is encountered in WB.
  - max_instr instructions have completed through WB
  - max_cycle cycles have been simulated

  Return number of instructions executed.
  if statusp nonnull, then will be set to status of final instruction
  if ccp nonnull, then will be set to condition codes of final instruction
*/
word_t sim_run_pipe(word_t max_instr, word_t max_cycle, byte_t *statusp, cc_t *ccp);

/* If dumpfile set nonNULL, lots of status info printed out */
void sim_set_dumpfile(FILE *file);

/*
 * sim_log dumps a formatted string to the dumpfile, if it exists
 * accepts variable argument list
 */
void sim_log( const char *format, ... );

 
/******************* GUI Interface Functions **********************/
#ifdef HAS_GUI

void signal_sources();

void signal_register_clear();

void report_pc(unsigned fpc, unsigned char fpcv,
	       unsigned dpc, unsigned char dpcv,
	       unsigned epc, unsigned char epcv,
	       unsigned mpc, unsigned char mpcv,
	       unsigned wpc, unsigned char wpcv);

void report_state(char *id, word_t current, char *txt);

void show_cc(cc_t cc);
void show_cpi();
void show_stat(stat_t stat);

void create_memory_display();
void set_memory(word_t addr, word_t val);
#endif
								       
