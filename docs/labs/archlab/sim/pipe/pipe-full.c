char simname[] = "Y86-64 Processor: pipe-full.hcl";
#include <stdio.h>
#include "isa.h"
#include "pipeline.h"
#include "stages.h"
#include "sim.h"
int sim_main(int argc, char *argv[]);
int main(int argc, char *argv[]){return sim_main(argc,argv);}
long long gen_f_pc()
{
    return ((((ex_mem_curr->icode) == (I_JMP)) & !(ex_mem_curr->takebranch)
        ) ? (ex_mem_curr->vala) : ((mem_wb_curr->icode) == (I_RET)) ? 
      (mem_wb_curr->valm) : (pc_curr->pc));
}

long long gen_f_icode()
{
    return ((imem_error) ? (I_NOP) : (imem_icode));
}

long long gen_f_ifun()
{
    return ((imem_error) ? (F_NONE) : (imem_ifun));
}

long long gen_instr_valid()
{
    return ((if_id_next->icode) == (I_NOP) || (if_id_next->icode) == 
      (I_HALT) || (if_id_next->icode) == (I_RRMOVQ) || (if_id_next->icode)
       == (I_IRMOVQ) || (if_id_next->icode) == (I_RMMOVQ) || 
      (if_id_next->icode) == (I_MRMOVQ) || (if_id_next->icode) == (I_ALU)
       || (if_id_next->icode) == (I_JMP) || (if_id_next->icode) == (I_CALL)
       || (if_id_next->icode) == (I_RET) || (if_id_next->icode) == 
      (I_PUSHQ) || (if_id_next->icode) == (I_POPQ) || (if_id_next->icode)
       == (I_IADDQ));
}

long long gen_f_stat()
{
    return ((imem_error) ? (STAT_ADR) : !(instr_valid) ? (STAT_INS) : (
        (if_id_next->icode) == (I_HALT)) ? (STAT_HLT) : (STAT_AOK));
}

long long gen_need_regids()
{
    return ((if_id_next->icode) == (I_RRMOVQ) || (if_id_next->icode) == 
      (I_ALU) || (if_id_next->icode) == (I_PUSHQ) || (if_id_next->icode)
       == (I_POPQ) || (if_id_next->icode) == (I_IRMOVQ) || 
      (if_id_next->icode) == (I_RMMOVQ) || (if_id_next->icode) == 
      (I_MRMOVQ) || (if_id_next->icode) == (I_IADDQ));
}

long long gen_need_valC()
{
    return ((if_id_next->icode) == (I_IRMOVQ) || (if_id_next->icode) == 
      (I_RMMOVQ) || (if_id_next->icode) == (I_MRMOVQ) || 
      (if_id_next->icode) == (I_JMP) || (if_id_next->icode) == (I_CALL) || 
      (if_id_next->icode) == (I_IADDQ));
}

long long gen_f_predPC()
{
    return (((if_id_next->icode) == (I_JMP) || (if_id_next->icode) == 
        (I_CALL)) ? (if_id_next->valc) : (if_id_next->valp));
}

long long gen_d_srcA()
{
    return (((if_id_curr->icode) == (I_RRMOVQ) || (if_id_curr->icode) == 
        (I_RMMOVQ) || (if_id_curr->icode) == (I_ALU) || (if_id_curr->icode)
         == (I_PUSHQ)) ? (if_id_curr->ra) : ((if_id_curr->icode) == 
        (I_POPQ) || (if_id_curr->icode) == (I_RET)) ? (REG_RSP) : 
      (REG_NONE));
}

long long gen_d_srcB()
{
    return (((if_id_curr->icode) == (I_ALU) || (if_id_curr->icode) == 
        (I_RMMOVQ) || (if_id_curr->icode) == (I_MRMOVQ) || 
        (if_id_curr->icode) == (I_IADDQ)) ? (if_id_curr->rb) : (
        (if_id_curr->icode) == (I_PUSHQ) || (if_id_curr->icode) == (I_POPQ)
         || (if_id_curr->icode) == (I_CALL) || (if_id_curr->icode) == 
        (I_RET)) ? (REG_RSP) : (REG_NONE));
}

