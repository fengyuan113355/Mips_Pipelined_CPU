`timescale 1ns / 1ps
`include "mux.v"
`include "signal_def.v"

module pStage_F(
	input Clk,
	input Reset,
	input StallPC,
	input D_isBranch,
	input E_IntReq,
	input D_isEret,
	input [31:0] D_NPC,
	input [31:0] E_EPC,
	
	output [31:0] F_Instr,
	output [31:0] F_PCplus4,
	output [31:0] F_PC
    );

	wire [31:0] NPC, PC, PCplus4;
	assign PCplus4 = PC + 4;
	assign F_PCplus4 = PCplus4;
	assign F_PC = PC;
	
	//mux_2 MUX_PC(.In_1(PCplus4), .In_2(D_NPC), .Sel(PCSel), .Out(NPC));
	assign NPC = E_IntReq ? 32'h0000_4180 : 
				 D_isEret ? E_EPC :
	             D_isBranch ? D_NPC : PCplus4;
	
	pc _F_PC(.Clk(Clk), .Reset(Reset), .En(E_IntReq | ~StallPC), .NPC(NPC), .PC(PC));
	im F_IM(.Addr(PC), .Instr(F_Instr));

endmodule

module pStage_D(
	input Clk,
	input Reset,
	input [1:0] EXTOp,
	input [1:0] NPCSel,
	input [2:0] CMPOp,
	input isBranch,
	input isEret,
	input RegWrite,
	input [4:0] RegDst,
	
	input [2:0] BypassDrs,
	input [2:0] BypassDrt,
	
	input [31:0] DE_PCplus8,
	input [31:0] EM_PCplus8,
	input [31:0] EM_ALUOut,
	input [31:0] EM_HILO,
	input [31:0] EM_CP0,
	
	input W_RegWrite,
	input [4:0] W_RegDst,
	input [31:0] W_R_WData,	
	
	input [31:0] FD_Instr,
	input [31:0] FD_PCplus4,
	input [31:0] FD_PC,
	
	output [31:0] D_Instr,
	output [31:0] D_NPC,
	output [31:0] D_PCplus8,
	output [31:0] D_RData1,
	output [31:0] D_RData2,
	output [31:0] D_EXT,
	output D_isBranch,
	output D_RegWrite,
	output [4:0] D_RegDst,
	output [31:0] D_PC,
	
	output D_isEret
    );
	
	wire [31:0] RData1, RData2;
	wire D_CMPResult;
	wire [31:0] Data1, Data2;
	
	assign D_RegWrite = RegWrite & D_CMPResult;
	assign D_RegDst = RegDst;
	assign D_isBranch = isBranch;
	
	assign D_Instr = FD_Instr;
	assign D_RData1 = Data1;
	assign D_RData2 = Data2;	
	assign D_PC = FD_PC;
	
	assign D_isEret = isEret;
	
	cmp D_CMP(.Data1(Data1), .Data2(Data2), .CMPOp(CMPOp), .CMPResult(D_CMPResult));
	
	grf D_GRF(.RAddr1(FD_Instr[`rs]), .RAddr2(FD_Instr[`rt]), .WAddr(W_RegDst), .WData(W_R_WData),
			  .RegWrite(W_RegWrite), .Clk(Clk), .Reset(Reset), .RData1(RData1), .RData2(RData2));
	
	npc D_NPCU(.PCplus4(FD_PCplus4), .I_Addr(FD_Instr[`addr]), .R_Addr(Data1), .NPCSel(NPCSel),
			  .D_CMPResult(D_CMPResult), .NPC(D_NPC), .PCplus8(D_PCplus8));
	
	ext D_EXTU(.In(FD_Instr[`imm]), .EXTOp(EXTOp), .Out(D_EXT));
	
			  
	mux_6 MUXB_D_rs(.In_1(RData1), .In_2(DE_PCplus8), .In_3(EM_PCplus8), .In_4(EM_ALUOut), .In_5(EM_HILO), .In_6(EM_CP0),
		  .Sel(BypassDrs), .Out(Data1));
	mux_6 MUXB_D_rt(.In_1(RData2), .In_2(DE_PCplus8), .In_3(EM_PCplus8), .In_4(EM_ALUOut), .In_5(EM_HILO), .In_6(EM_CP0),
		  .Sel(BypassDrt), .Out(Data2));

endmodule

module pStage_E(
	input Clk,
	input Reset,
	
	input [7:2] HWInt,

	input [3:0] ALUOp,
	input ALUSrc,
	input [2:0] MDOp,
	input HILOSel,
	input CP0We,
	
	input D_isEret,
	input EM_isBranch,
	input [31:0] EM_PC,
	
	input [3:0] BypassErs,
	input [3:0] BypassErt,
	
	input [31:0] EM_PCplus8,
	input [31:0] EM_ALUOut,
	input [31:0] EM_HILO,
	input [31:0] EM_CP0,
	input [31:0] MW_PCplus8,
	input [31:0] MW_ALUOut,
	input [31:0] MW_HILO,
	input [31:0] MW_CP0,
	input [31:0] W_DOut,
	
	input [31:0] DE_Instr,
	input [31:0] DE_PCplus8,
	input [31:0] DE_RData1,
	input [31:0] DE_RData2,
	input [31:0] DE_EXT,
	input DE_RegWrite,
	input [4:0] DE_RegDst,
	input [31:0] DE_PC,
	input DE_isBranch,
	
	output [31:0] E_Instr,
	output [31:0] E_PCplus8,
	output [31:0] E_ALU_Out,
	output [31:0] E_HILO,
	output [31:0] E_CP0,
	output E_RegWrite,
	output [4:0] E_RegDst,
	output [31:0] E_RData2,
	output [31:0] E_PC,
	output E_isBranch,
	
	output E_Busy,
	output E_IntReq,
	output [31:0] E_EPC
    );

	wire [31:0] Data1, Data2, tData2, HI, LO, tPC;
	
	assign E_Instr = DE_Instr;
	assign E_PCplus8 = DE_PCplus8;
	assign E_RData2 = tData2;
	assign E_RegWrite = DE_RegWrite;
	assign E_RegDst = DE_RegDst;
	assign E_PC = DE_PC;
	assign E_isBranch = DE_isBranch;
	
	alu E_ALU(.Data1(Data1), .Data2(Data2), .Instr(DE_Instr), .ALUOp(ALUOp), .ALUResult(E_ALU_Out));
	
	mdu E_MDU(.Clk(Clk), .Reset(Reset), .Data1(Data1), .Data2(tData2), .MDOp(MDOp & {3{~E_IntReq}}), .Busy(E_Busy), .HI(HI), .LO(LO));
	
	CP0 _E_CP0(.Clk(Clk), .Reset(Reset), .Addr(DE_Instr[`rd]), .DIn(tData2), .PC(tPC), .HWInt(HWInt), .We(CP0We), 
	          .EXLSet(E_IntReq), .EXLClr(D_isEret), .IntReq(E_IntReq), .EPC(E_EPC), .DOut(E_CP0));
	
	mux_2 MUX_CP0_PC(.In_1(DE_PC), .In_2(EM_PC), .Sel(EM_isBranch), .Out(tPC));
	
	mux_10 MUXB_E_rs(.In_1(DE_RData1), .In_2(EM_PCplus8), .In_3(EM_ALUOut), .In_4(EM_HILO), .In_5(EM_CP0),
	                .In_6(MW_PCplus8), .In_7(MW_ALUOut), .In_8(MW_HILO), .In_9(MW_CP0), .In_10(W_DOut),
					.Sel(BypassErs), .Out(Data1));
	mux_10 MUXB_E_rt(.In_1(DE_RData2), .In_2(EM_PCplus8), .In_3(EM_ALUOut), .In_4(EM_HILO), .In_5(EM_CP0),
	                .In_6(MW_PCplus8), .In_7(MW_ALUOut), .In_8(MW_HILO), .In_9(MW_CP0), .In_10(W_DOut),
					.Sel(BypassErt), .Out(tData2));
	mux_2 MUX_ALUSrc(.In_1(tData2), .In_2(DE_EXT), .Sel(ALUSrc), .Out(Data2));
	
	mux_2 MUX_HILOSel(.In_1(HI), .In_2(LO), .Sel(HILOSel), .Out(E_HILO));
	
