`timescale 1ns / 1ps



module cpu(
    input clk,
	input reset,
	input [31:0] PrRD,
	input [7:2] HWInt,
	output [31:0] PrAddr,
	output [31:0] PrWD,
	output PrWe
	);

	wire StallPC;
	wire [31:0] F_Instr, F_PCplus4, F_PC;
	
	wire StallFD; 
	wire [1:0] EXTOp, NPCSel;
	wire [2:0] CMPOp;
	wire [4:0] RegDst;
	wire isBranch, RegWrite;
	wire [2:0] BypassDrs, BypassDrt;
	wire [31:0] FD_Instr, FD_PCplus4, FD_PC;
	wire [31:0] D_Instr, D_NPC, D_PCplus8, D_RData1, D_RData2, D_EXT, D_PC;
	wire D_isBranch, D_isEret, D_RegWrite;
	wire [4:0] D_RegDst;
	
	wire FlushDE;
	wire [3:0] ALUOp; 
	wire ALUSrc, HILOSel, E_Busy;
	wire [2:0] MDOp;
	wire [3:0] BypassErs, BypassErt;
	wire [31:0] DE_Instr, DE_PCplus8, DE_RData1, DE_RData2, DE_EXT, DE_PC;
	wire DE_RegWrite, DE_isBranch;
	wire [4:0] DE_RegDst;
	wire [31:0] E_Instr, E_PCplus8, E_ALU_Out, E_HILO, E_CP0, E_RData2, E_PC, E_EPC;
	wire E_RegWrite, E_isBranch;
	wire [4:0] E_RegDst;
	
	wire MemWrite;
	wire [2:0] MemWOp;
	wire [1:0] BypassMrt;
	wire [31:0] EM_Instr, EM_ALUOut, EM_PCplus8, EM_HILO, EM_CP0, EM_RData2, EM_PC;
	wire EM_RegWrite, EM_isBranch;
	wire [4:0] EM_RegDst;
	wire [31:0] M_Instr, M_ALUOut, M_DM_RData, M_PCplus8, M_HILO, M_CP0, M_RData2;
	wire M_RegWrite;
	wire [4:0] M_RegDst;
	
	
	wire [2:0] RegSrc, DEXTOp;
	wire [31:0] MW_Instr, MW_ALUOut, W_DOut, MW_PCplus8, MW_HILO, MW_CP0, MW_DM_RData, MW_RData2;
	wire MW_RegWrite;
	wire [4:0] MW_RegDst;
	wire W_RegWrite;
	wire [4:0] W_RegDst;
	wire [31:0] W_R_WData;
	
	
	pStage_F Stage_F(.Clk(clk), .Reset(reset), 
	                 .StallPC(StallPC), .D_isBranch(D_isBranch), .E_IntReq(E_IntReq), .D_isEret(D_isEret), .D_NPC(D_NPC), .E_EPC(E_EPC), 
					 .F_Instr(F_Instr), .F_PCplus4(F_PCplus4), .F_PC(F_PC));
					 
	pReg_FD Reg_FD(.Clk(clk), .Reset(reset | E_IntReq | D_isEret), 
	               .En(~StallFD), .F_Instr(F_Instr), .F_PCplus4(F_PCplus4), .F_PC(F_PC),
	               .FD_Instr(FD_Instr), .FD_PCplus4(FD_PCplus4), .FD_PC(FD_PC));
	
	ctrl_D ctrld(.Instr(FD_Instr), .EXTOp(EXTOp), .NPCSel(NPCSel), .CMPOp(CMPOp), .isBranch(isBranch), .isEret(isEret), .RegWrite(RegWrite), .RegDst(RegDst));
	
	pStage_D Stage_D(.Clk(clk), .Reset(reset), 
	                 .EXTOp(EXTOp), .NPCSel(NPCSel), .CMPOp(CMPOp), .isBranch(isBranch), .isEret(isEret), .RegWrite(RegWrite), .RegDst(RegDst),
	                 .BypassDrs(BypassDrs), .BypassDrt(BypassDrt),
					 .DE_PCplus8(DE_PCplus8), .EM_PCplus8(EM_PCplus8), .EM_ALUOut(EM_ALUOut), .EM_HILO(EM_HILO), .EM_CP0(EM_CP0),
					 .W_RegWrite(W_RegWrite), .W_RegDst(W_RegDst), .W_R_WData(W_R_WData),
					 .FD_Instr(FD_Instr), .FD_PCplus4(FD_PCplus4), .FD_PC(FD_PC),
					 .D_Instr(D_Instr), .D_NPC(D_NPC), .D_PCplus8(D_PCplus8), 
					 .D_RData1(D_RData1), .D_RData2(D_RData2), .D_EXT(D_EXT), .D_isBranch(D_isBranch), 
					 .D_RegWrite(D_RegWrite), .D_RegDst(D_RegDst), .D_PC(D_PC), .D_isEret(D_isEret));
	
	pReg_DE Reg_DE(.Clk(clk), .Reset(reset | FlushDE | E_IntReq), 
				   .D_Instr(D_Instr), .D_PCplus8(D_PCplus8),
				   .D_RData1(D_RData1), .D_RData2(D_RData2), .D_EXT(D_EXT), 
				   .D_RegWrite(D_RegWrite), .D_RegDst(D_RegDst), .D_PC(D_PC), .D_isBranch(D_isBranch), 
				   .DE_Instr(DE_Instr), .DE_PCplus8(DE_PCplus8), .DE_RData1(DE_RData1), .DE_RData2(DE_RData2), 
				   .DE_EXT(DE_EXT), .DE_RegWrite(DE_RegWrite), .DE_RegDst(DE_RegDst), .DE_PC(DE_PC), .DE_isBranch(DE_isBranch));
	
	ctrl_E ctrle(.Instr(DE_Instr), .ALUOp(ALUOp), .ALUSrc(ALUSrc), .MDOp(MDOp), .HILOSel(HILOSel), .CP0We(CP0We));
	
	pStage_E Stage_E(.Clk(clk), .Reset(reset), .HWInt(HWInt),
	                 .ALUOp(ALUOp), .ALUSrc(ALUSrc), .MDOp(MDOp), .HILOSel(HILOSel), .CP0We(CP0We), 
	                 .D_isEret(D_isEret), .EM_isBranch(EM_isBranch), .EM_PC(EM_PC),
					 .BypassErs(BypassErs), .BypassErt(BypassErt),
					 .EM_PCplus8(EM_PCplus8), .EM_ALUOut(EM_ALUOut), .EM_HILO(EM_HILO), .EM_CP0(EM_CP0),
					 .MW_PCplus8(MW_PCplus8), .MW_ALUOut(MW_ALUOut), .MW_HILO(MW_HILO), .MW_CP0(MW_CP0), .W_DOut(W_DOut),  
					 .DE_Instr(DE_Instr), .DE_PCplus8(DE_PCplus8), .DE_RData1(DE_RData1), .DE_RData2(DE_RData2), 
					 .DE_EXT(DE_EXT), .DE_RegWrite(DE_RegWrite), .DE_RegDst(DE_RegDst), .DE_PC(DE_PC), .DE_isBranch(DE_isBranch),
					 .E_Instr(E_Instr), .E_PCplus8(E_PCplus8), .E_PC(E_PC), .E_isBranch(E_isBranch), .E_ALU_Out(E_ALU_Out), .E_HILO(E_HILO), .E_CP0(E_CP0),
					 .E_RegWrite(E_RegWrite), .E_RegDst(E_RegDst), .E_RData2(E_RData2), .E_Busy(E_Busy), .E_IntReq(E_IntReq), .E_EPC(E_EPC));
					 
    pReg_EM Reg_EM(.Clk(clk), .Reset(reset | E_IntReq), 
	               .E_Instr(E_Instr), .E_PCplus8(E_PCplus8),.E_ALU_Out(E_ALU_Out), .E_HILO(E_HILO), .E_CP0(E_CP0), .E_RegWrite(E_RegWrite), .E_RegDst(E_RegDst), .E_RData2(E_RData2), .E_PC(E_PC), .E_isBranch(E_isBranch),
				   .EM_Instr(EM_Instr), .EM_PCplus8(EM_PCplus8), .EM_ALUOut(EM_ALUOut), .EM_HILO(EM_HILO), .EM_CP0(EM_CP0), .EM_RegWrite(EM_RegWrite), .EM_RegDst(EM_RegDst), .EM_RData2(EM_RData2), .EM_PC(EM_PC), .EM_isBranch(EM_isBranch));
	
	ctrl_M ctrlm(.Instr(EM_Instr), .MemWrite(MemWrite), .MemWOp(MemWOp));

	pStage_M Stage_M(.Clk(clk), .Reset(reset), .PrRD(PrRD), .MemWrite(MemWrite), .MemWOp(MemWOp), .BypassMrt(BypassMrt),
	                 .W_DOut(W_DOut), 
					 .EM_Instr(EM_Instr), .EM_ALUOut(EM_ALUOut), .EM_PCplus8(EM_PCplus8), .EM_HILO(EM_HILO), .EM_CP0(EM_CP0), .EM_RegWrite(EM_RegWrite), .EM_RegDst(EM_RegDst), .EM_RData2(EM_RData2),
					 .PrAddr(PrAddr), .PrWD(PrWD), .PrWe(PrWe),
					 .M_Instr(M_Instr), .M_ALUOut(M_ALUOut), .M_DM_RData(M_DM_RData), .M_PCplus8(M_PCplus8), .M_HILO(M_HILO), .M_CP0(M_CP0), .M_RegWrite(M_RegWrite), .M_RegDst(M_RegDst), .M_RData2(M_RData2));
					 
	pReg_MW Reg_MW(.Clk(clk), .Reset(reset), 
	               .M_Instr(M_Instr), .M_ALUOut(M_ALUOut), .M_DM_RData(M_DM_RData), .M_PCplus8(M_PCplus8), .M_HILO(M_HILO), .M_CP0(M_CP0), .M_RegWrite(M_RegWrite), .M_RegDst(M_RegDst), .M_RData2(M_RData2),
				   .MW_Instr(MW_Instr), .MW_ALUOut(MW_ALUOut), .MW_DM_RData(MW_DM_RData), .MW_PCplus8(MW_PCplus8), .MW_HILO(MW_HILO), .MW_CP0(MW_CP0), .MW_RegWrite(MW_RegWrite), .MW_RegDst(MW_RegDst), .MW_RData2(MW_RData2));
				   
	ctrl_W ctrlw(.Instr(MW_Instr), .RegSrc(RegSrc), .DEXTOp(DEXTOp));
	
	pStage_W Stage_W(.RegSrc(RegSrc), .DEXTOp(DEXTOp), 
	                 .MW_Instr(MW_Instr), .MW_ALUOut(MW_ALUOut), .MW_DM_RData(MW_DM_RData), .MW_PCplus8(MW_PCplus8), .MW_HILO(MW_HILO), .MW_CP0(MW_CP0), .MW_RegWrite(MW_RegWrite), .MW_RegDst(MW_RegDst), .MW_RData2(MW_RData2),
					 .W_RegWrite(W_RegWrite), .W_RegDst(W_RegDst), .W_R_WData(W_R_WData), .W_DOut(W_DOut));
	
	stall stall_ctrl(.FD_Instr(FD_Instr), .DE_Instr(DE_Instr), .EM_Instr(EM_Instr), .E_Busy(E_Busy),
					 .DE_RegWrite(DE_RegWrite), .DE_RegDst(DE_RegDst), .EM_RegWrite(EM_RegWrite), .EM_RegDst(EM_RegDst),
	                 .StallPC(StallPC), .StallFD(StallFD), .FlushDE(FlushDE));
	
	Bypass Bypass_ctrl(.FD_Instr(FD_Instr), .DE_Instr(DE_Instr), .EM_Instr(EM_Instr), .MW_Instr(MW_Instr),
					   .DE_RegWrite(DE_RegWrite), .DE_RegDst(DE_RegDst), .EM_RegWrite(EM_RegWrite), .EM_RegDst(EM_RegDst), .MW_RegWrite(MW_RegWrite), .MW_RegDst(MW_RegDst),
	                   .BypassDrs(BypassDrs), .BypassDrt(BypassDrt), .BypassErs(BypassErs), 
					   .BypassErt(BypassErt), .BypassMrt(BypassMrt));
					   	

endmodule