long long gen_d_dstE()
{
    return (((if_id_curr->icode) == (I_RRMOVQ) || (if_id_curr->icode) == 
        (I_IRMOVQ) || (if_id_curr->icode) == (I_ALU) || (if_id_curr->icode)
         == (I_IADDQ)) ? (if_id_curr->rb) : ((if_id_curr->icode) == 
        (I_PUSHQ) || (if_id_curr->icode) == (I_POPQ) || (if_id_curr->icode)
         == (I_CALL) || (if_id_curr->icode) == (I_RET)) ? (REG_RSP) : 
      (REG_NONE));
}

long long gen_d_dstM()
{
    return (((if_id_curr->icode) == (I_MRMOVQ) || (if_id_curr->icode) == 
        (I_POPQ)) ? (if_id_curr->ra) : (REG_NONE));
}

long long gen_d_valA()
{
    return (((if_id_curr->icode) == (I_CALL) || (if_id_curr->icode) == 
        (I_JMP)) ? (if_id_curr->valp) : ((id_ex_next->srca) == 
        (ex_mem_next->deste)) ? (ex_mem_next->vale) : ((id_ex_next->srca)
         == (ex_mem_curr->destm)) ? (mem_wb_next->valm) : (
        (id_ex_next->srca) == (ex_mem_curr->deste)) ? (ex_mem_curr->vale)
       : ((id_ex_next->srca) == (mem_wb_curr->destm)) ? (mem_wb_curr->valm)
       : ((id_ex_next->srca) == (mem_wb_curr->deste)) ? (mem_wb_curr->vale)
       : (d_regvala));
}

long long gen_d_valB()
{
    return (((id_ex_next->srcb) == (ex_mem_next->deste)) ? 
      (ex_mem_next->vale) : ((id_ex_next->srcb) == (ex_mem_curr->destm)) ? 
      (mem_wb_next->valm) : ((id_ex_next->srcb) == (ex_mem_curr->deste)) ? 
      (ex_mem_curr->vale) : ((id_ex_next->srcb) == (mem_wb_curr->destm)) ? 
      (mem_wb_curr->valm) : ((id_ex_next->srcb) == (mem_wb_curr->deste)) ? 
      (mem_wb_curr->vale) : (d_regvalb));
}

long long gen_aluA()
{
    return (((id_ex_curr->icode) == (I_RRMOVQ) || (id_ex_curr->icode) == 
        (I_ALU)) ? (id_ex_curr->vala) : ((id_ex_curr->icode) == (I_IRMOVQ)
         || (id_ex_curr->icode) == (I_RMMOVQ) || (id_ex_curr->icode) == 
        (I_MRMOVQ) || (id_ex_curr->icode) == (I_IADDQ)) ? 
      (id_ex_curr->valc) : ((id_ex_curr->icode) == (I_CALL) || 
        (id_ex_curr->icode) == (I_PUSHQ)) ? -8 : ((id_ex_curr->icode) == 
        (I_RET) || (id_ex_curr->icode) == (I_POPQ)) ? 8 : 0);
}

long long gen_aluB()
{
    return (((id_ex_curr->icode) == (I_RMMOVQ) || (id_ex_curr->icode) == 
        (I_MRMOVQ) || (id_ex_curr->icode) == (I_ALU) || (id_ex_curr->icode)
         == (I_CALL) || (id_ex_curr->icode) == (I_PUSHQ) || 
        (id_ex_curr->icode) == (I_RET) || (id_ex_curr->icode) == (I_POPQ)
         || (id_ex_curr->icode) == (I_IADDQ)) ? (id_ex_curr->valb) : (
        (id_ex_curr->icode) == (I_RRMOVQ) || (id_ex_curr->icode) == 
        (I_IRMOVQ)) ? 0 : 0);
}

long long gen_alufun()
{
    return (((id_ex_curr->icode) == (I_ALU)) ? (id_ex_curr->ifun) : (A_ADD)
      );
}

long long gen_set_cc()
{
    return ((((id_ex_curr->icode) == (I_ALU) || (id_ex_curr->icode) == 
          (I_IADDQ)) & !((mem_wb_next->status) == (STAT_ADR) || 
          (mem_wb_next->status) == (STAT_INS) || (mem_wb_next->status) == 
          (STAT_HLT))) & !((mem_wb_curr->status) == (STAT_ADR) || 
        (mem_wb_curr->status) == (STAT_INS) || (mem_wb_curr->status) == 
        (STAT_HLT)));
}

long long gen_e_valA()
{
    return (id_ex_curr->vala);
}

