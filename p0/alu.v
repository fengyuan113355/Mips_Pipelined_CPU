`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:24:05 10/03/2016 
// Design Name: 
// Module Name:    alu 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu(
    input [3:0] A,
    input [3:0] B,
    input [1:0] ALUOp,
    output [3:0] C
    );
	
	wire [3:0] out1, out2, out3, out4;

	assign out1 = A + B;
	assign out2 = A - B;
	assign out3 = A & B;
	assign out4 = A | B;
	
	assign C = (ALUOp[0] == 0) ?
			   ((ALUOp[1] == 0) ? out1 : out3) :
			   ((ALUOp[1] == 0) ? out2 : out4);
	
endmodule
