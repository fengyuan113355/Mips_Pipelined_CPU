`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:49:04 10/22/2016 
// Design Name: 
// Module Name:    fsm
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
module fsm(
	input Clk,
	input Clr,
	input X,
	output reg Z
    );
	
	parameter S0 = 4'b0001,
			  S1 = 4'b0010,
			  S2 = 4'b0100,
			  S3 = 4'b1000;
	reg [3:0] state;
	
	always @ (posedge Clk or posedge Clr) begin
		if (Clr) 
			state <= S0;
		else begin
			case (state) 
				S0 : state <= X ? S1 : S0;
				S1 : state <= X ? S1 : S2;
				S2 : state <= X ? S3 : S0;
				S3 : state <= X ? S1 : S2;
				default : state <= 4'bx;
			endcase
		end
	end
	
	always @ (state) begin
		case (state) 
			S3 : Z = 1'b1;
			default : Z = 1'b0;
		endcase
	end
	
	initial begin
		state <= S0;
	end
	
endmodule
