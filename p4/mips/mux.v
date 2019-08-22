`ifndef MUX
`define MUX

module mux_2(
    input [DataBit - 1 : 0] In_1,
	input [DataBit - 1 : 0] In_2,
	input Sel,
	output [DataBit - 1 : 0] Out
	);
	parameter DataBit = 32;    //多选器的位宽参数
	
	assign Out = Sel ? In_2 : In_1;

endmodule

module mux_3(
	input [DataBit - 1 : 0] In_1,
	input [DataBit - 1 : 0] In_2,
	input [DataBit - 1 : 0] In_3,
	input [1:0] Sel,
	output [DataBit - 1 : 0] Out
	);
	parameter DataBit = 32;
	
	reg [DataBit - 1 : 0] out;
	assign Out = out;
	always @ (*) begin
		case (Sel)
			2'b00 : out = In_1;
			2'b01 : out = In_2;
			2'b10 : out = In_3;
			default : out = 'bx;
		endcase
	end	
endmodule

module mux_4(
	input [DataBit - 1 : 0] In_1,
	input [DataBit - 1 : 0] In_2,
	input [DataBit - 1 : 0] In_3,
	input [DataBit - 1 : 0] In_4,
	input [1:0] Sel,
	output [DataBit - 1 : 0] Out
	);
	parameter DataBit = 32;
	
	reg [DataBit - 1 : 0] out;
	assign Out = out;
	always @ (*) begin
		case (Sel)
			2'b00 : out = In_1;
			2'b01 : out = In_2;
			2'b10 : out = In_3;
			2'b11 : out = In_4;
			default : out = 'bx;
		endcase
	end	
endmodule

`endif

