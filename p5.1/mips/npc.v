`timescale 1ns / 1ps


module npc(
	input [31:0] PCplus4,
	input [25:0] I_Addr,
	input [31:0] R_Addr,
	input [1:0] NPCSel,
	input Equal,
	output [31:0] NPC,
	output [31:0] PCplus8
    );

    wire [31:0] npc_1, npc_2, npc_3, npc_4;
	reg [31:0] _npc;
	
	assign NPC = _npc;
	assign PCplus8 = PCplus4 + 4;
	
	assign npc_1 = PCplus4 + 4;
	assign npc_2 = PCplus4 + {{14{I_Addr[15]}}, I_Addr[15:0], {2{1'b0}}};
	assign npc_3 = {PCplus4[31:28], I_Addr, {2{1'b0}}};
	assign npc_4 = R_Addr;
	
	always @ (*) begin
		case (NPCSel)
			2'b00 : _npc = npc_1;
			2'b01 : 
				begin
					if (Equal)
						_npc = npc_2;
					else
						_npc = npc_1;
				end
			2'b10 : _npc = npc_3;
			2'b11 : _npc = npc_4;
			default : _npc = 32'bx;
		endcase
	end
	
	
endmodule
