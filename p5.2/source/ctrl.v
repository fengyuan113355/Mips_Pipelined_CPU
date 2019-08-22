`timescale 1ns / 1ps
`ifndef CTRL 
`define CTRL

`include "signal_def.v"


module ctrl_D(
	input [31:0] Instr,
	output [1:0] EXTOp,
	output [1:0] NPCSel,
	output isBranch
    );

	reg [4:0] ctrlbd;
	assign EXTOp = ctrlbd[4:3];
	assign NPCSel = ctrlbd[2:1];
	assign isBranch = ctrlbd[0];
	
	always @ (*) begin
		case (Instr[`op])
			`ORI_OP : ctrlbd = 5'b 01_xx_0;
			`LUI_OP : ctrlbd = 5'b 10_xx_0;
			`LW_OP :  ctrlbd = 5'b 00_xx_0;
			`SW_OP :  ctrlbd = 5'b 00_xx_0;
			`JAL_OP : ctrlbd = 5'b xx_10_1;
			`J_OP :   ctrlbd = 5'b xx_10_1;
			`BEQ_OP : ctrlbd = 5'b xx_01_1;
			`R_OP : 
				case (Instr[`funct])
					`JR_FUNCT :  ctrlbd = 5'b xx_11_1;
					default : ctrlbd = 5'b xx_xx_0;
				endcase
			default : ctrlbd = 5'b xx_xx_0;
		endcase
	end
endmodule

module ctrl_E(
	input [31:0] Instr,
	output [2:0] ALUOp,
	output ALUSrc
	);
	
	reg [3:0] ctrlbe;
	assign ALUOp = ctrlbe[3:1];
	assign ALUSrc = ctrlbe[0];
	
	always @ (*) begin
		case (Instr[`op])
			`ORI_OP : ctrlbe = 4'b 010_1;
			`LUI_OP : ctrlbe = 4'b 010_1;
			`LW_OP :  ctrlbe = 4'b 000_1;
			`SW_OP :  ctrlbe = 4'b 000_1;
			`R_OP : 
				case (Instr[`funct])
					`ADDU_FUNCT : ctrlbe = 4'b 000_0;
					`SUBU_FUNCT : ctrlbe = 4'b 001_0;
					default :     ctrlbe = 4'b xxx_x;
				endcase
			default : ctrlbe = 4'b xxx_x;
		endcase
	end
endmodule

module ctrl_M(
	input [31:0] Instr,
	output MemWrite
	);
	
	reg _MemWrite;
	assign MemWrite = _MemWrite;
	
	always @ (*) begin
		case (Instr[`op])
			`SW_OP :  _MemWrite = 1'b1;
			default : _MemWrite = 1'b0;
		endcase
	end

endmodule

module ctrl_W(
	input [31:0] Instr,
	output RegWrite,
	output [1:0] RegDst,
	output [1:0] RegSrc
	);

	reg [4:0] ctrlbw;
	assign RegWrite = ctrlbw[4];
	assign RegDst =   ctrlbw[3:2];
	assign RegSrc =   ctrlbw[1:0];
	
	always @ (*) begin
		case (Instr[`op])
			`ORI_OP : ctrlbw = 5'b 1_00_00;
			`LUI_OP : ctrlbw = 5'b 1_00_00;
			`LW_OP :  ctrlbw = 5'b 1_00_01;
			`JAL_OP : ctrlbw = 5'b 1_10_10;
			`R_OP : 
				case (Instr[`funct])
					`ADDU_FUNCT : ctrlbw = 5'b 1_01_00;
					`SUBU_FUNCT : ctrlbw = 5'b 1_01_00;
					default :     ctrlbw = 5'b 0_xx_xx;
				endcase
			default : ctrlbw = 5'b 0_xx_xx;
		endcase
	end
endmodule



`endif
