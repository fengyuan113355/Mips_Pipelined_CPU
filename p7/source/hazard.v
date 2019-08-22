`timescale 1ns / 1ps
`ifndef HAZARD
`define HAZARD

`include "signal_def.v"

module stall(
	input [31:0] FD_Instr,
	input [31:0] DE_Instr,
	input [31:0] EM_Instr,
	input E_Busy,
	input DE_RegWrite,
	input [4:0] DE_RegDst,
	input EM_RegWrite,
	input [4:0] EM_RegDst,
	output StallPC,
	output StallFD,
	output FlushDE
    );

	wire isStall, Stall_rs, Stall_rt, Stall_md;

	wire FD_branch, FD_jr, FD_jalr, FD_cal_r, FD_cal_i, FD_md, FD_mt, FD_mf, FD_load, FD_store, FD_lwlr;
	wire DE_cal_r, DE_cal_i, DE_mf, DE_mfc0, DE_load, DE_md, DE_lwlr;
	wire EM_load, EM_lwlr;
	
	assign StallPC = isStall;
	assign StallFD = isStall;
	assign FlushDE = isStall;
	
	
	assign FD_branch = (FD_Instr[`op] == `BEQ_OP) |
	                   (FD_Instr[`op] == `BNE_OP) |
					   (FD_Instr[`op] == `BGTZ_OP) |
					   (FD_Instr[`op] == `BLEZ_OP) |
					   (FD_Instr[`op] == `BLTZ_BGEZ_OP & (FD_Instr[`rt] == `BLTZ_RT | FD_Instr[`rt] == `BGEZ_RT));
	assign FD_jr = (FD_Instr[`op] == `R_OP) &
	               (FD_Instr[`funct] == `JR_FUNCT);
	assign FD_jalr = (FD_Instr[`op] == `R_OP) &
	                 (FD_Instr[`funct] == `JALR_FUNCT);
	assign FD_cal_r = (FD_Instr[`op] == `R_OP) &
				   ((FD_Instr[`funct] == `ADDU_FUNCT) |
					(FD_Instr[`funct] == `SUBU_FUNCT) |
					(FD_Instr[`funct] == `ADD_FUNCT)  |
				    (FD_Instr[`funct] == `SUB_FUNCT)  |
				    (FD_Instr[`funct] == `AND_FUNCT)  |
				    (FD_Instr[`funct] == `OR_FUNCT)   |
				    (FD_Instr[`funct] == `XOR_FUNCT)  |
					(FD_Instr[`funct] == `NOR_FUNCT)  |
				    (FD_Instr[`funct] == `SLL_FUNCT)  |
				    (FD_Instr[`funct] == `SRL_FUNCT)  |
					(FD_Instr[`funct] == `SRA_FUNCT)  |
					(FD_Instr[`funct] == `SLLV_FUNCT) |
					(FD_Instr[`funct] == `SRLV_FUNCT) |
					(FD_Instr[`funct] == `SRAV_FUNCT) |
					(FD_Instr[`funct] == `SLT_FUNCT)  |
					(FD_Instr[`funct] == `SLTU_FUNCT));
	assign FD_cal_i = (FD_Instr[`op] == `ORI_OP)   |
					  (FD_Instr[`op] == `LUI_OP)   |
					  (FD_Instr[`op] == `ANDI_OP)  |
					  (FD_Instr[`op] == `XORI_OP)  |
					  (FD_Instr[`op] == `ADDI_OP)  |
					  (FD_Instr[`op] == `ADDIU_OP) |
					  (FD_Instr[`op] == `SLTI_OP)  |
					  (FD_Instr[`op] == `SLTIU_OP);
	assign FD_md =  ((FD_Instr[`op] == `R_OP) &
				   ((FD_Instr[`funct] == `MULT_FUNCT)  |
	                (FD_Instr[`funct] == `MULTU_FUNCT) |
				    (FD_Instr[`funct] == `DIV_FUNCT)   |
				    (FD_Instr[`funct] == `DIVU_FUNCT))) |
					(FD_Instr[`op] == `MADD_OP);
	assign FD_mt =  (FD_Instr[`op] == `R_OP) &
					((FD_Instr[`funct] == `MTHI_FUNCT) |
					 (FD_Instr[`funct] == `MTLO_FUNCT));
	assign FD_mf =  (FD_Instr[`op] == `R_OP) &
	                ((FD_Instr[`funct] == `MFHI_FUNCT) |
					 (FD_Instr[`funct] == `MFLO_FUNCT));
	assign FD_load = (FD_Instr[`op] == `LW_OP)  |
	                 (FD_Instr[`op] == `LH_OP)  |
					 (FD_Instr[`op] == `LHU_OP) |
					 (FD_Instr[`op] == `LB_OP)  |
					 (FD_Instr[`op] == `LBU_OP);
	assign FD_store = (FD_Instr[`op] == `SW_OP)  |
	                  (FD_Instr[`op] == `SH_OP)  |
					  (FD_Instr[`op] == `SB_OP)  |
					  (FD_Instr[`op] == `SWL_OP) |
					  (FD_Instr[`op] == `SWR_OP);
	assign FD_lwlr = (FD_Instr[`op] == `LWL_OP) |
	                 (FD_Instr[`op] == `LWR_OP);
	assign FD_mtc0 = (FD_Instr[`op] == `COP0_OP) &
	                 (FD_Instr[`rs] == `MTC0_RS);
					 
	
	assign DE_cal_r = (DE_Instr[`op] == `R_OP) &
				   ((DE_Instr[`funct] == `ADDU_FUNCT) |
					(DE_Instr[`funct] == `SUBU_FUNCT) |
					(DE_Instr[`funct] == `ADD_FUNCT)  |
				    (DE_Instr[`funct] == `SUB_FUNCT)  |
				    (DE_Instr[`funct] == `AND_FUNCT)  |
				    (DE_Instr[`funct] == `OR_FUNCT)   |
				    (DE_Instr[`funct] == `XOR_FUNCT)  |
					(DE_Instr[`funct] == `NOR_FUNCT)  |
				    (DE_Instr[`funct] == `SLL_FUNCT)  |
				    (DE_Instr[`funct] == `SRL_FUNCT)  |
					(DE_Instr[`funct] == `SRA_FUNCT)  |
					(DE_Instr[`funct] == `SLLV_FUNCT) |
					(DE_Instr[`funct] == `SRLV_FUNCT) |
					(DE_Instr[`funct] == `SRAV_FUNCT) |
					(DE_Instr[`funct] == `SLT_FUNCT)  |
					(DE_Instr[`funct] == `SLTU_FUNCT));
	assign DE_cal_i = (DE_Instr[`op] == `ORI_OP)   |
					  (DE_Instr[`op] == `LUI_OP)   |
					  (DE_Instr[`op] == `ANDI_OP)  |
					  (DE_Instr[`op] == `XORI_OP)  |
					  (DE_Instr[`op] == `ADDI_OP)  |
					  (DE_Instr[`op] == `ADDIU_OP) |
					  (DE_Instr[`op] == `SLTI_OP)  |
					  (DE_Instr[`op] == `SLTIU_OP);
	assign DE_md =  ((DE_Instr[`op] == `R_OP) &
				   ((DE_Instr[`funct] == `MULT_FUNCT)  |
	                (DE_Instr[`funct] == `MULTU_FUNCT) |
				    (DE_Instr[`funct] == `DIV_FUNCT)   |
				    (DE_Instr[`funct] == `DIVU_FUNCT))) |
					(DE_Instr[`op] == `MADD_OP);
	assign DE_mf =  (DE_Instr[`op] == `R_OP) &
	                ((DE_Instr[`funct] == `MFHI_FUNCT) |
					 (DE_Instr[`funct] == `MFLO_FUNCT));
	assign DE_mfc0 = (DE_Instr[`op] == `COP0_OP) & 
	                 (DE_Instr[`rs] == `MFC0_RS);
	assign DE_load = (DE_Instr[`op] == `LW_OP)  |
	                 (DE_Instr[`op] == `LH_OP)  |
					 (DE_Instr[`op] == `LHU_OP) |
					 (DE_Instr[`op] == `LB_OP)  |
					 (DE_Instr[`op] == `LBU_OP);
	assign DE_lwlr = (DE_Instr[`op] == `LWL_OP) |
	                 (DE_Instr[`op] == `LWR_OP);
	
	assign EM_load = (EM_Instr[`op] == `LW_OP)  |
	                 (EM_Instr[`op] == `LH_OP)  |
					 (EM_Instr[`op] == `LHU_OP) |
					 (EM_Instr[`op] == `LB_OP)  |
					 (EM_Instr[`op] == `LBU_OP);
	assign EM_lwlr = (EM_Instr[`op] == `LWL_OP) |
	                 (EM_Instr[`op] == `LWR_OP);
	
	
	assign Stall_rs = |(FD_Instr[`rs]) & 
					  (((FD_branch | FD_jr | FD_jalr) & (DE_cal_r | DE_cal_i | DE_mf | DE_mfc0 | DE_load | DE_lwlr) & DE_RegWrite & FD_Instr[`rs] == DE_RegDst) |
					   ((FD_branch | FD_jr | FD_jalr) & (EM_load | EM_lwlr) & EM_RegWrite & FD_Instr[`rs] == EM_RegDst) |
					   ((FD_cal_r | FD_cal_i | FD_md | FD_mt | FD_load | FD_lwlr | FD_store) & (DE_load | DE_lwlr) & DE_RegWrite & FD_Instr[`rs] == DE_RegDst));
	assign Stall_rt = |(FD_Instr[`rt]) &
					  (((FD_branch) & (DE_cal_r | DE_cal_i | DE_mf | DE_mfc0 | DE_load | DE_lwlr) & DE_RegWrite & FD_Instr[`rt] == DE_RegDst) |
					   (FD_branch & (EM_load | EM_lwlr) & EM_RegWrite & FD_Instr[`rt] == EM_RegDst) |
					   ((FD_cal_r | FD_md | FD_mtc0) & (DE_load | DE_lwlr) & DE_RegWrite & FD_Instr[`rt] == DE_RegDst));
	assign Stall_md = (FD_md | FD_mt | FD_mf) & (DE_md | E_Busy); 
	assign isStall = Stall_rs | Stall_rt | Stall_md;
	
endmodule

module Bypass(
	input [31:0] FD_Instr,
	input [31:0] DE_Instr,
	input [31:0] EM_Instr,
	input [31:0] MW_Instr,
	
	input DE_RegWrite,
	input [4:0] DE_RegDst,
	input EM_RegWrite,
	input [4:0] EM_RegDst,
	input MW_RegWrite,
	input [4:0] MW_RegDst,
	
	output [2:0] BypassDrs,
	output [2:0] BypassDrt,
	output [3:0] BypassErs,
	output [3:0] BypassErt,
	output [1:0]BypassMrt
	);
	
	wire FD_branch, FD_jr, FD_jalr;
	wire DE_cal_r, DE_cal_i, DE_md, DE_mt, DE_load, DE_store, DE_lwlr, DE_jal, DE_jalr;
	wire EM_store, EM_lwlr, EM_cal_r, EM_cal_i, EM_mf, EM_jal, EM_jalr;
	wire MW_cal_r, MW_cal_i, MW_mf, MW_load, MW_lwlr, MW_jal, MW_jalr;
	
	
	assign FD_branch = (FD_Instr[`op] == `BEQ_OP) |
	                   (FD_Instr[`op] == `BNE_OP) |
					   (FD_Instr[`op] == `BGTZ_OP) |
					   (FD_Instr[`op] == `BLEZ_OP) |
					   (FD_Instr[`op] == `BLTZ_BGEZ_OP & (FD_Instr[`rt] == `BLTZ_RT | FD_Instr[`rt] == `BGEZ_RT));
	assign FD_jr = (FD_Instr[`op] == `R_OP) &
	               (FD_Instr[`funct] == `JR_FUNCT);
	assign FD_jalr = (FD_Instr[`op] == `R_OP) &
	                 (FD_Instr[`funct] == `JALR_FUNCT);
					 
					 	 
	assign DE_cal_r = (DE_Instr[`op] == `R_OP) &
				   ((DE_Instr[`funct] == `ADDU_FUNCT) |
					(DE_Instr[`funct] == `SUBU_FUNCT) |
					(DE_Instr[`funct] == `ADD_FUNCT)  |
				    (DE_Instr[`funct] == `SUB_FUNCT)  |
				    (DE_Instr[`funct] == `AND_FUNCT)  |
				    (DE_Instr[`funct] == `OR_FUNCT)   |
				    (DE_Instr[`funct] == `XOR_FUNCT)  |
					(DE_Instr[`funct] == `NOR_FUNCT)  |
				    (DE_Instr[`funct] == `SLL_FUNCT)  |
				    (DE_Instr[`funct] == `SRL_FUNCT)  |
					(DE_Instr[`funct] == `SRA_FUNCT)  |
					(DE_Instr[`funct] == `SLLV_FUNCT) |
					(DE_Instr[`funct] == `SRLV_FUNCT) |
					(DE_Instr[`funct] == `SRAV_FUNCT) |
					(DE_Instr[`funct] == `SLT_FUNCT)  |
					(DE_Instr[`funct] == `SLTU_FUNCT));
	assign DE_cal_i = (DE_Instr[`op] == `ORI_OP)   |
					  (DE_Instr[`op] == `LUI_OP)   |
					  (DE_Instr[`op] == `ANDI_OP)  |
					  (DE_Instr[`op] == `XORI_OP)  |
					  (DE_Instr[`op] == `ADDI_OP)  |
					  (DE_Instr[`op] == `ADDIU_OP) |
					  (DE_Instr[`op] == `SLTI_OP)  |
					  (DE_Instr[`op] == `SLTIU_OP);
	assign DE_md =  ((DE_Instr[`op] == `R_OP) &
				   ((DE_Instr[`funct] == `MULT_FUNCT)  |
	                (DE_Instr[`funct] == `MULTU_FUNCT) |
				    (DE_Instr[`funct] == `DIV_FUNCT)   |
				    (DE_Instr[`funct] == `DIVU_FUNCT))) |
					(DE_Instr[`op] == `MADD_OP);
	assign DE_mt =  (DE_Instr[`op] == `R_OP) &
	                ((DE_Instr[`funct] == `MTHI_FUNCT) |
					 (DE_Instr[`funct] == `MTLO_FUNCT));
	assign DE_mtc0 = (DE_Instr[`op] == `COP0_OP) &
	                 (DE_Instr[`rs] == `MTC0_RS);
	assign DE_load = (DE_Instr[`op] == `LW_OP)  |
	                 (DE_Instr[`op] == `LH_OP)  |
					 (DE_Instr[`op] == `LHU_OP) |
					 (DE_Instr[`op] == `LB_OP)  |
					 (DE_Instr[`op] == `LBU_OP);
	assign DE_store = (DE_Instr[`op] == `SW_OP) |
	                  (DE_Instr[`op] == `SH_OP) |
					  (DE_Instr[`op] == `SB_OP) |
					  (DE_Instr[`op] == `SWL_OP) |
					  (DE_Instr[`op] == `SWR_OP);
	assign DE_jal = (DE_Instr[`op] == `JAL_OP);
	assign DE_jalr = (DE_Instr[`op] == `R_OP) &
	                 (DE_Instr[`funct] == `JALR_FUNCT);
	assign DE_lwlr = (DE_Instr[`op] == `LWL_OP) |
	                 (DE_Instr[`op] == `LWR_OP);
	
	
	assign EM_cal_r = (EM_Instr[`op] == `R_OP) &
				   ((EM_Instr[`funct] == `ADDU_FUNCT) |
					(EM_Instr[`funct] == `SUBU_FUNCT) |
					(EM_Instr[`funct] == `ADD_FUNCT)  |
				    (EM_Instr[`funct] == `SUB_FUNCT)  |
				    (EM_Instr[`funct] == `AND_FUNCT)  |
				    (EM_Instr[`funct] == `OR_FUNCT)   |
				    (EM_Instr[`funct] == `XOR_FUNCT)  |
					(EM_Instr[`funct] == `NOR_FUNCT)  |
				    (EM_Instr[`funct] == `SLL_FUNCT)  |
				    (EM_Instr[`funct] == `SRL_FUNCT)  |
					(EM_Instr[`funct] == `SRA_FUNCT)  |
					(EM_Instr[`funct] == `SLLV_FUNCT) |
					(EM_Instr[`funct] == `SRLV_FUNCT) |
					(EM_Instr[`funct] == `SRAV_FUNCT) |
					(EM_Instr[`funct] == `SLT_FUNCT)  |
					(EM_Instr[`funct] == `SLTU_FUNCT));
	assign EM_cal_i = (EM_Instr[`op] == `ORI_OP)   |
					  (EM_Instr[`op] == `LUI_OP)   |
					  (EM_Instr[`op] == `ANDI_OP)  |
					  (EM_Instr[`op] == `XORI_OP)  |
					  (EM_Instr[`op] == `ADDI_OP)  |
					  (EM_Instr[`op] == `ADDIU_OP) |
					  (EM_Instr[`op] == `SLTI_OP)  |
					  (EM_Instr[`op] == `SLTIU_OP);
	assign EM_mf =  (EM_Instr[`op] == `R_OP) &
	                ((EM_Instr[`funct] == `MFHI_FUNCT) |
					 (EM_Instr[`funct] == `MFLO_FUNCT));
	assign EM_mfc0 = (EM_Instr[`op] == `COP0_OP) & 
	                 (EM_Instr[`rs] == `MFC0_RS);
	assign EM_store = (EM_Instr[`op] == `SW_OP) |
	                  (EM_Instr[`op] == `SH_OP) |
					  (EM_Instr[`op] == `SB_OP) |
					  (EM_Instr[`op] == `SWL_OP) |
					  (EM_Instr[`op] == `SWR_OP);
	assign EM_lwlr = (EM_Instr[`op] == `LWL_OP) |
	                 (EM_Instr[`op] == `LWR_OP);
	assign EM_jal = (EM_Instr[`op] == `JAL_OP);
	assign EM_jalr = (EM_Instr[`op] == `R_OP) &
	                 (EM_Instr[`funct] == `JALR_FUNCT);
					 
	
	assign MW_cal_r = (MW_Instr[`op] == `R_OP) &
				   ((MW_Instr[`funct] == `ADDU_FUNCT) |
					(MW_Instr[`funct] == `SUBU_FUNCT) |
					(MW_Instr[`funct] == `ADD_FUNCT)  |
				    (MW_Instr[`funct] == `SUB_FUNCT)  |
				    (MW_Instr[`funct] == `AND_FUNCT)  |
				    (MW_Instr[`funct] == `OR_FUNCT)   |
				    (MW_Instr[`funct] == `XOR_FUNCT)  |
					(MW_Instr[`funct] == `NOR_FUNCT)  |
				    (MW_Instr[`funct] == `SLL_FUNCT)  |
				    (MW_Instr[`funct] == `SRL_FUNCT)  |
					(MW_Instr[`funct] == `SRA_FUNCT)  |
					(MW_Instr[`funct] == `SLLV_FUNCT) |
					(MW_Instr[`funct] == `SRLV_FUNCT) |
					(MW_Instr[`funct] == `SRAV_FUNCT) |
					(MW_Instr[`funct] == `SLT_FUNCT)  |
					(MW_Instr[`funct] == `SLTU_FUNCT));
	assign MW_cal_i = (MW_Instr[`op] == `ORI_OP)   |
					  (MW_Instr[`op] == `LUI_OP)   |
					  (MW_Instr[`op] == `ANDI_OP)  |
					  (MW_Instr[`op] == `XORI_OP)  |
					  (MW_Instr[`op] == `ADDI_OP)  |
					  (MW_Instr[`op] == `ADDIU_OP) |
					  (MW_Instr[`op] == `SLTI_OP)  |
					  (MW_Instr[`op] == `SLTIU_OP);
	assign MW_mf =  (MW_Instr[`op] == `R_OP) &
	                ((MW_Instr[`funct] == `MFHI_FUNCT) |
					 (MW_Instr[`funct] == `MFLO_FUNCT));
	assign MW_mfc0 = (MW_Instr[`op] == `COP0_OP) & 
	                 (MW_Instr[`rs] == `MFC0_RS);
	assign MW_load = (MW_Instr[`op] == `LW_OP)  |
	                 (MW_Instr[`op] == `LH_OP)  |
					 (MW_Instr[`op] == `LHU_OP) |
					 (MW_Instr[`op] == `LB_OP)  |
					 (MW_Instr[`op] == `LBU_OP);
	assign MW_lwlr = (MW_Instr[`op] == `LWL_OP) |
	                 (MW_Instr[`op] == `LWR_OP);
	assign MW_jal = (MW_Instr[`op] == `JAL_OP);
	assign MW_jalr = (MW_Instr[`op] == `R_OP) &
	                 (MW_Instr[`funct] == `JALR_FUNCT);
	

	assign BypassDrs = ~((FD_branch | FD_jr | FD_jalr) & |(FD_Instr[`rs])) ? 3'b000 :
                       ((DE_jal | DE_jalr) & DE_RegWrite & FD_Instr[`rs] == DE_RegDst) ? 3'b001 :
                       ((EM_jal | EM_jalr) & EM_RegWrite & FD_Instr[`rs] == EM_RegDst) ? 3'b010 :
					   ((EM_cal_r | EM_cal_i) & EM_RegWrite & FD_Instr[`rs] == EM_RegDst) ? 3'b011 :
					   (EM_mf & EM_RegWrite & FD_Instr[`rs] == EM_RegDst) ? 3'b100 : 
					   (EM_mfc0 & EM_RegWrite & FD_Instr[`rs] == EM_RegDst) ? 3'b101 : 3'b000;
					   
	assign BypassDrt = ~(FD_branch & |(FD_Instr[`rt])) ? 3'b000 :
                       ((DE_jal | DE_jalr) & DE_RegWrite & FD_Instr[`rt] == DE_RegDst) ? 3'b001 :
                       ((EM_jal | EM_jalr) & EM_RegWrite & FD_Instr[`rt] == EM_RegDst) ? 3'b010 :
					   ((EM_cal_r | EM_cal_i) & EM_RegWrite & FD_Instr[`rt] == EM_RegDst) ? 3'b011 :
					   (EM_mf & EM_RegWrite & FD_Instr[`rt] == EM_RegDst) ? 3'b100 : 
					   (EM_mfc0 & EM_RegWrite & FD_Instr[`rt] == EM_RegDst) ? 3'b101 : 3'b000;                     
					   
	assign BypassErs = ~((DE_cal_r | DE_cal_i | DE_md | DE_mt | DE_load | DE_store | DE_lwlr) & |(DE_Instr[`rs])) ? 4'b0000 :
	                   ((EM_jal | EM_jalr) & EM_RegWrite & DE_Instr[`rs] == EM_RegDst) ? 4'b0001 : 
					   ((EM_cal_r | EM_cal_i) & EM_RegWrite & DE_Instr[`rs] == EM_RegDst) ? 4'b0010 :
					   (EM_mf & EM_RegWrite & DE_Instr[`rs] == EM_RegDst) ? 4'b0011 :
					   (EM_mfc0 & EM_RegWrite & DE_Instr[`rs] == EM_RegDst) ? 4'b0100 :
					   ((MW_jal | MW_jalr) & MW_RegWrite & DE_Instr[`rs] == MW_RegDst) ? 4'b0101 :
					   ((MW_cal_r | MW_cal_i) & MW_RegWrite & DE_Instr[`rs] == MW_RegDst) ? 4'b0110 : 
					   (MW_mf & MW_RegWrite & DE_Instr[`rs] == MW_RegDst) ? 4'b0111 : 
					   (MW_mfc0 & MW_RegWrite & DE_Instr[`rs] == MW_RegDst) ? 4'b1000 :
					   ((MW_load | MW_lwlr) & MW_RegWrite & DE_Instr[`rs] == MW_RegDst) ? 4'b1001 : 4'b0000;
	
	assign BypassErt = ~((DE_cal_r | DE_md | DE_store | DE_mtc0 | DE_lwlr) & |(DE_Instr[`rt])) ? 4'b0000 :
	                   ((EM_jal | EM_jalr) & EM_RegWrite & DE_Instr[`rt] == EM_RegDst) ? 4'b0001 : 
					   ((EM_cal_r | EM_cal_i) & EM_RegWrite & DE_Instr[`rt] == EM_RegDst) ? 4'b0010 :
					   (EM_mf & EM_RegWrite & DE_Instr[`rt] == EM_RegDst) ? 4'b0011 :
					   (EM_mfc0 & EM_RegWrite & DE_Instr[`rt] == EM_RegDst) ? 4'b0100 :
					   ((MW_jal | MW_jalr) & MW_RegWrite & DE_Instr[`rt] == MW_RegDst) ? 4'b0101 :
					   ((MW_cal_r | MW_cal_i) & MW_RegWrite & DE_Instr[`rt] == MW_RegDst) ? 4'b0110 : 
					   (MW_mf & MW_RegWrite & DE_Instr[`rt] == MW_RegDst) ? 4'b0111 :
					   (MW_mfc0 & MW_RegWrite & DE_Instr[`rt] == MW_RegDst) ? 4'b1000 :
					   ((MW_load | MW_lwlr) & MW_RegWrite & DE_Instr[`rt] == MW_RegDst) ? 4'b1001 : 4'b0000;
					   
	assign BypassMrt = ~((EM_store | EM_lwlr) & |(EM_Instr[`rt])) ? 2'b00 :
	                   ((MW_load | MW_lwlr) & MW_RegWrite & EM_Instr[`rt] == MW_RegDst) ? 2'b01 : 2'b00;
	
	
endmodule


`endif





