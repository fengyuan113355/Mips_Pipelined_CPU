`timescale 1ns / 1ps



module timer(
	input Clk,
	input Reset,
	input [31:0] Addr,
	input We,
	input [31:0] WData,
	output [31:0] RData,
	output IntRq
    );
	
	`define IM 3
	`define MODE 2:1
	`define EN 0
	
	reg [31:0] Ctrl = 32'b0, Preset = 32'b0, Count = 32'b0;
	wire CtrlWe, PresetWe, CountWe, End0, End1;
	assign CtrlWe = We & Addr[3:2] == 2'b00;
	assign PresetWe = We & Addr[3:2] == 2'b01;
	assign CountWe = We & Addr[3:2] == 2'b10;
	
	assign End0 = Ctrl[`MODE] == 2'b00 & Count == 32'b0;
	assign End1 = Ctrl[`MODE] == 2'b01 & Count == 32'b0;
	
	assign RData = (Addr[3:2] == 2'b00) ? Ctrl :
                   (Addr[3:2] == 2'b01) ? Preset :
				   (Addr[3:2] == 2'b10) ? Count : 32'bx;
	assign IntRq = (End0 | End1) & Ctrl[`IM];
	
	always @ (posedge Clk) begin
		if (Reset) 
			Ctrl <= 32'b0;
		else if (CtrlWe)
			Ctrl <= WData;
		else if (End0)
			Ctrl[`EN] <= 1'b0;
	end
	
	always @ (posedge Clk) begin
		if (Reset)
			Preset <= 32'b0;
		else if (PresetWe)
			Preset <= WData;
	end
	
	always @ (posedge Clk) begin
		if (Reset)
			Count <= 32'b0;
		else if (CtrlWe | End1)
			Count <= Preset;
		else if (CountWe)
			Count <= WData;
		else if (Ctrl[`EN] & Count != 32'b0)
			Count <= Count - 1;
	end
	
endmodule
