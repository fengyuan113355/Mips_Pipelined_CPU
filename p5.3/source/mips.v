`timescale 1ns / 1ps



module mips(
    input clk,
	input reset
	);

	wire StallPC;
	wire [31:0] F_Instr, F_PCplus4;
	
	wire StallFD; 
	wire [1:0] EXTOp, NPCSel;
	wire [2:0] CMPOp;
	wire [4:0] RegDst;
	wire isBranch, RegWrite;
	wire [2:0] BypassDrs, BypassDrt;
	wire [31:0] FD_Instr, FD_PCplus4;
	wire [31:0] D_Instr, D_NPC, D_NPC_PCplus8, D_GRF_RData1, D_GRF_RData2, D_EXT;
	wire D_isBranch, D_RegWrite;
	wire [4:0] D_RegDst;
	
	wire FlushDE;
	wire [3:0] ALUOp; 
	wire ALUSrc;
	wire [1:0] COMPOp;
	wire [2:0] BypassErs, BypassErt;
	wire [31:0] DE_Instr, DE_PCplus8, DE_GRF_RData1, DE_GRF_RData2, DE_EXT;
	wire DE_RegWrite;
	wire [4:0] DE_RegDst;
	wire [31:0] E_Instr, E_PCplus8, E_ALU_Out, E_M_WData;
	wire E_RegWrite;
	wire [4:0] E_RegDst;
	
	wire MemWrite;
	wire [1:0] BypassMrt;
	wire [31:0] EM_Instr, EM_ALUOut, EM_M_WData, EM_PCplus8;
	wire EM_RegWrite;
	wire [4:0] EM_RegDst;
	wire [31:0] M_Instr, M_ALUOut, M_DM_RData, M_PCplus8;
	wire M_RegWrite;
	wire [4:0] M_RegDst;
	
	
	wire [1:0] RegSrc;
	wire [31:0] MW_Instr, MW_ALUOut, MW_DM_RData, MW_PCplus8;
	wire MW_RegWrite;
	wire [4:0] MW_RegDst;
	wire W_RegWrite;
	wire [4:0] W_RegDst;
	wire [31:0] W_R_WData;
	
	
	pStage_F Stage_F(.Clk(clk), .Reset(reset), 
	                 .StallPC(StallPC), .PCSel(D_isBranch),.D_NPC(D_NPC), 
					 .F_Instr(F_Instr), .F_PCplus4(F_PCplus4));
					 
	pReg_FD Reg_FD(.Clk(clk), .Reset(reset), 
	               .En(~StallFD), .F_Instr(F_Instr), .F_PCplus4(F_PCplus4),
	               .FD_Instr(FD_Instr), .FD_PCplus4(FD_PCplus4));
	
	ctrl_D ctrld(.Instr(FD_Instr), .EXTOp(EXTOp), .NPCSel(NPCSel), .CMPOp(CMPOp), .isBranch(isBranch), .RegWrite(RegWrite), .RegDst(RegDst));
	
	pStage_D Stage_D(.Clk(clk), .Reset(reset), 
	                 .EXTOp(EXTOp), .NPCSel(NPCSel), .CMPOp(CMPOp), .isBranch(isBranch), .RegWrite(RegWrite), .RegDst(RegDst),
	                 .BypassDrs(BypassDrs), .BypassDrt(BypassDrt),
					 .DE_PCplus8(DE_PCplus8), .EM_ALUOut(EM_ALUOut), .EM_PCplus8(EM_PCplus8),
					 .W_RegWrite(W_RegWrite), .W_RegDst(W_RegDst), .W_R_WData(W_R_WData),
					 .FD_Instr(FD_Instr), .FD_PCplus4(FD_PCplus4), 
					 .D_Instr(D_Instr), .D_NPC(D_NPC), .D_NPC_PCplus8(D_NPC_PCplus8), 
					 .D_GRF_RData1(D_GRF_RData1), .D_GRF_RData2(D_GRF_RData2), .D_EXT(D_EXT), .D_isBranch(D_isBranch), 
					 .D_RegWrite(D_RegWrite), .D_RegDst(D_RegDst));
	
	pReg_DE Reg_DE(.Clk(clk), .Reset(reset | FlushDE), 
				   .D_Instr(D_Instr), .D_NPC_PCplus8(D_NPC_PCplus8),
				   .D_GRF_RData1(D_GRF_RData1), .D_GRF_RData2(D_GRF_RData2), .D_EXT(D_EXT), 
				   .D_RegWrite(D_RegWrite), .D_RegDst(D_RegDst),
				   .DE_Instr(DE_Instr), .DE_PCplus8(DE_PCplus8), .DE_GRF_RData1(DE_GRF_RData1), 
				   .DE_GRF_RData2(DE_GRF_RData2), .DE_EXT(DE_EXT), .DE_RegWrite(DE_RegWrite), .DE_RegDst(DE_RegDst));
	
	ctrl_E ctrle(.Instr(DE_Instr), .ALUOp(ALUOp), .ALUSrc(ALUSrc), .COMPOp(COMPOp));
	
	pStage_E Stage_E(.ALUOp(ALUOp), .ALUSrc(ALUSrc), .COMPOp(COMPOp), 
	                 .BypassErs(BypassErs), .BypassErt(BypassErt),
					 .EM_ALUOut(EM_ALUOut), .EM_PCplus8(EM_PCplus8), 
					 .MW_ALUOut(MW_ALUOut), .MW_DM_RData(MW_DM_RData), .MW_PCplus8(MW_PCplus8), 
					 .DE_Instr(DE_Instr), .DE_PCplus8(DE_PCplus8), .DE_GRF_RData1(DE_GRF_RData1),
					 .DE_GRF_RData2(DE_GRF_RData2), .DE_EXT(DE_EXT), .DE_RegWrite(DE_RegWrite), .DE_RegDst(DE_RegDst),
					 .E_Instr(E_Instr), .E_PCplus8(E_PCplus8), .E_ALU_Out(E_ALU_Out), .E_M_WData(E_M_WData), .E_RegWrite(E_RegWrite), .E_RegDst(E_RegDst));
					 
    pReg_EM Reg_EM(.Clk(clk), .Reset(reset), 
	               .E_Instr(E_Instr), .E_PCplus8(E_PCplus8),.E_ALU_Out(E_ALU_Out), .E_M_WData(E_M_WData), .E_RegWrite(E_RegWrite), .E_RegDst(E_RegDst),
				   .EM_Instr(EM_Instr), .EM_PCplus8(EM_PCplus8), .EM_ALUOut(EM_ALUOut), .EM_M_WData(EM_M_WData), .EM_RegWrite(EM_RegWrite), .EM_RegDst(EM_RegDst));
	
	ctrl_M ctrlm(.Instr(EM_Instr), .MemWrite(MemWrite));

	pStage_M Stage_M(.Clk(clk), .Reset(reset), .MemWrite(MemWrite), .BypassMrt(BypassMrt),
	                 .MW_ALUOut(MW_ALUOut), .MW_DM_RData(MW_DM_RData), .MW_PCplus8(MW_PCplus8),
					 .EM_Instr(EM_Instr), .EM_ALUOut(EM_ALUOut), .EM_M_WData(EM_M_WData), .EM_PCplus8(EM_PCplus8), .EM_RegWrite(EM_RegWrite), .EM_RegDst(EM_RegDst),
					 .M_Instr(M_Instr), .M_ALUOut(M_ALUOut), .M_DM_RData(M_DM_RData), .M_PCplus8(M_PCplus8), .M_RegWrite(M_RegWrite), .M_RegDst(M_RegDst));
					 
	pReg_MW Reg_MW(.Clk(clk), .Reset(reset), 
	               .M_Instr(M_Instr), .M_ALUOut(M_ALUOut), .M_DM_RData(M_DM_RData), .M_PCplus8(M_PCplus8), .M_RegWrite(M_RegWrite), .M_RegDst(M_RegDst),
				   .MW_Instr(MW_Instr), .MW_ALUOut(MW_ALUOut), .MW_DM_RData(MW_DM_RData), .MW_PCplus8(MW_PCplus8), .MW_RegWrite(MW_RegWrite), .MW_RegDst(MW_RegDst));
				   
	ctrl_W ctrlw(.Instr(MW_Instr), .RegSrc(RegSrc));
	
	pStage_W Stage_W(.RegSrc(RegSrc), 
	                 .MW_Instr(MW_Instr), .MW_ALUOut(MW_ALUOut), .MW_DM_RData(MW_DM_RData), .MW_PCplus8(MW_PCplus8), .MW_RegWrite(MW_RegWrite), .MW_RegDst(MW_RegDst),
					 .W_RegWrite(W_RegWrite), .W_RegDst(W_RegDst), .W_R_WData(W_R_WData));
	
	stall stall_ctrl(.FD_Instr(FD_Instr), .DE_Instr(DE_Instr), .EM_Instr(EM_Instr),
					 .DE_RegWrite(DE_RegWrite), .DE_RegDst(DE_RegDst), .EM_RegWrite(EM_RegWrite), .EM_RegDst(EM_RegDst),
	                 .StallPC(StallPC), .StallFD(StallFD), .FlushDE(FlushDE));
	
	Bypass Bypass_ctrl(.FD_Instr(FD_Instr), .DE_Instr(DE_Instr), .EM_Instr(EM_Instr), .MW_Instr(MW_Instr),
					   .DE_RegWrite(DE_RegWrite), .DE_RegDst(DE_RegDst), .EM_RegWrite(EM_RegWrite), .EM_RegDst(EM_RegDst), .MW_RegWrite(MW_RegWrite), .MW_RegDst(MW_RegDst),
	                   .BypassDrs(BypassDrs), .BypassDrt(BypassDrt), .BypassErs(BypassErs), 
					   .BypassErt(BypassErt), .BypassMrt(BypassMrt));
					   	

endmodule
