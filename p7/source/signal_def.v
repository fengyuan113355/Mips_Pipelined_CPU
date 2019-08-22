`ifndef SIGNAL_DEF
`define SIGNAL_DEF

`define ADDU_FUNCT 6'b100001
`define ADD_FUNCT 6'b100000
`define SUBU_FUNCT 6'b100011
`define SUB_FUNCT 6'b100010

`define AND_FUNCT 6'b100100
`define OR_FUNCT 6'b100101
`define XOR_FUNCT 6'b100110
`define NOR_FUNCT 6'b100111

`define SLT_FUNCT 6'b101010
`define SLTU_FUNCT 6'b101011

`define SLL_FUNCT 6'b000000
`define SRL_FUNCT 6'b000010
`define SRA_FUNCT 6'b000011
`define SLLV_FUNCT 6'b000100
`define SRLV_FUNCT 6'b000110
`define SRAV_FUNCT 6'b000111

`define JR_FUNCT 6'b001000
`define JALR_FUNCT 6'b001001

`define DIV_FUNCT 6'b011010
`define DIVU_FUNCT 6'b011011
`define MULT_FUNCT 6'b011000
`define MULTU_FUNCT 6'b011001

`define MFHI_FUNCT 6'b010000
`define MFLO_FUNCT 6'b010010

`define MTHI_FUNCT 6'b010001
`define MTLO_FUNCT 6'b010011

`define MOVZ_FUNCT 6'b001010


`define R_OP 6'b000000

`define LUI_OP 6'b001111
`define ADDI_OP 6'b001000
`define ADDIU_OP 6'b001001
`define ORI_OP 6'b001101
`define ANDI_OP 6'b001100
`define XORI_OP 6'b001110

`define SLTI_OP 6'b001010
`define SLTIU_OP 6'b001011

`define LW_OP 6'b100011
`define LB_OP 6'b100000
`define LBU_OP 6'b100100
`define LH_OP 6'b100001
`define LHU_OP 6'b100101

`define SW_OP 6'b101011
`define SH_OP 6'b101001
`define SB_OP 6'b101000

`define BEQ_OP 6'b000100
`define BNE_OP 6'b000101
`define BLTZ_BGEZ_OP 6'b000001  
`define BGEZ_RT 5'b00001  
`define BLTZ_RT 5'b00000
`define BGTZ_OP 6'b000111
`define BLEZ_OP 6'b000110 

`define JAL_OP 6'b000011
`define J_OP 6'b000010

`define COP0_OP 6'b010000
`define ERET_FUNCT 6'b011000
`define MFC0_RS 5'b00000
`define MTC0_RS 5'b00100

///////////////////////////////
`define SWL_OP 6'b 101010
`define SWR_OP 6'b 101110
`define LWL_OP 6'b 100010
`define LWR_OP 6'b 100110
`define MADD_OP 6'b 011100


`define op 31:26
`define addr 25:0
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define shamt 10:6
`define funct 5:0
`define imm 15:0

`endif
