`ifndef PC
`define PC

module pc(
	input Clk,
	input Reset,
	input En,
	input [31:0] NPC,
	output [31:0] PC
	);
	
	reg [31:0] _pc;
	assign PC = _pc;
	
	always @ (posedge Clk) begin
		if (Reset)
			_pc <= 32'h00003000;
		else if (En)
			_pc <= NPC;
	end
	
	initial begin
		_pc <= 32'h00003000;
	end

endmodule
	

`endif
