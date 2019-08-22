`timescale 1ns / 1ps


module comp(
	input [31:0] Data1, 
	input [31:0] Data2,
	input [1:0] COMPOp,
	output COMPResult
    );
	
	reg _COMPResult;
	assign COMPResult = _COMPResult;
	
	always @ (*) begin
		case (COMPOp) 
			2'b00 : _COMPResult = 1'b1;
			2'b01 : _COMPResult = (Data2 == 0);
			default : _COMPResult = 1'b1;
		endcase
	end

endmodule
