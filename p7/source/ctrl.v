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
	output isBranch,
	output isEret
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
	
	assign isEret = (Instr[`op] == `COP0_OP & Instr[`funct] == `ERET_FUNCT);
	
	always @ (*) begin
		case (Instr[`op])
			`COP0_OP : ctrlbd =  (Instr[`rs] == `MFC0_RS) ? 
			                     11'b 1_00_000_xx_xx_0 :
								 11'b 0_xx_000_xx_xx_0;								 
		
			`JAL_OP :   ctrlbd = 11'b 1_10_000_xx_10_1;
			`J_OP :     ctrlbd = 11'b 0_xx_000_xx_10_1;
			
			`BEQ_OP :   ctrlbd = 11'b 0_xx_001_xx_01_1;
			`BNE_OP :   ctrlbd = 11'b 0_xx_010_xx_01_1;
			`BLEZ_OP :  ctrlbd = 11'b 0_xx_011_xx_01_1;
			`BGTZ_OP :  ctrlbd = 11'b 0_xx_100_xx_01_1;
			`BLTZ_BGEZ_OP :  ctrlbd = (Instr[`rt] == `BLTZ_RT) ? 11'b 0_xx_101_xx_01_1 :
                                      (Instr[`rt] == `BGEZ_RT) ? 11'b 0_xx_110_xx_01_1 : 11'b 0_xx_000_xx_xx_0;
			
			`ORI_OP :   ctrlbd = 11'b 1_00_000_01_xx_0;
			`XORI_OP :  ctrlbd = 11'b 1_00_000_01_xx_0;
			`ANDI_OP :  ctrlbd = 11'b 1_00_000_01_xx_0;
			`LUI_OP :   ctrlbd = 11'b 1_00_000_10_xx_0;
			`ADDI_OP :  ctrlbd = 11'b 1_00_000_00_xx_0;
			`ADDIU_OP : ctrlbd = 11'b 1_00_000_00_xx_0;
			`SLTI_OP :  ctrlbd = 11'b 1_00_000_00_xx_0;
			`SLTIU_OP : ctrlbd = 11'b 1_00_000_00_xx_0;
			
			`LW_OP :    ctrlbd = 11'b 1_00_000_00_xx_0;
			`LH_OP :    ctrlbd = 11'b 1_00_000_00_xx_0;
			`LHU_OP :   ctrlbd = 11'b 1_00_000_00_xx_0;
			`LB_OP :    ctrlbd = 11'b 1_00_000_00_xx_0;
			`LBU_OP :   ctrlbd = 11'b 1_00_000_00_xx_0;
			
			`LWL_OP :   ctrlbd = 11'b 1_00_000_00_xx_0;
			`LWR_OP :   ctrlbd = 11'b 1_00_000_00_xx_0;
			
			`SW_OP :    ctrlbd = 11'b 0_xx_000_00_xx_0;
			`SH_OP :    ctrlbd = 11'b 0_xx_000_00_xx_0;
			`SB_OP :    ctrlbd = 11'b 0_xx_000_00_xx_0;
			
			`SWL_OP :   ctrlbd = 11'b 0_xx_000_00_xx_0;
			`SWR_OP :   ctrlbd = 11'b 0_xx_000_00_xx_0;
			
			`MADD_OP :  ctrlbd = 11'b 0_xx_000_xx_xx_0;

			`R_OP : 
				case (Instr[`funct])
					`JR_FUNCT :    ctrlbd = 11'b 0_xx_000_xx_11_1;
					`JALR_FUNCT :  ctrlbd = 11'b 1_01_000_xx_11_1;
				 	
					`ADD_FUNCT :   ctrlbd = 11'b 1_01_000_xx_xx_0;
					`ADDU_FUNCT :  ctrlbd = 11'b 1_01_000_xx_xx_0;
					`SUB_FUNCT :   ctrlbd = 11'b 1_01_000_xx_xx_0;
					`SUBU_FUNCT :  ctrlbd = 11'b 1_01_000_xx_xx_0;
					`AND_FUNCT :   ctrlbd = 11'b 1_01_000_xx_xx_0;
					`OR_FUNCT :    ctrlbd = 11'b 1_01_000_xx_xx_0;
					`XOR_FUNCT :   ctrlbd = 11'b 1_01_000_xx_xx_0;
					`NOR_FUNCT :   ctrlbd = 11'b 1_01_000_xx_xx_0;
					`SLL_FUNCT :   ctrlbd = 11'b 1_01_000_xx_xx_0;
					`SRL_FUNCT :   ctrlbd = 11'b 1_01_000_xx_xx_0;
					`SRA_FUNCT :   ctrlbd = 11'b 1_01_000_xx_xx_0;
					`SLLV_FUNCT :  ctrlbd = 11'b 1_01_000_xx_xx_0;
					`SRLV_FUNCT :  ctrlbd = 11'b 1_01_000_xx_xx_0;
					`SRAV_FUNCT :  ctrlbd = 11'b 1_01_000_xx_xx_0;
					`SLT_FUNCT :   ctrlbd = 11'b 1_01_000_xx_xx_0;
					`SLTU_FUNCT :  ctrlbd = 11'b 1_01_000_xx_xx_0;
					
					`MFHI_FUNCT :  ctrlbd = 11'b 1_01_000_xx_xx_0;
					`MFLO_FUNCT :  ctrlbd = 11'b 1_01_000_xx_xx_0;
					
					`MTHI_FUNCT :  ctrlbd = 11'b 0_xx_000_xx_xx_0;
					`MTLO_FUNCT :  ctrlbd = 11'b 0_xx_000_xx_xx_0;
					
					`MULT_FUNCT :  ctrlbd = 11'b 0_xx_000_xx_xx_0;
					`MULTU_FUNCT : ctrlbd = 11'b 0_xx_000_xx_xx_0;
					`DIV_FUNCT :   ctrlbd = 11'b 0_xx_000_xx_xx_0;
					`DIVU_FUNCT :  ctrlbd = 11'b 0_xx_000_xx_xx_0;				
					default :      ctrlbd = 11'b 0_xx_000_xx_xx_0;
				endcase
			default : ctrlbd = 11'b 0_xx_000_xx_xx_0;
		endcase
	end	
endmodule

module ctrl_E(
	input [31:0] Instr,
	output [3:0] ALUOp,
	output ALUSrc,
	output [2:0] MDOp,
	output HILOSel,
	output CP0We
	);
	
	assign CP0We = (Instr[`op] == `COP0_OP & Instr[`rs] == `MTC0_RS);
	
	reg [8:0] ctrlbe;
	assign MDOp = ctrlbe[8:6];
	assign HILOSel = ctrlbe[5];
	assign ALUOp = ctrlbe[4:1];
	assign ALUSrc = ctrlbe[0];
	
	always @ (*) begin
		case (Instr[`op])
			`ORI_OP :   ctrlbe = 9'b 000_x_0010_1;
			`XORI_OP :  ctrlbe = 9'b 000_x_0100_1;
			`ANDI_OP :  ctrlbe = 9'b 000_x_0011_1;
			`LUI_OP :   ctrlbe = 9'b 000_x_0010_1;
			`ADDI_OP :  ctrlbe = 9'b 000_x_0000_1;
			`ADDIU_OP : ctrlbe = 9'b 000_x_0000_1;
			`SLTI_OP :  ctrlbe = 9'b 000_x_1100_1;
			`SLTIU_OP : ctrlbe = 9'b 000_x_1101_1;
			
			`LW_OP :    ctrlbe = 9'b 000_x_0000_1;
			`LH_OP :    ctrlbe = 9'b 000_x_0000_1;
			`LHU_OP :   ctrlbe = 9'b 000_x_0000_1;
			`LB_OP :    ctrlbe = 9'b 000_x_0000_1;
			`LBU_OP :   ctrlbe = 9'b 000_x_0000_1;
			
			`LWL_OP :   ctrlbe = 9'b 000_x_0000_1;
			`LWR_OP :   ctrlbe = 9'b 000_x_0000_1;
			
			`SW_OP :    ctrlbe = 9'b 000_x_0000_1;
			`SH_OP :    ctrlbe = 9'b 000_x_0000_1;
			`SB_OP :    ctrlbe = 9'b 000_x_0000_1;
			`SWL_OP :   ctrlbe = 9'b 000_x_0000_1;
			`SWR_OP :   ctrlbe = 9'b 000_x_0000_1;
			
			`MADD_OP :  ctrlbe = 9'b 111_x_xxxx_0;
			
			`R_OP : 
				case (Instr[`funct])
					`ADD_FUNCT :  ctrlbe = 9'b 000_x_0000_0;
					`ADDU_FUNCT : ctrlbe = 9'b 000_x_0000_0;
					`SUB_FUNCT :  ctrlbe = 9'b 000_x_0001_0; 
					`SUBU_FUNCT : ctrlbe = 9'b 000_x_0001_0;
					`AND_FUNCT :  ctrlbe = 9'b 000_x_0011_0;
					`OR_FUNCT :   ctrlbe = 9'b 000_x_0010_0;
					`XOR_FUNCT :  ctrlbe = 9'b 000_x_0100_0;
					`NOR_FUNCT :  ctrlbe = 9'b 000_x_0101_0;
					`SLL_FUNCT :  ctrlbe = 9'b 000_x_0110_0;
					`SRL_FUNCT :  ctrlbe = 9'b 000_x_0111_0;
					`SRA_FUNCT :  ctrlbe = 9'b 000_x_1000_0;
					`SLLV_FUNCT : ctrlbe = 9'b 000_x_1001_0;
					`SRLV_FUNCT : ctrlbe = 9'b 000_x_1010_0;
					`SRAV_FUNCT : ctrlbe = 9'b 000_x_1011_0;
					`SLT_FUNCT :  ctrlbe = 9'b 000_x_1100_0;
					`SLTU_FUNCT : ctrlbe = 9'b 000_x_1101_0;
					
					`MULT_FUNCT :  ctrlbe = 9'b 001_x_xxxx_0;
					`MULTU_FUNCT : ctrlbe = 9'b 010_x_xxxx_0;
					`DIV_FUNCT :   ctrlbe = 9'b 011_x_xxxx_0;
					`DIVU_FUNCT :  ctrlbe = 9'b 100_x_xxxx_0;
					
					`MTHI_FUNCT :  ctrlbe = 9'b 101_x_xxxx_0;
					`MTLO_FUNCT :  ctrlbe = 9'b 110_x_xxxx_0;
					
					`MFHI_FUNCT :  ctrlbe = 9'b 000_0_xxxx_0;
					`MFLO_FUNCT :  ctrlbe = 9'b 000_1_xxxx_0;
					default :     ctrlbe = 9'b 000_x_xxxx_0;
				endcase
			default : ctrlbe = 9'b 000_x_xxxx_0;
		endcase
	end
endmodule

module ctrl_M(
	input [31:0] Instr,
	output MemWrite,
	output [2:0] MemWOp
	);
	
	reg [3:0] ctrlbm;
	assign MemWOp = ctrlbm[3:1];
	assign MemWrite = ctrlbm[0];
	
	always @ (*) begin
		case (Instr[`op])
			`SW_OP :  ctrlbm = 4'b 000_1;
			`SH_OP :  ctrlbm = 4'b 001_1;
			`SB_OP :  ctrlbm = 4'b 010_1;
			`SWL_OP : ctrlbm = 4'b 011_1;
			`SWR_OP : ctrlbm = 4'b 100_1;
			default : ctrlbm = 4'b xxx_0;
		endcase
	end

endmodule

module ctrl_W(
	input [31:0] Instr,
	output [2:0] RegSrc,
	output [2:0] DEXTOp
	);

	reg [5:0] ctrlbw;
	assign DEXTOp = ctrlbw[5:3];
	assign RegSrc = ctrlbw[2:0];
	
	always @ (*) begin
		case (Instr[`op])
			`COP0_OP :  ctrlbw = (Instr[`rs] == `MFC0_RS) ?
			                     6'b xxx_011 :
								 6'b xxx_xxx;
		
			`JAL_OP :   ctrlbw = 6'b xxx_000;
			
			`ORI_OP :   ctrlbw = 6'b xxx_001;
			`XORI_OP :  ctrlbw = 6'b xxx_001;
			`ANDI_OP :  ctrlbw = 6'b xxx_001;
			`LUI_OP :   ctrlbw = 6'b xxx_001;
			`ADDI_OP :  ctrlbw = 6'b xxx_001;
			`ADDIU_OP : ctrlbw = 6'b xxx_001;
			`SLTI_OP :  ctrlbw = 6'b xxx_001;
			`SLTIU_OP : ctrlbw = 6'b xxx_001;			
			
			`LW_OP :    ctrlbw = 6'b 000_100;
			`LH_OP :    ctrlbw = 6'b 001_100;
			`LHU_OP :   ctrlbw = 6'b 010_100;
			`LB_OP :    ctrlbw = 6'b 011_100;
			`LBU_OP :   ctrlbw = 6'b 100_100;
			
			`LWL_OP :   ctrlbw = 6'b 101_100;
			`LWR_OP :   ctrlbw = 6'b 110_100;
			
			`R_OP : 
				case (Instr[`funct])
					`JALR_FUNCT : ctrlbw = 6'b xxx_000;
					
					`ADD_FUNCT :  ctrlbw = 6'b xxx_001;
					`ADDU_FUNCT : ctrlbw = 6'b xxx_001;
					`SUB_FUNCT :  ctrlbw = 6'b xxx_001;
					`SUBU_FUNCT : ctrlbw = 6'b xxx_001;
					`AND_FUNCT :  ctrlbw = 6'b xxx_001;
					`OR_FUNCT :   ctrlbw = 6'b xxx_001;
					`XOR_FUNCT :  ctrlbw = 6'b xxx_001;
					`NOR_FUNCT :  ctrlbw = 6'b xxx_001;
					`SLL_FUNCT :  ctrlbw = 6'b xxx_001;
					`SRL_FUNCT :  ctrlbw = 6'b xxx_001;
					`SRA_FUNCT :  ctrlbw = 6'b xxx_001;
					`SLLV_FUNCT : ctrlbw = 6'b xxx_001;
					`SRLV_FUNCT : ctrlbw = 6'b xxx_001;
					`SRAV_FUNCT : ctrlbw = 6'b xxx_001;
					`SLT_FUNCT :  ctrlbw = 6'b xxx_001;
					`SLTU_FUNCT : ctrlbw = 6'b xxx_001;
					
					`MFHI_FUNCT : ctrlbw = 6'b xxx_010;
					`MFLO_FUNCT : ctrlbw = 6'b xxx_010;
					default : ctrlbw = 6'b xxx_xxx;
				endcase
			default : ctrlbw = 6'b xxx_xxx;
		endcase
	end
endmodule



`endif