long long gen_e_dstE()
{
    return ((((id_ex_curr->icode) == (I_RRMOVQ)) & !
        (ex_mem_next->takebranch)) ? (REG_NONE) : (id_ex_curr->deste));
}

long long gen_mem_addr()
{
    return (((ex_mem_curr->icode) == (I_RMMOVQ) || (ex_mem_curr->icode) == 
        (I_PUSHQ) || (ex_mem_curr->icode) == (I_CALL) || 
        (ex_mem_curr->icode) == (I_MRMOVQ)) ? (ex_mem_curr->vale) : (
        (ex_mem_curr->icode) == (I_POPQ) || (ex_mem_curr->icode) == (I_RET)
        ) ? (ex_mem_curr->vala) : 0);
}

long long gen_mem_read()
{
    return ((ex_mem_curr->icode) == (I_MRMOVQ) || (ex_mem_curr->icode) == 
      (I_POPQ) || (ex_mem_curr->icode) == (I_RET));
}

long long gen_mem_write()
{
    return ((ex_mem_curr->icode) == (I_RMMOVQ) || (ex_mem_curr->icode) == 
      (I_PUSHQ) || (ex_mem_curr->icode) == (I_CALL));
}

long long gen_m_stat()
{
    return ((dmem_error) ? (STAT_ADR) : (ex_mem_curr->status));
}

long long gen_w_dstE()
{
    return (mem_wb_curr->deste);
}

long long gen_w_valE()
{
    return (mem_wb_curr->vale);
}

long long gen_w_dstM()
{
    return (mem_wb_curr->destm);
}

long long gen_w_valM()
{
    return (mem_wb_curr->valm);
}

long long gen_Stat()
{
    return (((mem_wb_curr->status) == (STAT_BUB)) ? (STAT_AOK) : 
      (mem_wb_curr->status));
}

long long gen_F_bubble()
{
    return 0;
}

long long gen_F_stall()
{
    return ((((id_ex_curr->icode) == (I_MRMOVQ) || (id_ex_curr->icode) == 
          (I_POPQ)) & ((id_ex_curr->destm) == (id_ex_next->srca) || 
          (id_ex_curr->destm) == (id_ex_next->srcb))) | ((I_RET) == 
        (if_id_curr->icode) || (I_RET) == (id_ex_curr->icode) || (I_RET)
         == (ex_mem_curr->icode)));
}

long long gen_D_stall()
{
    return (((id_ex_curr->icode) == (I_MRMOVQ) || (id_ex_curr->icode) == 
        (I_POPQ)) & ((id_ex_curr->destm) == (id_ex_next->srca) || 
        (id_ex_curr->destm) == (id_ex_next->srcb)));
}

long long gen_D_bubble()
{
    return ((((id_ex_curr->icode) == (I_JMP)) & !(ex_mem_next->takebranch))
       | (!(((id_ex_curr->icode) == (I_MRMOVQ) || (id_ex_curr->icode) == 
            (I_POPQ)) & ((id_ex_curr->destm) == (id_ex_next->srca) || 
            (id_ex_curr->destm) == (id_ex_next->srcb))) & ((I_RET) == 
          (if_id_curr->icode) || (I_RET) == (id_ex_curr->icode) || (I_RET)
           == (ex_mem_curr->icode))));
}

long long gen_E_stall()
{
    return 0;
}

long long gen_E_bubble()
{
    return ((((id_ex_curr->icode) == (I_JMP)) & !(ex_mem_next->takebranch))
       | (((id_ex_curr->icode) == (I_MRMOVQ) || (id_ex_curr->icode) == 
          (I_POPQ)) & ((id_ex_curr->destm) == (id_ex_next->srca) || 
          (id_ex_curr->destm) == (id_ex_next->srcb))));
}

long long gen_M_stall()
{
    return 0;
}

long long gen_M_bubble()
{
    return (((mem_wb_next->status) == (STAT_ADR) || (mem_wb_next->status)
         == (STAT_INS) || (mem_wb_next->status) == (STAT_HLT)) | (
        (mem_wb_curr->status) == (STAT_ADR) || (mem_wb_curr->status) == 
        (STAT_INS) || (mem_wb_curr->status) == (STAT_HLT)));
}

long long gen_W_stall()
{
    return ((mem_wb_curr->status) == (STAT_ADR) || (mem_wb_curr->status)
       == (STAT_INS) || (mem_wb_curr->status) == (STAT_HLT));
}

long long gen_W_bubble()
{
    return 0;
}

