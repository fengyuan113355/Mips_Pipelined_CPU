`ifndef CTRL
`define CTRL

`include "signal_def.v"

module ctrl(
	input [5:0] Op,
	input [5:0] Funct,
	input ALU_Zero,
	output [1:0] nPC_Op,
	output RegWrite,
	output [1:0] RegDst,
	output [1:0] RegSrc,
	output [1:0] EXTOp,
	output [2:0] ALUOp,
	output ALUSrc,
	output MemWrite
    );

	reg [13:0] Output_Bus;     //各个控制信号的综合
	
	assign nPC_Op = Output_Bus[13:12];
	assign RegWrite = Output_Bus[11];
	assign RegDst = Output_Bus[10:9];
	assign RegSrc = Output_Bus[8:7];
	assign EXTOp = Output_Bus[6:5];
	assign ALUOp = Output_Bus[4:2];
	assign ALUSrc = Output_Bus[1];
	assign MemWrite = Output_Bus[0];
	
	always @ (Op or Funct or ALU_Zero) begin
		case (Op)
			`R_OP : 
				case (Funct)
					`ADDU_FUNCT : Output_Bus = 14'b 00_1_01_00_xx_000_0_0;
					`SUBU_FUNCT : Output_Bus = 14'b 00_1_01_00_xx_001_0_0;
					`JR_FUNCT :   Output_Bus = 14'b 11_0_xx_xx_xx_Xxx_x_0;
					default :     Output_Bus = 14'b 00_0_xx_xx_xx_Xxx_x_0;
				endcase
			`ORI_OP :             Output_Bus = 14'b 00_1_00_00_01_010_1_0;
			`LW_OP :              Output_Bus = 14'b 00_1_00_01_00_000_1_0;
			`SW_OP :              Output_Bus = 14'b 00_0_xx_xx_00_000_1_1;
			`BEQ_OP :             Output_Bus = {1'b0, ALU_Zero, 12'b0_xx_xx_xx_001_0_0};
			`BGTZ_OP :            Output_Bus = {1'b0, ALU_Zero, 12'b0_xx_xx_xx_101_0_0};
			`LUI_OP :             Output_Bus = 14'b 00_1_00_00_10_010_1_0;
			`JAL_OP :             Output_Bus = 14'b 10_1_10_10_xx_xxx_x_0;
			`SLTIU_OP :           Output_Bus = 14'b 00_1_00_00_00_100_1_0;
			default :             Output_Bus = 14'b 00_0_xx_xx_xx_xxx_x_0;
		endcase
	end	

endmodule

`endif
