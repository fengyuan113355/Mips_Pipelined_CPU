`timescale 1ns / 1ps


module mdu(
	input Clk,
	input Reset,
	input [31:0] Data1,
	input [31:0] Data2,
	input [2:0] MDOp,
	output Busy,
	output [31:0] HI,
	output [31:0] LO
    );
	
	`define DLMUL 4'b0101
	`define DLDIV 4'b1010
	
	reg [3:0] Cnt;
	reg [31:0] _HI, _LO;
	
	assign HI = _HI;
	assign LO = _LO;
	assign Busy = |(Cnt);
	
	
	always @ (posedge Clk) begin
		if (Reset)
			{_HI, _LO} <= 64'b0;
		else begin
			case (MDOp) 
				3'b001 : {_HI, _LO} <= $signed(Data1) * $signed(Data2);
				3'b010 : {_HI, _LO} <= Data1 * Data2;
				3'b011 : if (Data2) {_HI, _LO} <= {$signed(Data1) % $signed(Data2), $signed(Data1) / $signed(Data2)};
				3'b100 : if (Data2) {_HI, _LO} <= {Data1 % Data2, Data1 / Data2};
				3'b101 : _HI <= Data1;
				3'b110 : _LO <= Data1;
				3'b111 : {_HI, _LO} <= $signed(Data1) * $signed(Data2) + $signed({_HI, _LO});
			endcase
		end
	end
	
	always @ (posedge Clk) begin
		if (Reset)
			Cnt <= 4'b0000;
		else if (Cnt == 4'b0000)
			Cnt <= (MDOp == 3'b001 | MDOp == 3'b010 | MDOp == 3'b111) ? `DLMUL :
			       ((MDOp == 3'b011 | MDOp == 3'b100) & |(Data2)) ? `DLDIV : 4'b0000;
		else 
			Cnt <= Cnt - 1'b1;
	end
	
	initial begin
		Cnt <= 4'b0;
		{_HI, _LO} <= 64'b0;
	end
	
endmodule
