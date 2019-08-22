`timescale 1ns / 1ps

`include "pc.v"
`include "im.v"
`include "grf.v"
`include "ext.v"
`include "alu.v"
`include "dm.v"
`include "mux.v"
`include "ctrl.v"


module mips(
	input clk,
	input reset
    );
	
	wire [25:0] PC_Addr;                            //PC Input
	wire [31:0] PC_R_Addr;
	wire [1:0] nPC_Op;
	wire [31:0] PC, PC_plus4;                       //PC Output
	
	wire [11:2] IM_Addr;                            //IM Input
	wire [31:0] Instr;                              //IM Output
	
	wire [4:0] GRF_RAddr1, GRF_RAddr2, GRF_WAddr;   //GRF Input
	wire [31:0] GRF_WData;
	wire RegWrite;
	wire [31:0] GRF_RData1, GRF_RData2;             //GRF Output
	
	wire [15:0] EXT_In;                             //EXT Input
	wire [1:0] EXTOp; 
	wire [31:0] EXT_Out;                            //EXT Output
	
	wire [31:0] ALU_Data1, ALU_Data2;               //ALU Input
    wire [2:0] ALUOp;
	wire [31:0] ALUResult;                          //ALU Output
	wire ALU_Zero;
	
	wire [31:0] DM_Addr, DM_WData;                  //DM Input 
	wire MemWrite; 
	wire [31:0] DM_RData;                           //DM Output
	
	wire [5:0] op, funct;
	wire [4:0] rs, rt, rd;
	//wire [4:0] shamt;
	wire [15:0] imm;
	wire [25:0] addr;	
	
	wire [1:0] RegDst, RegSrc;
	wire ALUSrc;
	
	
	pc   mips_pc(.Addr(PC_Addr), .R_Addr(PC_R_Addr), .nPC_Op(nPC_Op), 
	             .Clk(clk), .Reset(reset),
			     .PC(PC), .PC_plus4(PC_plus4));
				 
	im   mips_im(.Addr(IM_Addr), .Instr(Instr));
	
	grf mips_grf(.RAddr1(GRF_RAddr1), .RAddr2(GRF_RAddr2), .WAddr(GRF_WAddr), 
	             .WData(GRF_WData), .RegWrite(RegWrite), .Clk(clk), .Reset(reset),
	             .RData1(GRF_RData1), .RData2(GRF_RData2));
				 
	ext mips_ext(.In(EXT_In), .Out(EXT_Out), .EXTOp(EXTOp));
	
	alu mips_alu(.Data1(ALU_Data1), .Data2(ALU_Data2), .ALUOp(ALUOp),
	             .ALUResult(ALUResult), .Zero(ALU_Zero));
				 
	dm   mips_dm(.Addr(DM_Addr), .WData(DM_WData), .MemWrite(MemWrite), 
				 .Clk(clk), .Reset(reset),
	             .RData(DM_RData));
				 
	
	assign op = Instr[31:26];
	assign rs = Instr[25:21];
	assign rt = Instr[20:16];
	assign rd = Instr[15:11];
	//assign shamt = Instr[10:6];
	assign funct = Instr[5:0];
	assign imm = Instr[15:0];
	assign addr = Instr[25:0];
	
	assign IM_Addr = PC[11:2];
	assign GRF_RAddr1 = rs;
    assign GRF_RAddr2 = rt;
    assign ALU_Data1 = GRF_RData1;
	assign EXT_In = imm;
	assign DM_Addr = ALUResult;
	assign DM_WData = GRF_RData2;
	assign PC_Addr = addr;
	assign PC_R_Addr = GRF_RData1;
	
	//选择寄存器堆的写入地址
	mux_3 #(.DataBit(5)) RegDst_mux(.In_1(rt), .In_2(rd), .In_3(5'b11111), .Sel(RegDst), .Out(GRF_WAddr));
	//选择寄存器堆的写入数据
	mux_3 RegSrc_mux(.In_1(ALUResult), .In_2(DM_RData), .In_3(PC_plus4), .Sel(RegSrc), .Out(GRF_WData));
	//选择ALU的第二个操作数
	mux_2 ALUSrc_mux(.In_1(GRF_RData2), .In_2(EXT_Out), .Sel(ALUSrc), .Out(ALU_Data2));
	
	
	ctrl mips_control(.Op(op), .Funct(funct), .ALU_Zero(ALU_Zero), 
	                  .nPC_Op(nPC_Op), .RegWrite(RegWrite), .RegDst(RegDst), .RegSrc(RegSrc), 
					  .EXTOp(EXTOp), .ALUOp(ALUOp), .ALUSrc(ALUSrc), .MemWrite(MemWrite));
	
endmodule
