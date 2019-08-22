`ifndef ALU
`define ALU


module alu(
	input [31:0] Data1,
	input [31:0] Data2,
	input [2:0] ALUOp,
	output [31:0] ALUResult
    );
	
	reg [31:0] result;
	assign ALUResult = result;
	
	always @ (*) begin
		case (ALUOp)
			3'b000 : result = Data1 + Data2;
			3'b001 : result = Data1 - Data2;
			3'b010 : result = Data1 | Data2;
			3'b011 : result = Data1 & Data2;
			default : result = 32'bx;
		endcase
	end
	
endmodule

`endif
