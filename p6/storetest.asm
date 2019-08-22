###############  sw ###############
lui $s0, 0x8943
ori $s0, $s0, 0x2345
lui $s1, 0x3543
ori $s1, $s1, 0x4322
lui $s2, 0x0032
ori $s2, $s2, 0x3454
ori $s3, $0, 0x0004
ori $s4, $0, 0x0008
ori $s5, $0, 0x0010
ori $s6, $0, 0x0014
ori $s7, $0, 0x0018
######### sw-calr #########
addu $t0, $s0, $s1
addu $t1, $s3, $s4
sw $t0, 8($t1)
subu $t0, $s0, $s2
subu $t1, $s5, $s3
sw $t0, 4($t1)
and $t0, $s1, $s2
and $t1, $s5, $s3
sw $t0, 0($t1)
or $t0, $s2, $s1
or $t1, $s5, $s6
sw $t0, 8($t1)
xor $t0, $s2, $s1
xor $t1, $s3, $s6
sw $t0, 4($t1)
slt $t0, $s0, $s2
slt $t1, $s6, $s3
sw $t0, 4($t1)
sltu $t0, $s1, $s1
sltu $t1, $s7, $s4
sw $t0, 8($t1)
sllv $t0, $s2, $s1
sllv $t1, $s4, $0
sw $t0, 4($t1)
srlv $t0, $s2, $s1
srlv $t1, $s5, $0
sw $t0, 8($t1)
srav $t0, $s0, $s1
srav $t1, $s6, $s0
sw $t0, 4($t1)
sll $t0, $s6, 4
sll $t1, $s3, 1
sw $t0, 8($t1)
srl $t0, $s1, 23
srl $t1, $s5, 2
sw $t0, 4($t1)
sra $t0, $s2, 15
sra $t1, $s5, 2
sw $t0, 8($t1)
######### sw-cali #########
addi $t0, $s2, 0x8934
addi $t1, $s5, 0x0004
sw $t0, 4($t1)
addiu $t0, $s1, 0x7483
addiu $t1, $s5, 0x0008
sw $t0, 8($t1)
andi $t0, $s2, 0x2348
andi $t1, $s4, 0x0010
sw $t0, 4($t1)
addi $t0, $s0, 0x8934
addi $t1, $s7, 0x0014
sw $t0, 8($t1)
ori $t0, $s2, 0x4723
ori $t1, $s4, 0x0004
sw $t0, 4($t1)
xori $t0, $s1, 0x7439
xori $t1, $s4, 0x0008
sw $t0, 8($t1)
lui $t0, 0x7432
lui $t1, 0x0000
sw $t0, 4($t1)
slti $t0, $s5, 0x5432
slti $t1, $s2, 0x5430
sw $t0, 8($t1)
sltiu $t0, $s1, 0x4738
sltiu $t1, $s2, 0x7034
sw $t0, 4($t1)
######### sw-mf #########
mult $s6, $s5
mflo $t0
mfhi $t1
sw $t0, 0($t1)
mfhi $t0
mfhi $t1
sw $t0, 4($t1)
mflo $t0
mflo $t1
sw $t0, 8($t1)
######### sw-load #########
sw $s5, 0($0)
sw $s6, 4($0)
sw $s7, 8($0)
sw $s4, 12($0)
lw $t0, 0($0)
lw $t1, 4($0)
sw $t0, 4($t1)
lh $t0, 8($0)
lh $t1, 12($0)
sw $t0, 8($t1)
lhu $t0, 4($0)
lhu $t1, 8($0)
sw $t0, 4($t1)
lb $t0, 0($0)
lb $t1, 8($0)
sw $t0, 8($t1)
lbu $t0, 4($0)
lbu $t1, 8($0)
sw $t0, 4($t1)


