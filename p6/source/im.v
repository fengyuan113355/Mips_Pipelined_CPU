`ifndef IM
`define IM


module im(
	input [31:0] Addr,
	output [31:0] Instr
    );

	reg [31:0] _im [2047:0];
	
	wire [31:0] imAddr = Addr - 32'h 00003000;
	assign Instr = _im[imAddr[12:2]];
	
	initial begin
		$readmemh("code.txt", _im);
	end
	
endmodule

`endif
