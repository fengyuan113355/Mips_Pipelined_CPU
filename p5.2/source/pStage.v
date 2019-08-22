`timescale 1ns / 1ps
`include "mux.v"
`include "signal_def.v"

module pStage_F(
	input Clk,
	input Reset,
	input StallPC,
	input PCSel,
	
	input [31:0] D_NPC,
	output [31:0] F_Instr,
	output [31:0] F_PCplus4
    );

	wire [31:0] NPC, PC, PCplus4;
	assign PCplus4 = PC + 4;
	assign F_PCplus4 = PCplus4;
	
	mux_2 MUX_PC(.In_1(PCplus4), .In_2(D_NPC), .Sel(PCSel), .Out(NPC));
	
	pc F_PC(.Clk(Clk), .Reset(Reset), .En(~StallPC), .NPC(NPC), .PC(PC));
	im F_IM(.Addr(PC[11:2]), .Instr(F_Instr));

endmodule

module pStage_D(
	input Clk,
	input Reset,
	input [1:0] EXTOp,
	input [1:0] NPCSel,
	input isBranch,
	
	input [1:0] BypassDrs,
	input [1:0] BypassDrt,
	
	input [31:0] DE_PCplus8,
	input [31:0] EM_ALUOut,
	input [31:0] EM_PCplus8,
	
	input [4:0] W_R_WAddr,
	input [31:0] W_R_WData,
	input RegWrite,
	
	input [31:0] FD_Instr,
	input [31:0] FD_PCplus4,
	output [31:0] D_Instr,
	output [31:0] D_NPC,
	output [31:0] D_NPC_PCplus8,
	output [31:0] D_GRF_RData1,
	output [31:0] D_GRF_RData2,
	output [31:0] D_EXT,
	output D_isBranch
    );
	
	wire [31:0] RData1, RData2;
	wire Equal;
	wire [31:0] Data1, Data2;
	
	assign Equal = (Data1 == Data2); 
	
	
	grf D_GRF(.RAddr1(FD_Instr[`rs]), .RAddr2(FD_Instr[`rt]), .WAddr(W_R_WAddr), .WData(W_R_WData),
			  .RegWrite(RegWrite), .Clk(Clk), .Reset(Reset), .RData1(RData1), .RData2(RData2));
	
	npc D_NPCU(.PCplus4(FD_PCplus4), .I_Addr(FD_Instr[`addr]), .R_Addr(Data1), .NPCSel(NPCSel),
			  .Equal(Equal), .NPC(D_NPC), .PCplus8(D_NPC_PCplus8));
	
	ext D_EXTU(.In(FD_Instr[`imm]), .EXTOp(EXTOp), .Out(D_EXT));
	
			  
	mux_4 MUXB_D_rs(.In_1(RData1), .In_2(DE_PCplus8), .In_3(EM_ALUOut), .In_4(EM_PCplus8), 
		  .Sel(BypassDrs), .Out(Data1));
	mux_4 MUXB_D_rt(.In_1(RData2), .In_2(DE_PCplus8), .In_3(EM_ALUOut), .In_4(EM_PCplus8), 
		  .Sel(BypassDrt), .Out(Data2));
	
	
	assign D_Instr = FD_Instr;
	assign D_GRF_RData1 = Data1;
	assign D_GRF_RData2 = Data2;
	assign D_isBranch = isBranch;
	

endmodule

module pStage_E(
	input [2:0] ALUOp,
	input ALUSrc,
	
	input [2:0] BypassErs,
	input [2:0] BypassErt,
	
	input [31:0] EM_ALUOut,
	input [31:0] EM_PCplus8,
	input [31:0] MW_ALUOut,
	input [31:0] MW_DM_RData,
	input [31:0] MW_PCplus8,
	
	input [31:0] DE_Instr,
	input [31:0] DE_PCplus8,
	input [31:0] DE_GRF_RData1,
	input [31:0] DE_GRF_RData2,
	input [31:0] DE_EXT,
	
	output [31:0] E_Instr,
	output [31:0] E_PCplus8,
	output [31:0] E_ALU_Out,
	output [31:0] E_M_WData
    );

	wire [31:0] Data1, Data2, tData2;
	
	alu E_ALU(.Data1(Data1), .Data2(Data2), .ALUOp(ALUOp), .ALUResult(E_ALU_Out));
	
	mux_6 MUXB_E_rs(.In_1(DE_GRF_RData1), .In_2(EM_ALUOut), .In_3(EM_PCplus8), 
	                .In_4(MW_ALUOut), .In_5(MW_DM_RData), .In_6(MW_PCplus8),
					.Sel(BypassErs), .Out(Data1));
	mux_6 MUXB_E_rt(.In_1(DE_GRF_RData2), .In_2(EM_ALUOut), .In_3(EM_PCplus8), 
	                .In_4(MW_ALUOut), .In_5(MW_DM_RData), .In_6(MW_PCplus8),
					.Sel(BypassErt), .Out(tData2));
	mux_2 MUX_ALUSrc(.In_1(tData2), .In_2(DE_EXT), .Sel(ALUSrc), .Out(Data2));
	
	assign E_Instr = DE_Instr;
	assign E_PCplus8 = DE_PCplus8;
	assign E_M_WData = tData2;

endmodule

module pStage_M(
	input Clk,
	input Reset,
	input MemWrite,
	
	input [1:0] BypassMrt,
	
	input [31:0] MW_ALUOut,
	input [31:0] MW_DM_RData,
	input [31:0] MW_PCplus8,
	
	input [31:0] EM_Instr,
	input [31:0] EM_ALUOut,
	input [31:0] EM_M_WData,
	input [31:0] EM_PCplus8,
	output [31:0] M_Instr,
	output [31:0] M_ALUOut,
	output [31:0] M_DM_RData,
	output [31:0] M_PCplus8
    );
	
	wire [31:0] WData;
	
	dm M_DM(.Addr(EM_ALUOut), .WData(WData), .MemWrite(MemWrite), 
	        .Clk(Clk), .Reset(Reset), .RData(M_DM_RData));
	
	mux_4 MUX_M_rt(.In_1(EM_M_WData), .In_2(MW_ALUOut), .In_3(MW_DM_RData), .In_4(MW_PCplus8),
	               .Sel(BypassMrt), .Out(WData));
	
	assign M_Instr = EM_Instr;
	assign M_ALUOut = EM_ALUOut;
	assign M_PCplus8 = EM_PCplus8;

endmodule

module pStage_W(
	input RegWrite,
	input [1:0] RegDst,
	input [1:0] RegSrc,
	
	input [31:0] MW_Instr,
	input [31:0] MW_ALUOut,
	input [31:0] MW_DM_RData,
	input [31:0] MW_PCplus8,

	output W_RegWrite,
	output [4:0] W_R_WAddr,
	output [31:0] W_R_WData
    );

	mux_3 #(.DataBit(5)) MUX_RegDst(.In_1(MW_Instr[`rt]), .In_2(MW_Instr[`rd]), .In_3(5'h1f),
                                    .Sel(RegDst), .Out(W_R_WAddr));
	mux_3 MUX_RegSrc(.In_1(MW_ALUOut), .In_2(MW_DM_RData), .In_3(MW_PCplus8),
	                 .Sel(RegSrc), .Out(W_R_WData));

	assign W_RegWrite = RegWrite;	
	
endmodule











