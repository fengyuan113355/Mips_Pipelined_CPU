`ifndef ALU
`define ALU
`include "signal_def.v"

module alu(
	input [31:0] Data1,
	input [31:0] Data2,
	input [31:0] Instr,
	input [3:0] ALUOp,
	output [31:0] ALUResult
    );
	
	reg [31:0] result;
	assign ALUResult = result;
	
	always @ (*) begin
		case (ALUOp)
			4'b 0000 : result = Data1 + Data2;
			4'b 0001 : result = Data1 - Data2;
			4'b 0010 : result = Data1 | Data2;
			4'b 0011 : result = Data1 & Data2;
			4'b 0100 : result = Data1 ^ Data2;
			4'b 0101 : result = Data2 << Instr[`shamt];
			4'b 0110 : result = Data2 >> Instr[`shamt];
			4'b 0111 : result = Data1;
			default : result = 32'bx;
		endcase
	end
	
endmodule

`endif
