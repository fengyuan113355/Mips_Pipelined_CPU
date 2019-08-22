`timescale 1ns / 1ps
`ifndef CTRL 
`define CTRL

`include "signal_def.v"


module ctrl_D(
	input [31:0] Instr,
	output RegWrite,
	output [4:0] RegDst,
	output [2:0] CMPOp,
	output [1:0] EXTOp,
	output [1:0] NPCSel,
	output isBranch
    );

	reg [10:0] ctrlbd;
	wire [1:0] RegDstOp;
	assign RegWrite = ctrlbd[10];
	assign RegDstOp = ctrlbd[9:8];
	assign CMPOp = ctrlbd[7:5];
	assign EXTOp = ctrlbd[4:3];
	assign NPCSel = ctrlbd[2:1];
	assign isBranch = ctrlbd[0];
	
	assign RegDst = (RegDstOp == 2'b00) ? Instr[`rt] :
	                (RegDstOp == 2'b01) ? Instr[`rd] :
					(RegDstOp == 2'b10) ? 5'h1f : 5'bx;
	
	always @ (*) begin
		case (Instr[`op])
			`ORI_OP :   ctrlbd = 11'b 1_00_000_01_xx_0;
			`LUI_OP :   ctrlbd = 11'b 1_00_000_10_xx_0;
			`ADDI_OP :  ctrlbd = 11'b 1_00_000_00_xx_0;
			`ADDIU_OP : ctrlbd = 11'b 1_00_000_00_xx_0; 
			`LW_OP :    ctrlbd = 11'b 1_00_000_00_xx_0;
			`SW_OP :    ctrlbd = 11'b 0_xx_000_00_xx_0;
			`JAL_OP :   ctrlbd = 11'b 1_10_000_xx_10_1;
			`J_OP :     ctrlbd = 11'b 0_xx_000_xx_10_1;
			`BEQ_OP :   ctrlbd = 11'b 0_xx_001_xx_01_1;
			`BNE_OP :   ctrlbd = 11'b 0_xx_010_xx_01_1;
			`R_OP : 
				case (Instr[`funct])
					`JR_FUNCT :   ctrlbd = 11'b 0_xx_000_xx_11_1;
					`ADD_FUNCT :  ctrlbd = 11'b 1_01_000_xx_xx_0;
					`ADDU_FUNCT : ctrlbd = 11'b 1_01_000_xx_xx_0;
					`SUB_FUNCT :  ctrlbd = 11'b 1_01_000_xx_xx_0;
					`SUBU_FUNCT : ctrlbd = 11'b 1_01_000_xx_xx_0;
					`SLL_FUNCT :  ctrlbd = 11'b 1_01_000_xx_xx_0;
					`AND_FUNCT :  ctrlbd = 11'b 1_01_000_xx_xx_0;
					`OR_FUNCT :   ctrlbd = 11'b 1_01_000_xx_xx_0;
					`XOR_FUNCT :  ctrlbd = 11'b 1_01_000_xx_xx_0;
					`SRL_FUNCT :  ctrlbd = 11'b 1_01_000_xx_xx_0;
					`MOVZ_FUNCT : ctrlbd = 11'b 1_01_000_xx_xx_0;
					default :     ctrlbd = 11'b 0_xx_000_xx_xx_0;
				endcase
			default : ctrlbd = 11'b 0_xx_000_xx_xx_0;
		endcase
	end	
endmodule

module ctrl_E(
	input [31:0] Instr,
	output [3:0] ALUOp,
	output ALUSrc,
	output [1:0] COMPOp
	);
	
	reg [6:0] ctrlbe;
	assign COMPOp = ctrlbe[6:5];
	assign ALUOp = ctrlbe[4:1];
	assign ALUSrc = ctrlbe[0];
	
	always @ (*) begin
		case (Instr[`op])
			`ORI_OP :   ctrlbe = 7'b 00_0010_1;
			`LUI_OP :   ctrlbe = 7'b 00_0010_1;
			`ADDI_OP :  ctrlbe = 7'b 00_0000_1;
			`ADDIU_OP : ctrlbe = 7'b 00_0000_1;
			`LW_OP :    ctrlbe = 7'b 00_0000_1;
			`SW_OP :    ctrlbe = 7'b 00_0000_1;
			`R_OP : 
				case (Instr[`funct])
					`ADD_FUNCT :  ctrlbe = 7'b 00_0000_0;
					`ADDU_FUNCT : ctrlbe = 7'b 00_0000_0;
					`SUB_FUNCT :  ctrlbe = 7'b 00_0001_0; 
					`SUBU_FUNCT : ctrlbe = 7'b 00_0001_0;
					`AND_FUNCT :  ctrlbe = 7'b 00_0011_0;
					`OR_FUNCT :   ctrlbe = 7'b 00_0010_0;
					`XOR_FUNCT :  ctrlbe = 7'b 00_0100_0;
					`SLL_FUNCT :  ctrlbe = 7'b 00_0101_0;
					`SRL_FUNCT :  ctrlbe = 7'b 00_0110_0;
					`MOVZ_FUNCT : ctrlbe = 7'b 01_0111_0;
					default :     ctrlbe = 7'b 00_xxxx_x;
				endcase
			default : ctrlbe = 7'b 00_xxxx_x;
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
	output [1:0] RegSrc
	);

	reg [1:0] _RegSrc;
	assign RegSrc = _RegSrc;
	
	always @ (*) begin
		case (Instr[`op])
			`ORI_OP :   _RegSrc = 2'b 00;
			`LUI_OP :   _RegSrc = 2'b 00;
			`ADDI_OP :  _RegSrc = 2'b 00;
			`ADDIU_OP : _RegSrc = 2'b 00;
			`LW_OP :    _RegSrc = 2'b 01;
			`JAL_OP :   _RegSrc = 2'b 10;
			`R_OP : 
				case (Instr[`funct])
					`ADD_FUNCT :  _RegSrc = 2'b 00;
					`ADDU_FUNCT : _RegSrc = 2'b 00;
					`SUB_FUNCT :  _RegSrc = 2'b 00;
					`SUBU_FUNCT : _RegSrc = 2'b 00;
					`AND_FUNCT :  _RegSrc = 2'b 00;
					`OR_FUNCT :   _RegSrc = 2'b 00;
					`XOR_FUNCT :  _RegSrc = 2'b 00;
					`SLL_FUNCT :  _RegSrc = 2'b 00;
					`SRL_FUNCT :  _RegSrc = 2'b 00;
					`MOVZ_FUNCT : _RegSrc = 2'b 00;
					default :     _RegSrc = 2'b xx;
				endcase
			default : _RegSrc = 2'b xx;
		endcase
	end
endmodule



`endif
