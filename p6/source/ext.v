`ifndef EXT
`define EXT


module ext(
	input [15:0] In,
	input [1:0] EXTOp,
	output [31:0] Out
    );
	
	reg [31:0] _out;
	assign Out = _out;
	
	always @ (*) begin
		case (EXTOp) 
			2'b00 : _out = {{16{In[15]}}, In};     //∑˚∫≈¿©’π
			2'b01 : _out = {{16{1'b0}}, In};       //¡„¿©’π
			2'b10 : _out = {In, {16{1'b0}}};       //µÕŒª¡„¿©’π
			default : _out = 32'bx;
		endcase
	end

endmodule


`endif