`timescale 1ns / 1ps



module CP0(
	input Clk,
	input Reset,
	input [4:0] Addr,
	input [31:0] DIn,
	input [31:0] PC,
	//input [6:2] ExcCode,
	input [5:0] HWInt,
	input We,
	input EXLSet,
	input EXLClr,
	output IntReq,
	output [31:0] EPC,
	output [31:0] DOut
    );
	
	reg [15:10] IM = 6'b0;
	reg EXL = 1'b0, IE = 1'b0;
	reg [15:10] IP = 6'b0;
	reg [31:0] _EPC = 32'b0;
	reg [31:0] PRId = 32'h 15061100;
	
	wire [31:0] SR, Cause;
	assign SR = {16'b0, IM, 8'b0, EXL, IE};
	assign Cause = {16'b0, IP, 10'b0};
	
	assign IntReq = |(HWInt & IM) & IE & ~EXL;
	assign EPC = (We & Addr == 5'd14) ? DIn : _EPC;
	assign DOut = (Addr == 5'd12) ? SR : 
	              (Addr == 5'd13) ? Cause :
				  (Addr == 5'd14) ? _EPC :
				  (Addr == 5'd15) ? PRId : 32'b0;
				  
	always @ (posedge Clk) begin
		if (Reset)
			{IM, EXL, IE} <= 8'b0;
		else if (EXLSet)
			EXL <= 1'b1;
		else if (EXLClr)
			EXL <= 1'b0;
		else if (We & Addr == 5'd12)
			{IM, EXL, IE} <= {DIn[15:10], DIn[1:0]};			
	end
	
	always @ (posedge Clk) begin
		if (Reset)
			IP <= 6'b0;
		else if (We & Addr == 5'd13)
			IP <= DIn[15:10];
		else if (IntReq)
			IP <= HWInt;
	end
	
	always @ (posedge Clk) begin
		if (Reset)
			_EPC <= 32'b0;
		else if (We & Addr == 5'd14)
			_EPC <= DIn;
		else if (IntReq)
			_EPC <= PC;
	end
	
	always @ (posedge Clk) begin
		if (Reset)
			PRId <= 32'h 15061100;
		else if (We & Addr == 5'd15)
			PRId <= DIn;
	end

endmodule
















