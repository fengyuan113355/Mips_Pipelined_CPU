`timescale 1ns / 1ps


module pReg_FD(
	input Clk,
	input Reset,
	input En,
	input [31:0] F_Instr,
	input [31:0] F_PCplus4,
	
	output reg [31:0] FD_Instr,
	output reg [31:0] FD_PCplus4
    );
	
	always @ (posedge Clk) begin
		if (Reset) begin 
			FD_Instr <= 32'b0;
			FD_PCplus4 <= 32'b0;
		end
		else if (En) begin
			FD_Instr <= F_Instr;
			FD_PCplus4 <= F_PCplus4;
		end
	end
	
	initial begin
		FD_Instr <= 32'b0;
		FD_PCplus4 <= 32'b0;
	end

endmodule

module pReg_DE(
	input Clk,
	input Reset,
	
	input [31:0] D_Instr,
	input [31:0] D_PCplus8,
	input [31:0] D_RData1,
	input [31:0] D_RData2,
	input [31:0] D_EXT,
	input D_RegWrite,
	input [4:0] D_RegDst,
	
	output reg [31:0] DE_Instr,
	output reg [31:0] DE_PCplus8,
	output reg [31:0] DE_RData1,
	output reg [31:0] DE_RData2,
	output reg [31:0] DE_EXT,
	output reg DE_RegWrite,
	output reg [4:0] DE_RegDst
	);
	
	always @ (posedge Clk) begin
		if (Reset) begin
			DE_Instr <= 31'b0;
			DE_PCplus8 <= 31'b0;
			DE_RData1 <= 31'b0;
			DE_RData2 <= 31'b0;
			DE_EXT <= 31'b0;
			DE_RegWrite <= 1'b0;
			DE_RegDst <= 5'b0;
		end
		else begin
			DE_Instr <= D_Instr;
			DE_PCplus8 <= D_PCplus8;
			DE_RData1 <= D_RData1;
			DE_RData2 <= D_RData2;
			DE_EXT <= D_EXT;
			DE_RegWrite <= D_RegWrite;
			DE_RegDst <= D_RegDst;
		end
	end	
	
	initial begin
		DE_Instr <= 31'b0;
		DE_PCplus8 <= 31'b0;
		DE_RData1 <= 31'b0;
		DE_RData2 <= 31'b0;
		DE_EXT <= 31'b0;
		DE_RegWrite <= 1'b0;
		DE_RegDst <= 5'b0;
	end

endmodule

module pReg_EM(
	input Clk,
	input Reset,
	
	input [31:0] E_Instr,
	input [31:0] E_PCplus8,
	input [31:0] E_ALU_Out,
	input [31:0] E_HILO,
	input E_RegWrite,
	input [4:0] E_RegDst,
	input [31:0] E_RData2,
	
	output reg [31:0] EM_Instr,
	output reg [31:0] EM_PCplus8,
	output reg [31:0] EM_ALUOut,
	output reg [31:0] EM_HILO,
	output reg EM_RegWrite,
	output reg [4:0] EM_RegDst,
	output reg [31:0] EM_RData2
	);
	
	always @ (posedge Clk) begin
		if (Reset) begin
			EM_Instr <= 32'b0;
			EM_PCplus8 <= 32'b0;
			EM_ALUOut <= 32'b0;
			EM_HILO <= 32'b0;
			EM_RegWrite <= 1'b0;
			EM_RegDst <= 5'b0;
			EM_RData2 <= 32'b0;
		end
		else begin
			EM_Instr <= E_Instr;
			EM_PCplus8 <= E_PCplus8;
			EM_ALUOut <= E_ALU_Out;
			EM_HILO <= E_HILO;
			EM_RegWrite <= E_RegWrite;
			EM_RegDst <= E_RegDst;
			EM_RData2 <= E_RData2;
		end
	end

	initial begin
		EM_Instr <= 32'b0;
		EM_PCplus8 <= 32'b0;
		EM_ALUOut <= 32'b0;
		EM_HILO <= 32'b0;
		EM_RegWrite <= 1'b0;
		EM_RegDst <= 5'b0;
		EM_RData2 <= 32'b0;
	end
	
endmodule

module pReg_MW(
	input Clk,
	input Reset,
	
	input [31:0] M_Instr,
	input [31:0] M_ALUOut,
	input [31:0] M_DM_RData,
	input [31:0] M_PCplus8,
	input [31:0] M_HILO,
	input M_RegWrite,
	input [4:0] M_RegDst,
	input [31:0] M_RData2,
	
	output reg [31:0] MW_Instr,
	output reg [31:0] MW_ALUOut,
	output reg [31:0] MW_DM_RData,
	output reg [31:0] MW_PCplus8,
	output reg [31:0] MW_HILO,
	output reg MW_RegWrite,
	output reg [4:0] MW_RegDst,
	output reg [31:0] MW_RData2
	);
	
	always @ (posedge Clk) begin
		if (Reset) begin
			MW_Instr <= 32'b0;
			MW_ALUOut <= 32'b0;
			MW_DM_RData <= 32'b0;
			MW_PCplus8 <= 32'b0;
			MW_HILO <= 32'b0;
			MW_RegWrite <= 1'b0;
			MW_RegDst <= 5'b0;
			MW_RData2 <= 32'b0;
		end
		else begin
			MW_Instr <= M_Instr;
			MW_ALUOut <= M_ALUOut;
			MW_DM_RData <= M_DM_RData;
			MW_PCplus8 <= M_PCplus8;
			MW_HILO <= M_HILO;
			MW_RegWrite <= M_RegWrite;
			MW_RegDst <= M_RegDst;
			MW_RData2 <= M_RData2;
		end
	end

	initial begin
		MW_Instr <= 32'b0;
		MW_ALUOut <= 32'b0;
		MW_DM_RData <= 32'b0;
		MW_PCplus8 <= 32'b0;
		MW_HILO <= 32'b0;
		MW_RegWrite <= 1'b0;
		MW_RegDst <= 5'b0;
		MW_RData2 <= 32'b0;
	end

endmodule
