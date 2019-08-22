`timescale 1ns / 1ps



module bridge(
	input [31:0] PrAddr,
	input [31:0] PrWD,
	input [31:0] DevRD0,
	input [31:0] DevRD1,
	input DevInt0,
	input DevInt1,
	input PrWe,
	
	output [31:0] DevAddr,
	output [31:0] DevWD,
	output [31:0] PrRD,
	output [7:2] HWInt,
	output DevWe0,
	output DevWe1
    );
	
	wire HitDev0, HitDev1;

	assign HitDev0 = PrAddr[31:4] == 28'h0000_7F0;
	assign HitDev1 = PrAddr[31:4] == 28'h0000_7F1;
	assign HWInt = {4'b0, DevInt1, DevInt0};
	
	assign DevWe0 = PrWe & HitDev0;
	assign DevWe1 = PrWe & HitDev1;
	
	assign DevAddr = PrAddr;
	assign DevWD = PrWD;
	
	assign PrRD = (HitDev0) ? DevRD0 :
	              (HitDev1) ? DevRD1 : 32'bx;	
	
	
endmodule
