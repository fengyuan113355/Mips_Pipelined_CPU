`ifndef SIGNAL_DEF
`define SIGNAL_DEF

`define ADDU_FUNCT 6'b100001
`define ADD_FUNCT 6'b100000
`define SUBU_FUNCT 6'b100011
`define SUB_FUNCT 6'b100010
`define AND_FUNCT 6'b100100
`define OR_FUNCT 6'b100101
`define XOR_FUNCT 6'b100110
`define SLL_FUNCT 6'b000000
`define SRL_FUNCT 6'b000010
`define JR_FUNCT 6'b001000
`define JALR_FUNCT 6'b001001

`define MOVZ_FUNCT 6'b001010


`define R_OP 6'b000000

`define ADDI_OP 6'b001000
`define ADDIU_OP 6'b001001
`define ORI_OP 6'b001101
`define LW_OP 6'b100011
`define SW_OP 6'b101011
`define BEQ_OP 6'b000100
`define BNE_OP 6'b000101
`define LUI_OP 6'b001111
`define JAL_OP 6'b000011
`define J_OP 6'b000010


`define op 31:26
`define addr 25:0
`define rs 25:21
`define rt 20:16
`define rd 15:11
`define shamt 10:6
`define funct 5:0
`define imm 15:0

`endif
