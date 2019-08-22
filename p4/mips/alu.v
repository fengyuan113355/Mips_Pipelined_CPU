`ifndef ALU
`define ALU


module alu(
	input [31:0] Data1,
	input [31:0] Data2,
	input [2:0] ALUOp,
	output [31:0] ALUResult,
	output Zero
    );
	
	reg [31:0] result;
	assign ALUResult = result;
	assign Zero = (result == 0) ? 1'b1 : 1'b0;

	always @ (*) begin
		case (ALUOp)
			3'b000 : result = Data1 + Data2;
			3'b001 : result = Data1 - Data2;
			3'b010 : result = Data1 | Data2;
			3'b011 : result = Data1 & Data2;
			3'b100 : result = (Data1 < Data2) ? 32'h00000001 : 32'h00000000;
			3'b101 : result = (Data1[31] == 1'b0 && Data1 != 0) ? 32'h00000000 : 32'h00000001;
			default : result = 32'bx;
		endcase
	end
	
endmodule

`endif
