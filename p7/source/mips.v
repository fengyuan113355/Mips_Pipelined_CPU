`timescale 1ns / 1ps



module mips(
	input clk,
	input reset
    );

	wire [7:2] HWInt;
	wire [31:0] PrRD, PrAddr, PrWD, DevRD0, DevRD1, DevAddr, DevWD;
	wire PrWe, DevWe0, DevWe1, DevInt0, DevInt1;
	

	cpu MIPS_CPU(.clk(clk), .reset(reset), .PrRD(PrRD), .HWInt(HWInt), .PrAddr(PrAddr), .PrWD(PrWD), .PrWe(PrWe));
	
	bridge MIPS_BRIDGE(.PrAddr(PrAddr), .PrWD(PrWD), .DevRD0(DevRD0), .DevRD1(DevRD1), .DevInt0(DevInt0), .DevInt1(DevInt1), .PrWe(PrWe), 
	                   .DevAddr(DevAddr), .DevWD(DevWD), .PrRD(PrRD), .HWInt(HWInt), .DevWe0(DevWe0), .DevWe1(DevWe1));
	
	timer MIPS_TIMER0(.Clk(clk), .Reset(reset), .Addr(DevAddr), .We(DevWe0), .WData(DevWD), .RData(DevRD0), .IntRq(DevInt0));
	
	timer MIPS_TIMER1(.Clk(clk), .Reset(reset), .Addr(DevAddr), .We(DevWe1), .WData(DevWD), .RData(DevRD1), .IntRq(DevInt1));

	
endmodule
