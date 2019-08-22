lui $t0, 0x3424
ori $t0, $t0, 0x2342
lui $t1, 0x5432
ori $t1, $t1, 0x4232
subu $t2, $t1, $t0
addu $t3, $t2, $t0
addu $t4, $t1, $t0
addu $t5, $t0, $t4
ori $t6, $t0, 0x2422
subu $t7, $t6, $t0
ori $t8, $t0, 0x4320
addu $t9, $t0, $t8
ori $s0, $t9, 0x8923
ori $s1, $s0, 0x4239
addu $s2, $t0, $t1
nop
subu $s3, $s2, $t1
nop
addu $s4, $s0, $s3
nop
ori $s5, $s4, 0x3242
nop
ori $s6, $s5, 0x4324
nop
addu $s7, $s6, $0
lui $t2, 0x4243
nop
addu $t3, $t0, $t2
addu $0, $s0, $s1
subu $t2, $t1, $0
subu $0, $t2, $t1
ori $t3, $0, 0x5555
addu $t4, $t3, $0
j jump1
lui $t7, 0x1234
lui $t8, 0x2345
jump1:
ori $t8, $0, 0x3456
j jump2
lui $t7, 0x3333
jump2:
ori $t8, $t7, 0x3242
loop:
j loop
nop


