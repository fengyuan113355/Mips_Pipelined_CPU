`timescale 1ns / 1ps



module mips(
    input clk,
	input reset
	);

	wire StallPC;
	wire [31:0] F_Instr, F_PCplus4;
	
	wire StallFD; 
	wire [1:0] EXTOp, NPCSel;
	wire isBranch;
	wire [1:0] BypassDrs, BypassDrt;
	wire D_RegWrite;
	wire [31:0] FD_Instr, FD_PCplus4;
	wire [31:0] D_Instr, D_NPC, D_NPC_PCplus8, D_GRF_RData1, D_GRF_RData2, D_EXT;
	wire D_isBranch;
	
	wire FlushDE;
	wire [2:0] ALUOp; 
	wire ALUSrc;
	wire [2:0] BypassErs, BypassErt;
	wire [31:0] DE_Instr, DE_PCplus8, DE_GRF_RData1, DE_GRF_RData2, DE_EXT;
	wire [31:0] E_Instr, E_PCplus8, E_ALU_Out, E_M_WData;
	
	wire MemWrite;
	wire [1:0] BypassMrt;
	wire [31:0] EM_Instr, EM_ALUOut, EM_M_WData, EM_PCplus8;
	wire [31:0] M_Instr, M_ALUOut, M_DM_RData, M_PCplus8;
	
	wire RegWrite;
	wire [1:0] RegDst, RegSrc;
	wire [31:0] MW_Instr, MW_ALUOut, MW_DM_RData, MW_PCplus8;
	wire W_RegWrite;
	wire [4:0] W_R_WAddr;
	wire [31:0] W_R_WData;
	
	
	pStage_F Stage_F(.Clk(clk), .Reset(reset), .StallPC(StallPC), .PCSel(D_isBranch),
					 .DE_NPC(D_NPC), .F_Instr(F_Instr), .F_PCplus4(F_PCplus4));
					 
	pReg_FD Reg_FD(.Clk(clk), .Reset(reset), .En(~StallFD), .F_Instr(F_Instr), .F_PCplus4(F_PCplus4),
	               .FD_Instr(FD_Instr), .FD_PCplus4(FD_PCplus4));
	
	ctrl_D ctrld(.Instr(FD_Instr), .EXTOp(EXTOp), .NPCSel(NPCSel), .isBranch(isBranch));
	
	pStage_D Stage_D(.Clk(clk), .Reset(reset), .EXTOp(EXTOp), .NPCSel(NPCSel),.isBranch(isBranch),
	                 .BypassDrs(BypassDrs), .BypassDrt(BypassDrt),
					 .DE_PCplus8(DE_PCplus8), .EM_ALUOut(EM_ALUOut), .EM_PCplus8(EM_PCplus8),
					 .W_R_WAddr(W_R_WAddr), .W_R_WData(W_R_WData), .RegWrite(W_RegWrite),
					 .FD_Instr(FD_Instr), .FD_PCplus4(FD_PCplus4), 
					 .D_Instr(D_Instr), .D_NPC(D_NPC), .D_NPC_PCplus8(D_NPC_PCplus8), 
					 .D_GRF_RData1(D_GRF_RData1), .D_GRF_RData2(D_GRF_RData2), .D_EXT(D_EXT), .D_isBranch(D_isBranch));
	
	pReg_DE Reg_DE(.Clk(clk), .Reset(reset | FlushDE), .D_Instr(D_Instr), .D_NPC_PCplus8(D_NPC_PCplus8),
	        .D_GRF_RData1(D_GRF_RData1), .D_GRF_RData2(D_GRF_RData2), .D_EXT(D_EXT), 
			.DE_Instr(DE_Instr), .DE_PCplus8(DE_PCplus8), .DE_GRF_RData1(DE_GRF_RData1), 
			.DE_GRF_RData2(DE_GRF_RData2), .DE_EXT(DE_EXT));
	
	ctrl_E ctrle(.Instr(DE_Instr), .ALUOp(ALUOp), .ALUSrc(ALUSrc));
	
	pStage_E Stage_E(.ALUOp(ALUOp), .ALUSrc(ALUSrc), .BypassErs(BypassErs), .BypassErt(BypassErt),
					 .EM_ALUOut(EM_ALUOut), .EM_PCplus8(EM_PCplus8), .MW_ALUOut(MW_ALUOut),
					 .MW_DM_RData(MW_DM_RData), .MW_PCplus8(MW_PCplus8), .DE_Instr(DE_Instr),
					 .DE_PCplus8(DE_PCplus8), .DE_GRF_RData1(DE_GRF_RData1),
					 .DE_GRF_RData2(DE_GRF_RData2), .DE_EXT(DE_EXT), .E_Instr(E_Instr),
					 .E_PCplus8(E_PCplus8), .E_ALU_Out(E_ALU_Out), .E_M_WData(E_M_WData));
					 
    pReg_EM Reg_EM(.Clk(clk), .Reset(reset), .E_Instr(E_Instr), .E_PCplus8(E_PCplus8),
				   .E_ALU_Out(E_ALU_Out), .E_M_WData(E_M_WData), .EM_Instr(EM_Instr),
				   .EM_PCplus8(EM_PCplus8), .EM_ALUOut(EM_ALUOut), .EM_M_WData(EM_M_WData));
	
	ctrl_M ctrlm(.Instr(EM_Instr), .MemWrite(MemWrite));

	pStage_M Stage_M(.Clk(clk), .Reset(reset), .MemWrite(MemWrite), .BypassMrt(BypassMrt),
	                 .MW_ALUOut(MW_ALUOut), .MW_DM_RData(MW_DM_RData), .MW_PCplus8(MW_PCplus8),
					 .EM_Instr(EM_Instr), .EM_ALUOut(EM_ALUOut), .EM_M_WData(EM_M_WData), .EM_PCplus8(EM_PCplus8),
					 .M_Instr(M_Instr), .M_ALUOut(M_ALUOut), .M_DM_RData(M_DM_RData), .M_PCplus8(M_PCplus8));
					 
	pReg_MW Reg_MW(.Clk(clk), .Reset(reset), .M_Instr(M_Instr), .M_ALUOut(M_ALUOut), .M_DM_RData(M_DM_RData),
	               .M_PCplus8(M_PCplus8), .MW_Instr(MW_Instr), .MW_ALUOut(MW_ALUOut),
				   .MW_DM_RData(MW_DM_RData), .MW_PCplus8(MW_PCplus8));
				   
	ctrl_W ctrlw(.Instr(MW_Instr), .RegWrite(RegWrite), .RegDst(RegDst), .RegSrc(RegSrc));
	
	pStage_W Stage_W(.RegWrite(RegWrite), .RegDst(RegDst), .RegSrc(RegSrc), .MW_Instr(MW_Instr),
	                 .MW_ALUOut(MW_ALUOut), .MW_DM_RData(MW_DM_RData), .MW_PCplus8(MW_PCplus8),
					 .W_RegWrite(W_RegWrite), .W_R_WAddr(W_R_WAddr), .W_R_WData(W_R_WData));
	
	stall stall_ctrl(.FD_Instr(FD_Instr), .DE_Instr(DE_Instr), .EM_Instr(EM_Instr),
	                 .StallPC(StallPC), .StallFD(StallFD), .FlushDE(FlushDE));
	
	Bypass Bypass_ctrl(.FD_Instr(FD_Instr), .DE_Instr(DE_Instr), .EM_Instr(EM_Instr), .MW_Instr(MW_Instr),
	                   .BypassDrs(BypassDrs), .BypassDrt(BypassDrt), .BypassErs(BypassErs), .BypassErt(BypassErt),
					   .BypassMrt(BypassMrt));
					   
					   
	
	

endmodule
