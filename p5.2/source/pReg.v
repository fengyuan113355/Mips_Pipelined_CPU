`timescale 1ns / 1ps


module pReg_FD(
	input Clk,
	input Reset,
	input En,
	input [31:0] F_Instr,
	input [31:0] F_PCplus4,
	output [31:0] FD_Instr,
	output [31:0] FD_PCplus4
    );

	reg [31:0] Instr, PCplus4;
	assign FD_Instr = Instr;
	assign FD_PCplus4 = PCplus4;
	
	always @ (posedge Clk) begin
		if (Reset) begin 
			Instr <= 32'b0;
			PCplus4 <= 32'b0;
		end
		else if (En) begin
			Instr <= F_Instr;
			PCplus4 <= F_PCplus4;
		end
	end
	
	initial begin
		Instr <= 32'b0;
		PCplus4 <= 32'b0;
	end

endmodule

module pReg_DE(
	input Clk,
	input Reset,
	input [31:0] D_Instr,
	input [31:0] D_NPC_PCplus8,
	input [31:0] D_GRF_RData1,
	input [31:0] D_GRF_RData2,
	input [31:0] D_EXT,
	output [31:0] DE_Instr,
	output [31:0] DE_PCplus8,
	output [31:0] DE_GRF_RData1,
	output [31:0] DE_GRF_RData2,
	output [31:0] DE_EXT
	);
	
	reg [31:0] Instr, PCplus8, GRF_RData1, GRF_RData2, EXT;
	reg isBranch;
	
	assign DE_Instr = Instr;
	assign DE_PCplus8 = PCplus8;
	assign DE_GRF_RData1 = GRF_RData1;
	assign DE_GRF_RData2 = GRF_RData2;
	assign DE_EXT = EXT;
	
	always @ (posedge Clk) begin
		if (Reset) begin
			Instr <= 31'b0;
			PCplus8 <= 31'b0;
			GRF_RData1 <= 31'b0;
			GRF_RData2 <= 31'b0;
			EXT <= 31'b0;
		end
		else begin
			Instr <= D_Instr;
			PCplus8 <= D_NPC_PCplus8;
			GRF_RData1 <= D_GRF_RData1;
			GRF_RData2 <= D_GRF_RData2;
			EXT <= D_EXT;
		end
	end	
	
	initial begin
		Instr <= 31'b0;
		PCplus8 <= 31'b0;
		GRF_RData1 <= 31'b0;
		GRF_RData2 <= 31'b0;
		EXT <= 31'b0;
	end

endmodule

module pReg_EM(
	input Clk,
	input Reset,
	input [31:0] E_Instr,
	input [31:0] E_PCplus8,
	input [31:0] E_ALU_Out,
	input [31:0] E_M_WData,
	output [31:0] EM_Instr,
	output [31:0] EM_PCplus8,
	output [31:0] EM_ALUOut,
	output [31:0] EM_M_WData
	);

	reg [31:0] Instr, PCplus8, ALUOut, M_WData;
	assign EM_Instr = Instr;
	assign EM_PCplus8 = PCplus8;
	assign EM_ALUOut = ALUOut;
	assign EM_M_WData = M_WData;
	
	always @ (posedge Clk) begin
		if (Reset) begin
			Instr <= 32'b0;
			PCplus8 <= 32'b0;
			ALUOut <= 32'b0;
			M_WData <= 32'b0;
		end
		else begin
			Instr <= E_Instr;
			PCplus8 <= E_PCplus8;
			ALUOut <= E_ALU_Out;
			M_WData <= E_M_WData;
		end
	end

	initial begin
		Instr <= 32'b0;
		PCplus8 <= 32'b0;
		ALUOut <= 32'b0;
		M_WData <= 32'b0;
	end
	
endmodule

module pReg_MW(
	input Clk,
	input Reset,
	input [31:0] M_Instr,
	input [31:0] M_ALUOut,
	input [31:0] M_DM_RData,
	input [31:0] M_PCplus8,
	output [31:0] MW_Instr,
	output [31:0] MW_ALUOut,
	output [31:0] MW_DM_RData,
	output [31:0] MW_PCplus8
	);
	
	reg [31:0] Instr, ALUOut, DM_RData, PCplus8;
	assign MW_Instr = Instr;
	assign MW_ALUOut = ALUOut;
	assign MW_DM_RData = DM_RData;
	assign MW_PCplus8 = PCplus8;
	
	always @ (posedge Clk) begin
		if (Reset) begin
			Instr <= 32'b0;
			ALUOut <= 32'b0;
			DM_RData <= 32'b0;
			PCplus8 <= 32'b0;
		end
		else begin
			Instr <= M_Instr;
			ALUOut <= M_ALUOut;
			DM_RData <= M_DM_RData;
			PCplus8 <= M_PCplus8;
		end
	end

	initial begin
		Instr <= 32'b0;
		ALUOut <= 32'b0;
		DM_RData <= 32'b0;
		PCplus8 <= 32'b0;
	end

endmodule
