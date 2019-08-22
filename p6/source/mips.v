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
	wire [31:0] D_Instr, D_NPC, D_PCplus8, D_RData1, D_RData2, D_EXT;
	wire D_isBranch, D_RegWrite;
	wire [4:0] D_RegDst;
	
	wire FlushDE;
	wire [3:0] ALUOp; 
	wire ALUSrc, HILOSel, E_Busy;
	wire [1:0] COMPOp;
	wire [2:0] MDOp, BypassErs, BypassErt;
	wire [31:0] DE_Instr, DE_PCplus8, DE_RData1, DE_RData2, DE_EXT;
	wire DE_RegWrite;
	wire [4:0] DE_RegDst;
	wire [31:0] E_Instr, E_PCplus8, E_ALU_Out, E_HILO, E_RData2;
	wire E_RegWrite;
	wire [4:0] E_RegDst;
	
	wire MemWrite;
	wire [2:0] MemWOp;
	wire [1:0] BypassMrt;
	wire [31:0] EM_Instr, EM_ALUOut, EM_PCplus8, EM_HILO, EM_RData2;
	wire EM_RegWrite;
	wire [4:0] EM_RegDst;
	wire [31:0] M_Instr, M_ALUOut, M_DM_RData, M_PCplus8, M_HILO, M_RData2;
	wire M_RegWrite;
	wire [4:0] M_RegDst;
	
	
	wire [1:0] RegSrc;
	wire [2:0] DEXTOp;
	wire [31:0] MW_Instr, MW_ALUOut, W_DOut, MW_PCplus8, MW_HILO, MW_DM_RData, MW_RData2;
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
					 .DE_PCplus8(DE_PCplus8), .EM_PCplus8(EM_PCplus8), .EM_ALUOut(EM_ALUOut), .EM_HILO(EM_HILO),
					 .W_RegWrite(W_RegWrite), .W_RegDst(W_RegDst), .W_R_WData(W_R_WData),
					 .FD_Instr(FD_Instr), .FD_PCplus4(FD_PCplus4), 
					 .D_Instr(D_Instr), .D_NPC(D_NPC), .D_PCplus8(D_PCplus8), 
					 .D_RData1(D_RData1), .D_RData2(D_RData2), .D_EXT(D_EXT), .D_isBranch(D_isBranch), 
					 .D_RegWrite(D_RegWrite), .D_RegDst(D_RegDst));
	
	pReg_DE Reg_DE(.Clk(clk), .Reset(reset | FlushDE), 
				   .D_Instr(D_Instr), .D_PCplus8(D_PCplus8),
				   .D_RData1(D_RData1), .D_RData2(D_RData2), .D_EXT(D_EXT), 
				   .D_RegWrite(D_RegWrite), .D_RegDst(D_RegDst),
				   .DE_Instr(DE_Instr), .DE_PCplus8(DE_PCplus8), .DE_RData1(DE_RData1), 
				   .DE_RData2(DE_RData2), .DE_EXT(DE_EXT), .DE_RegWrite(DE_RegWrite), .DE_RegDst(DE_RegDst));
	
	ctrl_E ctrle(.Instr(DE_Instr), .ALUOp(ALUOp), .ALUSrc(ALUSrc), .COMPOp(COMPOp), .MDOp(MDOp), .HILOSel(HILOSel));
	
	pStage_E Stage_E(.Clk(clk), .Reset(reset),
	                 .ALUOp(ALUOp), .ALUSrc(ALUSrc), .COMPOp(COMPOp), .MDOp(MDOp), .HILOSel(HILOSel),
	                 .BypassErs(BypassErs), .BypassErt(BypassErt),
					 .EM_PCplus8(EM_PCplus8), .EM_ALUOut(EM_ALUOut), .EM_HILO(EM_HILO), 
					 .MW_PCplus8(MW_PCplus8), .MW_ALUOut(MW_ALUOut), .MW_HILO(MW_HILO), .W_DOut(W_DOut),  
					 .DE_Instr(DE_Instr), .DE_PCplus8(DE_PCplus8), .DE_RData1(DE_RData1),
					 .DE_RData2(DE_RData2), .DE_EXT(DE_EXT), .DE_RegWrite(DE_RegWrite), .DE_RegDst(DE_RegDst),
					 .E_Instr(E_Instr), .E_PCplus8(E_PCplus8), .E_ALU_Out(E_ALU_Out), .E_HILO(E_HILO),
					 .E_RegWrite(E_RegWrite), .E_RegDst(E_RegDst), .E_RData2(E_RData2), .E_Busy(E_Busy));
					 
    pReg_EM Reg_EM(.Clk(clk), .Reset(reset), 
	               .E_Instr(E_Instr), .E_PCplus8(E_PCplus8),.E_ALU_Out(E_ALU_Out), .E_HILO(E_HILO), .E_RegWrite(E_RegWrite), .E_RegDst(E_RegDst), .E_RData2(E_RData2),
				   .EM_Instr(EM_Instr), .EM_PCplus8(EM_PCplus8), .EM_ALUOut(EM_ALUOut), .EM_HILO(EM_HILO), .EM_RegWrite(EM_RegWrite), .EM_RegDst(EM_RegDst), .EM_RData2(EM_RData2));
	
	ctrl_M ctrlm(.Instr(EM_Instr), .MemWrite(MemWrite), .MemWOp(MemWOp));

	pStage_M Stage_M(.Clk(clk), .Reset(reset), .MemWrite(MemWrite), .MemWOp(MemWOp), .BypassMrt(BypassMrt),
	                 .W_DOut(W_DOut),
					 .EM_Instr(EM_Instr), .EM_ALUOut(EM_ALUOut), .EM_PCplus8(EM_PCplus8), .EM_HILO(EM_HILO), .EM_RegWrite(EM_RegWrite), .EM_RegDst(EM_RegDst), .EM_RData2(EM_RData2),
					 .M_Instr(M_Instr), .M_ALUOut(M_ALUOut), .M_DM_RData(M_DM_RData), .M_PCplus8(M_PCplus8), .M_HILO(M_HILO), .M_RegWrite(M_RegWrite), .M_RegDst(M_RegDst), .M_RData2(M_RData2));
					 
	pReg_MW Reg_MW(.Clk(clk), .Reset(reset), 
	               .M_Instr(M_Instr), .M_ALUOut(M_ALUOut), .M_DM_RData(M_DM_RData), .M_PCplus8(M_PCplus8), .M_HILO(M_HILO), .M_RegWrite(M_RegWrite), .M_RegDst(M_RegDst), .M_RData2(M_RData2),
				   .MW_Instr(MW_Instr), .MW_ALUOut(MW_ALUOut), .MW_DM_RData(MW_DM_RData), .MW_PCplus8(MW_PCplus8), .MW_HILO(MW_HILO), .MW_RegWrite(MW_RegWrite), .MW_RegDst(MW_RegDst), .MW_RData2(MW_RData2));
				   
	ctrl_W ctrlw(.Instr(MW_Instr), .RegSrc(RegSrc), .DEXTOp(DEXTOp));
	
	pStage_W Stage_W(.RegSrc(RegSrc), .DEXTOp(DEXTOp), 
	                 .MW_Instr(MW_Instr), .MW_ALUOut(MW_ALUOut), .MW_DM_RData(MW_DM_RData), .MW_PCplus8(MW_PCplus8), .MW_HILO(MW_HILO), .MW_RegWrite(MW_RegWrite), .MW_RegDst(MW_RegDst), .MW_RData2(MW_RData2),
					 .W_RegWrite(W_RegWrite), .W_RegDst(W_RegDst), .W_R_WData(W_R_WData), .W_DOut(W_DOut));
	
	stall stall_ctrl(.FD_Instr(FD_Instr), .DE_Instr(DE_Instr), .EM_Instr(EM_Instr), .E_Busy(E_Busy),
					 .DE_RegWrite(DE_RegWrite), .DE_RegDst(DE_RegDst), .EM_RegWrite(EM_RegWrite), .EM_RegDst(EM_RegDst),
	                 .StallPC(StallPC), .StallFD(StallFD), .FlushDE(FlushDE));
	
	Bypass Bypass_ctrl(.FD_Instr(FD_Instr), .DE_Instr(DE_Instr), .EM_Instr(EM_Instr), .MW_Instr(MW_Instr),
					   .DE_RegWrite(DE_RegWrite), .DE_RegDst(DE_RegDst), .EM_RegWrite(EM_RegWrite), .EM_RegDst(EM_RegDst), .MW_RegWrite(MW_RegWrite), .MW_RegDst(MW_RegDst),
	                   .BypassDrs(BypassDrs), .BypassDrt(BypassDrt), .BypassErs(BypassErs), 
					   .BypassErt(BypassErt), .BypassMrt(BypassMrt));
					   	

endmodule