endmodule

module pStage_M(
	input Clk,
	input Reset,
	
	input [31:0] PrRD,
	
	input MemWrite,
	input [2:0] MemWOp,
	
	input [1:0] BypassMrt,
	
	input [31:0] W_DOut,
	
	input [31:0] EM_Instr,
	input [31:0] EM_ALUOut,
	input [31:0] EM_PCplus8,
	input [31:0] EM_HILO,
	input [31:0] EM_CP0,
	input EM_RegWrite,
	input [4:0] EM_RegDst,
	input [31:0] EM_RData2,
	
	output [31:0] PrAddr,
	output [31:0] PrWD,
	output PrWe,
	
	output [31:0] M_Instr,
	output [31:0] M_ALUOut,
	output [31:0] M_DM_RData,
	output [31:0] M_PCplus8,
	output [31:0] M_HILO,
	output [31:0] M_CP0,
	output M_RegWrite,
	output [4:0] M_RegDst,
	output [31:0] M_RData2
    );
	
	wire [31:0] WData, DM_RData;
	wire HitDM;
	
	assign PrAddr = EM_ALUOut;
	assign PrWD = WData;
	assign PrWe = MemWrite;
	
	assign M_Instr = EM_Instr;
	assign M_ALUOut = EM_ALUOut;
	assign M_PCplus8 = EM_PCplus8;
	assign M_HILO = EM_HILO;
	assign M_CP0 = EM_CP0;
	assign M_RegWrite = EM_RegWrite;
	assign M_RegDst = EM_RegDst;
	assign M_RData2 = WData;
	
	assign HitDM = EM_ALUOut[31:12] == 20'h0000_0 | EM_ALUOut[31:12] == 20'h0000_1 | EM_ALUOut[31:12] == 20'h0000_2;
	
	dm M_DM(.Addr(EM_ALUOut), .WData(WData), .MemWrite(MemWrite & HitDM), .MemWOp(MemWOp),
	        .Clk(Clk), .Reset(Reset), .RData(DM_RData));
	
	mux_2 MUX_M_RData(.In_1(PrRD), .In_2(DM_RData), .Sel(HitDM), .Out(M_DM_RData));
	
	mux_4 MUX_M_rt(.In_1(EM_RData2), .In_2(W_DOut), .In_3(32'bx), .In_4(32'bx),
	               .Sel(BypassMrt), .Out(WData));

endmodule

module pStage_W(
	input [2:0] RegSrc,
	input [2:0] DEXTOp,
	
	input [31:0] MW_Instr,
	input [31:0] MW_ALUOut,
	input [31:0] MW_DM_RData,
	input [31:0] MW_PCplus8,
	input [31:0] MW_HILO,
	input [31:0] MW_CP0,
	input MW_RegWrite,
	input [4:0] MW_RegDst,
	input [31:0] MW_RData2,

	output W_RegWrite,
	output [4:0] W_RegDst,
	output [31:0] W_R_WData,
	
	output [31:0] W_DOut
    );

	assign W_RegWrite = MW_RegWrite;	
	assign W_RegDst = MW_RegDst;

	dext W_DEXT(.DM_RData(MW_DM_RData), .RData2(MW_RData2), .Addr2(MW_ALUOut[1:0]), .DEXTOp(DEXTOp), .DOut(W_DOut));

	mux_5 MUX_RegSrc(.In_1(MW_PCplus8), .In_2(MW_ALUOut), .In_3(MW_HILO), .In_4(MW_CP0), .In_5(W_DOut), 
	                 .Sel(RegSrc), .Out(W_R_WData));
	
endmodule






