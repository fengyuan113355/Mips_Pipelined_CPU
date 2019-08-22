`ifndef IM
`define IM


module im(
	input [11:2] Addr,
	output [31:0] Instr
    );

	reg [31:0] _im [1023:0];
	
	assign Instr = _im[Addr];
	
	initial begin
		$readmemh("code.txt", _im);
	end
	
endmodule

`endif