###############  sh ###############
lui $s0, 0x8943
ori $s0, $s0, 0x2345
lui $s1, 0x3543
ori $s1, $s1, 0x4322
lui $s2, 0x0032
ori $s2, $s2, 0x3454
ori $s3, $0, 0x0004
ori $s4, $0, 0x0008
ori $s5, $0, 0x0010
ori $s6, $0, 0x0014
ori $s7, $0, 0x0018
######### sh-calr #########
addu $t0, $s0, $s1
addu $t1, $s3, $s4
sh $t0, 2($t1)
subu $t0, $s0, $s2
subu $t1, $s5, $s3
sh $t0, 4($t1)
and $t0, $s1, $s2
and $t1, $s5, $s3
sh $t0, 0($t1)
or $t0, $s2, $s1
or $t1, $s5, $s6
sh $t0, 2($t1)
xor $t0, $s2, $s1
xor $t1, $s3, $s6
sh $t0, 4($t1)
slt $t0, $s0, $s2
slt $t1, $s6, $s3
sh $t0, 4($t1)
sltu $t0, $s1, $s1
sltu $t1, $s7, $s4
sh $t0, 2($t1)
sllv $t0, $s2, $s1
sllv $t1, $s4, $0
sh $t0, 4($t1)
srlv $t0, $s2, $s1
srlv $t1, $s5, $0
sh $t0, 2($t1)
srav $t0, $s0, $s1
srav $t1, $s6, $s0
sh $t0, 4($t1)
sll $t0, $s6, 4
sll $t1, $s3, 1
sh $t0, 2($t1)
srl $t0, $s1, 23
srl $t1, $s5, 2
sh $t0, 4($t1)
sra $t0, $s2, 15
sra $t1, $s5, 2
sh $t0, 2($t1)
######### sh-cali #########
addi $t0, $s2, 0x8934
addi $t1, $s5, 0x0004
sh $t0, 4($t1)
addiu $t0, $s1, 0x7483
addiu $t1, $s5, 0x0008
sh $t0, 2($t1)
andi $t0, $s2, 0x2348
andi $t1, $s4, 0x0010
sh $t0, 4($t1)
addi $t0, $s0, 0x8934
addi $t1, $s7, 0x0014
sh $t0, 2($t1)
ori $t0, $s2, 0x4723
ori $t1, $s4, 0x0004
sh $t0, 4($t1)
xori $t0, $s1, 0x7439
xori $t1, $s4, 0x0008
sh $t0, 2($t1)
lui $t0, 0x7432
lui $t1, 0x0000
sh $t0, 4($t1)
slti $t0, $s5, 0x5432
slti $t1, $s2, 0x5430
sh $t0, 2($t1)
sltiu $t0, $s1, 0x4738
sltiu $t1, $s2, 0x7034
sh $t0, 4($t1)
######### sh-mf #########
mult $s6, $s5
mflo $t0
mfhi $t1
sh $t0, 0($t1)
mfhi $t0
mfhi $t1
sh $t0, 4($t1)
mflo $t0
mflo $t1
sh $t0, 2($t1)
######### sh-load #########
sw $s5, 0($0)
sw $s6, 4($0)
sw $s7, 8($0)
sw $s4, 12($0)
lw $t0, 0($0)
lw $t1, 4($0)
sh $t1, 4($t0)
lh $t0, 8($0)
lh $t1, 12($0)
sh $t0, 2($t1)
lhu $t0, 4($0)
lhu $t1, 8($0)
sh $t0, 4($t1)
lb $t0, 0($0)
lb $t1, 8($0)
sh $t0, 2($t1)
lbu $t0, 4($0)
lbu $t1, 8($0)
sh $t0, 4($t1)


###############  sb ###############
lui $s0, 0x8943
ori $s0, $s0, 0x2345
lui $s1, 0x3543
ori $s1, $s1, 0x4322
lui $s2, 0x0032
ori $s2, $s2, 0x3454
ori $s3, $0, 0x0004
ori $s4, $0, 0x0008
ori $s5, $0, 0x0010
ori $s6, $0, 0x0014
ori $s7, $0, 0x0018
######### sb-calr #########
addu $t0, $s0, $s1
addu $t1, $s3, $s4
sb $t0, 2($t1)
subu $t0, $s0, $s2
subu $t1, $s5, $s3
sb $t0, 3($t1)
and $t0, $s1, $s2
and $t1, $s5, $s3
sb $t0, 0($t1)
or $t0, $s2, $s1
or $t1, $s5, $s6
sb $t0, 2($t1)
xor $t0, $s2, $s1
xor $t1, $s3, $s6
sb $t0, 3($t1)
slt $t0, $s0, $s2
slt $t1, $s6, $s3
sb $t0, 3($t1)
sltu $t0, $s1, $s1
sltu $t1, $s7, $s4
sb $t0, 2($t1)
sllv $t0, $s2, $s1
sllv $t1, $s4, $0
sb $t0, 3($t1)
srlv $t0, $s2, $s1
srlv $t1, $s5, $0
sb $t0, 2($t1)
srav $t0, $s0, $s1
srav $t1, $s6, $s0
sb $t0, 3($t1)
sll $t0, $s6, 4
sll $t1, $s3, 1
sb $t0, 2($t1)
srl $t0, $s1, 23
srl $t1, $s5, 2
sb $t0, 3($t1)
sra $t0, $s2, 15
sra $t1, $s5, 2
sb $t0, 2($t1)
######### sb-cali #########
addi $t0, $s2, 0x8934
addi $t1, $s5, 0x0004
sb $t0, 3($t1)
addiu $t0, $s1, 0x7483
addiu $t1, $s5, 0x0008
sb $t0, 2($t1)
andi $t0, $s2, 0x2348
andi $t1, $s4, 0x0010
sb $t0, 3($t1)
addi $t0, $s0, 0x8934
addi $t1, $s7, 0x0014
sb $t0, 2($t1)
ori $t0, $s2, 0x4723
ori $t1, $s4, 0x0004
sb $t0, 3($t1)
xori $t0, $s1, 0x7439
xori $t1, $s4, 0x0008
sb $t0, 2($t1)
lui $t0, 0x7432
lui $t1, 0x0000
sb $t0, 3($t1)
slti $t0, $s5, 0x5432
slti $t1, $s2, 0x5430
sb $t0, 2($t1)
sltiu $t0, $s1, 0x4738
sltiu $t1, $s2, 0x7034
sb $t0, 3($t1)
######### sb-mf #########
mult $s6, $s5
mflo $t0
mfhi $t1
sb $t0, 0($t1)
mfhi $t0
mfhi $t1
sb $t0, 4($t1)
mflo $t0
mflo $t1
sb $t0, 2($t1)
######### sb-load #########
sw $s3, 0($0)
sw $s4, 4($0)
sw $s7, 8($0)
sw $s4, 12($0)
lw $t0, 0($0)
lw $t1, 4($0)
sb $t0, 4($t1)
lh $t0, 8($0)
lh $t1, 12($0)
sb $t0, 2($t1)
lhu $t0, 4($0)
lhu $t1, 8($0)
sb $t0, 3($t1)
lb $t0, 0($0)
lb $t1, 8($0)
sb $t0, 2($t1)
lbu $t0, 4($0)
lbu $t1, 8($0)
sb $t0, 3($t1)
