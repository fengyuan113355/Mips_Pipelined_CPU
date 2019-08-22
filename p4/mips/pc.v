`ifndef PC
`define PC


`include "mux.v"
module pc(
    input [25:0] Addr,
	input [31:0] R_Addr,
	input [1:0] nPC_Op,
	input Clk,
	input Reset,
	output [31:0] PC,
	output [31:0] PC_plus4
	);
	
	assign PC = PC_reg;
	assign PC_plus4 = PC_reg + 4;
	
	wire [31:0] npc, npc_1, npc_2, npc_3, npc_4;
	reg [31:0] PC_reg;
	
	assign npc_1 = PC_reg + 4;
	assign npc_2 = PC_reg + 4 + {{14{Addr[15]}}, Addr[15:0], {2{1'b0}}};
	assign npc_3 = {PC_reg[31:28], Addr, {2{1'b0}}};
	assign npc_4 = R_Addr;
	
	mux_4 npc_mux(.In_1(npc_1), .In_2(npc_2), .In_3(npc_3), .In_4(npc_4), .Sel(nPC_Op), .Out(npc));
	
	always @ (posedge Clk) begin
		if (Reset)
			PC_reg <= 32'h00003000;
		else begin
			PC_reg <= npc;
		end
	end
	
	initial begin
		PC_reg <= 32'h00003000;
	end
endmodule


`endif