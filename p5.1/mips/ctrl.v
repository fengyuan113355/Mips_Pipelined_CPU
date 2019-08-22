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

	reg [1:0] _EXTOp, _NPCSel;
	reg _isBranch;
	assign EXTOp = _EXTOp;
	assign NPCSel = _NPCSel;
	assign isBranch = _isBranch;
	
	always @ (*) begin
		case (Instr[`op])
			`ORI_OP : _EXTOp = 2'b01;
			`LUI_OP : _EXTOp = 2'b10;
			`LW_OP : _EXTOp = 2'b00;
			`SW_OP : _EXTOp = 2'b00;
			default : _EXTOp = 2'bxx;
		endcase
	end
	
	always @ (*) begin
		case (Instr[`op])
			`J_OP :  _NPCSel = 2'b10; 
			`JAL_OP : _NPCSel = 2'b10;
			`BEQ_OP : _NPCSel = 2'b01;
			`R_OP :
				case (Instr[`funct])
					`JALR_FUNCT : _NPCSel = 2'b11;
					default : _NPCSel = 2'bxx;
				endcase
			default : _NPCSel = 2'bxx;
		endcase
	end
	
	always @ (*) begin
		case (Instr[`op])
			`J_OP :  _isBranch = 1;
			`JAL_OP : _isBranch = 1;
			`BEQ_OP : _isBranch = 1;
			`R_OP : 
				case (Instr[`funct])
					`JALR_FUNCT : _isBranch = 1;
					default : _isBranch = 0;
				endcase
			default : _isBranch = 0;
		endcase
	end
	
endmodule

module ctrl_E(
	input [31:0] Instr,
	output [2:0] ALUOp,
	output ALUSrc
	);
	
	reg [2:0] _ALUOp;
	reg _ALUSrc;
	assign ALUOp = _ALUOp;
	assign ALUSrc = _ALUSrc;
	
	always @ (*) begin
		case (Instr[`op])
			`ORI_OP : _ALUOp = 3'b010;
			`LUI_OP : _ALUOp = 3'b010;
			`LW_OP : _ALUOp = 3'b000;
			`SW_OP : _ALUOp = 3'b000;
			`R_OP : 
				case (Instr[`funct])
					`ADDU_FUNCT : _ALUOp = 3'b000;
					`SUBU_FUNCT : _ALUOp = 3'b001;
					default : _ALUOp = 3'bxxx;
				endcase
			default : _ALUOp = 3'bxxx;
		endcase
	end
	
	always @ (*) begin
		case (Instr[`op]) 
			`ORI_OP : _ALUSrc = 1'b1;
			`LUI_OP : _ALUSrc = 1'b1;
			`LW_OP : _ALUSrc = 1'b1;
			`SW_OP : _ALUSrc = 1'b1;
			`R_OP :
				case (Instr[`funct])
					`ADDU_FUNCT : _ALUSrc = 1'b0;
					`SUBU_FUNCT : _ALUSrc = 1'b0;
					default : _ALUSrc = 1'bx;
				endcase
			default : _ALUSrc = 1'bx;
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
			`SW_OP : _MemWrite = 1'b1;
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

	reg [1:0] _RegDst, _RegSrc;
	reg _RegWrite;
	assign RegWrite = _RegWrite;
	assign RegDst = _RegDst;
	assign RegSrc = _RegSrc;
	
	always @ (*) begin
		case (Instr[`op])
			`ORI_OP : _RegWrite = 1'b1;
			`LUI_OP : _RegWrite = 1'b1;
			`LW_OP : _RegWrite = 1'b1;
			`JAL_OP : _RegWrite = 1'b1;
			`R_OP : 
				case (Instr[`funct])
					`ADDU_FUNCT : _RegWrite = 1'b1;
					`SUBU_FUNCT : _RegWrite = 1'b1;
					`JALR_FUNCT : _RegWrite = 1'b1;
					default : _RegWrite = 1'b0;
				endcase
			default : _RegWrite = 1'b0;
		endcase
	end
	
	always @ (*) begin
		case (Instr[`op]) 
			`ORI_OP : _RegDst = 2'b00;
			`LUI_OP : _RegDst = 2'b00;
			`LW_OP : _RegDst = 2'b00;
			`JAL_OP : _RegDst = 2'b10;
			`R_OP : 
				case (Instr[`funct])
					`ADDU_FUNCT : _RegDst = 2'b01;
					`SUBU_FUNCT : _RegDst = 2'b01;
					`JALR_FUNCT : _RegDst = 2'b01;
					default : _RegDst = 2'bxx;
				endcase
			default : _RegDst = 2'bxx;
		endcase
	end
	
	always @ (*) begin
		case (Instr[`op])
			`ORI_OP : _RegSrc = 2'b00;
			`LUI_OP : _RegSrc = 2'b00;
			`LW_OP : _RegSrc = 2'b01;
			`JAL_OP : _RegSrc = 2'b10;
			`R_OP : 
				case (Instr[`funct])
					`ADDU_FUNCT : _RegSrc = 2'b00;
					`SUBU_FUNCT : _RegSrc = 2'b00;
					`JALR_FUNCT : _RegSrc = 2'b10;
					default : _RegSrc = 2'bxx;
				endcase
			default : _RegSrc = 2'bxx;
		endcase
	end
	
endmodule



`endif
