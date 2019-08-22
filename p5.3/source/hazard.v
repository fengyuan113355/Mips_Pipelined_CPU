`timescale 1ns / 1ps
`ifndef HAZARD
`define HAZARD

`include "signal_def.v"

module stall(
	input [31:0] FD_Instr,
	input [31:0] DE_Instr,
	input [31:0] EM_Instr,
	input DE_RegWrite,
	input [4:0] DE_RegDst,
	input EM_RegWrite,
	input [4:0] EM_RegDst,
	output StallPC,
	output StallFD,
	output FlushDE
    );

	wire isStall, Stall_rs, Stall_rt;

	wire FD_branch, FD_jr, FD_cal_r, FD_cal_i, FD_load, FD_store;
	wire DE_cal_r, DE_cal_i, DE_load;
	wire EM_load;
	
	assign StallPC = isStall;
	assign StallFD = isStall;
	assign FlushDE = isStall;
	
	
	assign FD_branch = (FD_Instr[`op] == `BEQ_OP) |
	                   (FD_Instr[`op] == `BNE_OP);
	assign FD_jr = (FD_Instr[`op] == `R_OP) &
	               (FD_Instr[`funct] == `JR_FUNCT);
	assign FD_cal_r = (FD_Instr[`op] == `R_OP) &
				   ((FD_Instr[`funct] == `ADDU_FUNCT) |
					(FD_Instr[`funct] == `SUBU_FUNCT) |
					(FD_Instr[`funct] == `ADD_FUNCT)  |
				    (FD_Instr[`funct] == `SUB_FUNCT)  |
				    (FD_Instr[`funct] == `AND_FUNCT)  |
				    (FD_Instr[`funct] == `OR_FUNCT)   |
				    (FD_Instr[`funct] == `XOR_FUNCT)  |
				    (FD_Instr[`funct] == `SLL_FUNCT)  |
				    (FD_Instr[`funct] == `SRL_FUNCT)  |
					(FD_Instr[`funct] == `MOVZ_FUNCT));
	assign FD_cal_i = (FD_Instr[`op] == `ORI_OP)  |
					  (FD_Instr[`op] == `LUI_OP)  |
					  (FD_Instr[`op] == `ADDI_OP) |
					  (FD_Instr[`op] == `ADDIU_OP);
	assign FD_load = (FD_Instr[`op] == `LW_OP);
	assign FD_store = (FD_Instr[`op] == `SW_OP);
					 
	
	assign DE_cal_r = (DE_Instr[`op] == `R_OP) &
				   ((DE_Instr[`funct] == `ADDU_FUNCT) |
					(DE_Instr[`funct] == `SUBU_FUNCT) |
					(DE_Instr[`funct] == `ADD_FUNCT)  |
				    (DE_Instr[`funct] == `SUB_FUNCT)  |
				    (DE_Instr[`funct] == `AND_FUNCT)  |
				    (DE_Instr[`funct] == `OR_FUNCT)   |
				    (DE_Instr[`funct] == `XOR_FUNCT)  |
				    (DE_Instr[`funct] == `SLL_FUNCT)  |
				    (DE_Instr[`funct] == `SRL_FUNCT)  |
					(DE_Instr[`funct] == `MOVZ_FUNCT));
	assign DE_cal_i = (DE_Instr[`op] == `ORI_OP)  |
					  (DE_Instr[`op] == `LUI_OP)  |
					  (DE_Instr[`op] == `ADDI_OP) |
					  (DE_Instr[`op] == `ADDIU_OP);
	assign DE_load = (DE_Instr[`op] == `LW_OP);
	
	assign EM_load = (EM_Instr[`op] == `LW_OP);
	
	
	
	assign Stall_rs = |(FD_Instr[`rs]) & 
					  (((FD_branch | FD_jr) & (DE_cal_r | DE_cal_i | DE_load) & DE_RegWrite & FD_Instr[`rs] == DE_RegDst) |
					   ((FD_branch | FD_jr) & EM_load & EM_RegWrite & FD_Instr[`rs] == EM_RegDst) |
					   ((FD_cal_r | FD_cal_i | FD_load | FD_store) & DE_load & DE_RegWrite & FD_Instr[`rs] == DE_RegDst));
	assign Stall_rt = |(FD_Instr[`rt]) &
					  (((FD_branch) & (DE_cal_r | DE_cal_i | DE_load) & DE_RegWrite & FD_Instr[`rt] == DE_RegDst) |
					   (FD_branch & EM_load & EM_RegWrite & FD_Instr[`rt] == EM_RegDst) |
					   (FD_cal_r & DE_load & DE_RegWrite & FD_Instr[`rt] == DE_RegDst));
	assign isStall = Stall_rs | Stall_rt;
	
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
	output [2:0] BypassErs,
	output [2:0] BypassErt,
	output [1:0]BypassMrt
	);
	
	wire FD_branch, FD_jr;
	wire DE_cal_r, DE_cal_i, DE_load, DE_store, DE_jal;
	wire EM_store, EM_cal_r, EM_cal_i, EM_jal;
	wire MW_cal_r, MW_cal_i, MW_load, MW_jal;
	
	
	assign FD_branch = (FD_Instr[`op] == `BEQ_OP) |
	                   (FD_Instr[`op] == `BNE_OP);
	assign FD_jr =    (FD_Instr[`op] == `R_OP) & 
	                  (FD_Instr[`funct] == `JR_FUNCT);
					  
					 	 
	assign DE_cal_r = (DE_Instr[`op] == `R_OP) &
				     ((DE_Instr[`funct] == `ADDU_FUNCT) |
					  (DE_Instr[`funct] == `SUBU_FUNCT) |
					  (DE_Instr[`funct] == `ADD_FUNCT) |
					  (DE_Instr[`funct] == `SUB_FUNCT) |
					  (DE_Instr[`funct] == `AND_FUNCT) |
					  (DE_Instr[`funct] == `OR_FUNCT)  |
					  (DE_Instr[`funct] == `XOR_FUNCT) |
					  (DE_Instr[`funct] == `SLL_FUNCT) |
					  (DE_Instr[`funct] == `SRL_FUNCT) |
					  (DE_Instr[`funct] == `MOVZ_FUNCT));
	assign DE_cal_i = (DE_Instr[`op] == `ORI_OP)  |
					  (DE_Instr[`op] == `LUI_OP)  |
					  (DE_Instr[`op] == `ADDI_OP) |
					  (DE_Instr[`op] == `ADDIU_OP);
	assign DE_load =  (DE_Instr[`op] == `LW_OP);
	assign DE_store = (DE_Instr[`op] == `SW_OP);
	assign DE_jal =   (DE_Instr[`op] == `JAL_OP);
	
	
	assign EM_store = (EM_Instr[`op] == `SW_OP);
	assign EM_cal_r = (EM_Instr[`op] == `R_OP) &
				     ((EM_Instr[`funct] == `ADDU_FUNCT) |
					  (EM_Instr[`funct] == `SUBU_FUNCT) |
					  (EM_Instr[`funct] == `ADD_FUNCT)  |
					  (EM_Instr[`funct] == `SUB_FUNCT)  |
					  (EM_Instr[`funct] == `AND_FUNCT)  |
					  (EM_Instr[`funct] == `OR_FUNCT)   |
					  (EM_Instr[`funct] == `XOR_FUNCT)  |
					  (EM_Instr[`funct] == `SLL_FUNCT)  |
					  (EM_Instr[`funct] == `SRL_FUNCT)  |
					  (EM_Instr[`funct] == `MOVZ_FUNCT));
	assign EM_cal_i = (EM_Instr[`op] == `ORI_OP)  |
					  (EM_Instr[`op] == `LUI_OP)  |
					  (EM_Instr[`op] == `ADDI_OP) |
					  (EM_Instr[`op] == `ADDIU_OP);
	assign EM_jal =   (EM_Instr[`op] == `JAL_OP);
	
	assign MW_cal_r = (MW_Instr[`op] == `R_OP) &
				     ((MW_Instr[`funct] == `ADDU_FUNCT) |
					  (MW_Instr[`funct] == `SUBU_FUNCT) |
					  (MW_Instr[`funct] == `ADD_FUNCT)  |
					  (MW_Instr[`funct] == `SUB_FUNCT)  |
					  (MW_Instr[`funct] == `AND_FUNCT)  |
					  (MW_Instr[`funct] == `OR_FUNCT)   |
					  (MW_Instr[`funct] == `XOR_FUNCT)  |
					  (MW_Instr[`funct] == `SLL_FUNCT)  |
					  (MW_Instr[`funct] == `SRL_FUNCT)  |
					  (MW_Instr[`funct] == `MOVZ_FUNCT));
	assign MW_cal_i = (MW_Instr[`op] == `ORI_OP)  |
					  (MW_Instr[`op] == `LUI_OP)  |
					  (MW_Instr[`op] == `ADDI_OP) |
					  (MW_Instr[`op] == `ADDIU_OP);
	assign MW_load =  (MW_Instr[`op] == `LW_OP);				 
	assign MW_jal =   (MW_Instr[`op] == `JAL_OP);
	

	assign BypassDrs = ~((FD_branch | FD_jr) & |(FD_Instr[`rs])) ? 3'b000 :
                       (DE_jal & DE_RegWrite & FD_Instr[`rs] == DE_RegDst) ? 3'b001 :
                       ((EM_cal_r | EM_cal_i) & EM_RegWrite & FD_Instr[`rs] == EM_RegDst) ? 3'b010 :
                       (EM_jal & EM_RegWrite & FD_Instr[`rs] == EM_RegDst) ? 3'b011 : 3'b000;
					   
	assign BypassDrt = ~(FD_branch & |(FD_Instr[`rt])) ? 3'b000 :
                       (DE_jal & DE_RegWrite & FD_Instr[`rt] == DE_RegDst) ? 3'b001 :
                       ((EM_cal_r | EM_cal_i) & EM_RegWrite & FD_Instr[`rt] == EM_RegDst) ? 3'b010 :
                       (EM_jal & EM_RegWrite & FD_Instr[`rt] == EM_RegDst) ? 3'b011 : 3'b000;
					   
	assign BypassErs = ~((DE_cal_r | DE_cal_i | DE_load | DE_store) & |(DE_Instr[`rs])) ? 3'b000 :
	                   ((EM_cal_r | EM_cal_i) & EM_RegWrite & DE_Instr[`rs] == EM_RegDst) ? 3'b001 :
					   (EM_jal & EM_RegWrite & DE_Instr[`rs] == EM_RegDst) ? 3'b010 :
					   ((MW_cal_r | MW_cal_i) & MW_RegWrite & DE_Instr[`rs] == MW_RegDst) ? 3'b011 :
					   (MW_load & MW_RegWrite & DE_Instr[`rs] == MW_RegDst) ? 3'b100 :
					   (MW_jal & MW_RegWrite & DE_Instr[`rs] == MW_RegDst) ? 3'b101 : 3'b000;
	
	assign BypassErt = ~((DE_cal_r | DE_store) & |(DE_Instr[`rt])) ? 3'b000 :
	                   ((EM_cal_r | EM_cal_i) & EM_RegWrite & DE_Instr[`rt] == EM_RegDst) ? 3'b001 :
					   (EM_jal & EM_RegWrite & DE_Instr[`rt] == EM_RegDst) ? 3'b010 :
					   ((MW_cal_r | MW_cal_i) & MW_RegWrite & DE_Instr[`rt] == MW_RegDst) ? 3'b011 :
					   (MW_load & MW_RegWrite & DE_Instr[`rt] == MW_RegDst) ? 3'b100 :
					   (MW_jal & MW_RegWrite & DE_Instr[`rt] == MW_RegDst) ? 3'b101 : 3'b000;
					   
	assign BypassMrt = ~(EM_store & |(EM_Instr[`rt])) ? 2'b00 :
	                   (MW_load & MW_RegWrite & EM_Instr[`rt] == MW_RegDst) ? 2'b01 : 2'b00;
	
	
endmodule



`endif























