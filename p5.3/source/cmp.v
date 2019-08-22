`timescale 1ns / 1ps


module cmp(
	input [31:0] Data1,
	input [31:0] Data2,
	input [2:0] CMPOp,
	output CMPResult
    );

	reg result;
	assign CMPResult = result;
	
	always @ (*) begin
		case (CMPOp) 
			3'b000 : result = 1'b1;
			3'b001 : result = (Data1 == Data2);
			3'b010 : result = (Data1 != Data2);
			default : result = 1'b1;
		endcase
	end

endmodule
