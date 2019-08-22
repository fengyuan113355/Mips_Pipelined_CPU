`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:14:08 10/03/2016 
// Design Name: 
// Module Name:    comparator 
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
module comparator(
    input [3:0] A,
    input [3:0] B,
    output Out
    );
	
	wire Out0, Out1, Out2, Out3;
    wire Eql1, Eql2, Eql3;
	
	one_bit_comp bit3(.A(A[3]), .B(B[3]), .Out(Out3), .Eql(Eql3));
	one_bit_comp bit2(.A(A[2]), .B(B[2]), .Out(Out2), .Eql(Eql2));
	one_bit_comp bit1(.A(A[1]), .B(B[1]), .Out(Out1), .Eql(Eql1));
	one_bit_comp bit0(.A(A[0]), .B(B[0]), .Out(Out0));
	
	assign Out = Out3 |
	             (Eql3 & Out2) | 
				 (Eql3 & Eql2 & Out1) | 
				 (Eql3 & Eql2 & Eql1 & Out0);	
endmodule

module one_bit_comp(
    input A,
    input B,
    output Out,
    output Eql
    );
	
	assign Out = A & ~B;
	assign Eql = (~A & ~B) | (A & B);

endmodule