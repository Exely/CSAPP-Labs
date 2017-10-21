char simname[] = "Y86-64 Processor: seq-std.hcl";
#include <stdio.h>
#include "isa.h"
#include "sim.h"
int sim_main(int argc, char *argv[]);
word_t gen_pc(){return 0;}
int main(int argc, char *argv[])
  {plusmode=0;return sim_main(argc,argv);}
long long gen_icode()
{
    return ((imem_error) ? (I_NOP) : (imem_icode));
}

long long gen_ifun()
{
    return ((imem_error) ? (F_NONE) : (imem_ifun));
}

long long gen_instr_valid()
{
    return ((icode) == (I_NOP) || (icode) == (I_HALT) || (icode) == 
      (I_RRMOVQ) || (icode) == (I_IRMOVQ) || (icode) == (I_RMMOVQ) || 
      (icode) == (I_MRMOVQ) || (icode) == (I_ALU) || (icode) == (I_JMP) || 
      (icode) == (I_CALL) || (icode) == (I_RET) || (icode) == (I_PUSHQ) || 
      (icode) == (I_POPQ));
}

long long gen_need_regids()
{
    return ((icode) == (I_RRMOVQ) || (icode) == (I_ALU) || (icode) == 
      (I_PUSHQ) || (icode) == (I_POPQ) || (icode) == (I_IRMOVQ) || (icode)
       == (I_RMMOVQ) || (icode) == (I_MRMOVQ));
}

long long gen_need_valC()
{
    return ((icode) == (I_IRMOVQ) || (icode) == (I_RMMOVQ) || (icode) == 
      (I_MRMOVQ) || (icode) == (I_JMP) || (icode) == (I_CALL));
}

long long gen_srcA()
{
    return (((icode) == (I_RRMOVQ) || (icode) == (I_RMMOVQ) || (icode) == 
        (I_ALU) || (icode) == (I_PUSHQ)) ? (ra) : ((icode) == (I_POPQ) || 
        (icode) == (I_RET)) ? (REG_RSP) : (REG_NONE));
}

long long gen_srcB()
{
    return (((icode) == (I_ALU) || (icode) == (I_RMMOVQ) || (icode) == 
        (I_MRMOVQ)) ? (rb) : ((icode) == (I_PUSHQ) || (icode) == (I_POPQ)
         || (icode) == (I_CALL) || (icode) == (I_RET)) ? (REG_RSP) : 
      (REG_NONE));
}

long long gen_dstE()
{
    return ((((icode) == (I_RRMOVQ)) & (cond)) ? (rb) : ((icode) == 
        (I_IRMOVQ) || (icode) == (I_ALU)) ? (rb) : ((icode) == (I_PUSHQ)
         || (icode) == (I_POPQ) || (icode) == (I_CALL) || (icode) == 
        (I_RET)) ? (REG_RSP) : (REG_NONE));
}

long long gen_dstM()
{
    return (((icode) == (I_MRMOVQ) || (icode) == (I_POPQ)) ? (ra) : 
      (REG_NONE));
}

long long gen_aluA()
{
    return (((icode) == (I_RRMOVQ) || (icode) == (I_ALU)) ? (vala) : (
        (icode) == (I_IRMOVQ) || (icode) == (I_RMMOVQ) || (icode) == 
        (I_MRMOVQ)) ? (valc) : ((icode) == (I_CALL) || (icode) == (I_PUSHQ)
        ) ? -8 : ((icode) == (I_RET) || (icode) == (I_POPQ)) ? 8 : 0);
}

long long gen_aluB()
{
    return (((icode) == (I_RMMOVQ) || (icode) == (I_MRMOVQ) || (icode) == 
        (I_ALU) || (icode) == (I_CALL) || (icode) == (I_PUSHQ) || (icode)
         == (I_RET) || (icode) == (I_POPQ)) ? (valb) : ((icode) == 
        (I_RRMOVQ) || (icode) == (I_IRMOVQ)) ? 0 : 0);
}

long long gen_alufun()
{
    return (((icode) == (I_ALU)) ? (ifun) : (A_ADD));
}

long long gen_set_cc()
{
    return ((icode) == (I_ALU));
}

long long gen_mem_read()
{
    return ((icode) == (I_MRMOVQ) || (icode) == (I_POPQ) || (icode) == 
      (I_RET));
}

long long gen_mem_write()
{
    return ((icode) == (I_RMMOVQ) || (icode) == (I_PUSHQ) || (icode) == 
      (I_CALL));
}

long long gen_mem_addr()
{
    return (((icode) == (I_RMMOVQ) || (icode) == (I_PUSHQ) || (icode) == 
        (I_CALL) || (icode) == (I_MRMOVQ)) ? (vale) : ((icode) == (I_POPQ)
         || (icode) == (I_RET)) ? (vala) : 0);
}

long long gen_mem_data()
{
    return (((icode) == (I_RMMOVQ) || (icode) == (I_PUSHQ)) ? (vala) : (
        (icode) == (I_CALL)) ? (valp) : 0);
}

long long gen_Stat()
{
    return (((imem_error) | (dmem_error)) ? (STAT_ADR) : !(instr_valid) ? 
      (STAT_INS) : ((icode) == (I_HALT)) ? (STAT_HLT) : (STAT_AOK));
}

long long gen_new_pc()
{
    return (((icode) == (I_CALL)) ? (valc) : (((icode) == (I_JMP)) & (cond)
        ) ? (valc) : ((icode) == (I_RET)) ? (valm) : (valp));
}

