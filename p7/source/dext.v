`timescale 1ns / 1ps



module dext(
	input [31:0] DM_RData,
	input [31:0] RData2,
	input [1:0] Addr2,
	input [2:0] DEXTOp,
	output reg [31:0] DOut
    );
	
	wire [7:0] RDarray [3:0];
	assign RDarray[0] = DM_RData[7:0];
	assign RDarray[1] = DM_RData[15:8];
	assign RDarray[2] = DM_RData[23:16];
	assign RDarray[3] = DM_RData[31:24];
	
	always @ (*) begin
		case (DEXTOp) 
			3'b000 : DOut = DM_RData;
			3'b001 : DOut = {{16{RDarray[{Addr2[1], 1'b1}][7]}}, RDarray[{Addr2[1], 1'b1}], RDarray[Addr2]};
			3'b010 : DOut = {{16{1'b0}}, RDarray[{Addr2[1], 1'b1}], RDarray[Addr2]};
			3'b011 : DOut = {{24{RDarray[Addr2][7]}}, RDarray[Addr2]};
			3'b100 : DOut = {{24{1'b0}}, RDarray[Addr2]};
			3'b101 : DOut = (Addr2 == 2'b00) ? {DM_RData[7:0], RData2[23:0]} :
			                (Addr2 == 2'b01) ? {DM_RData[15:0], RData2[15:0]} :
							(Addr2 == 2'b10) ? {DM_RData[23:0], RData2[7:0]} :
							(Addr2 == 2'b11) ? DM_RData : 32'bx;
			3'b110 : DOut = (Addr2 == 2'b00) ? DM_RData :
			                (Addr2 == 2'b01) ? {RData2[31:24], DM_RData[31:8]} :
							(Addr2 == 2'b10) ? {RData2[31:16], DM_RData[31:16]} :
							(Addr2 == 2'b11) ? {RData2[31:8], DM_RData[31:24]} : 32'bx;
			default : DOut = 32'bx;
		endcase
	end

endmodule
