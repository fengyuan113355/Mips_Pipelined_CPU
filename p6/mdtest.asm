###############  mult ###############
lui $s0, 0x8943
ori $s0, $s0, 0x2345
lui $s1, 0x3543
ori $s1, $s1, 0x4322
lui $s2, 0x0032
ori $s2, $s2, 0x3454
lui $s3, 0x9343
ori $s3, $s3, 0x5432
lui $s4, 0x0234
ori $s4, $s4, 0x3453
lui $s5, 0x9842
ori $s5, $s5, 0x8954
lui $s6, 0x8345
ori $s6, $s6, 0x8922
lui $s7, 0x4322
ori $s7, $s7, 0x8943
######### mult-calr #########
addu $t0, $s0, $s1
addu $t1, $s2, $s3
mult $t0, $t1
mfhi $t0
mflo $t1
subu $t0, $s0, $s6
subu $t1, $s4, $s3
mult $t1, $t0
mfhi $t0
mflo $t1
and $t0, $s3, $s6
and $t1, $s5, $s3
mult $t0, $t1
mfhi $t0
mflo $t1
or $t0, $s7, $s1
or $t1, $s2, $s6
mult $t1, $t0
mfhi $t0
mflo $t1
xor $t0, $s2, $s5
xor $t1, $s3, $s6
mult $t0, $t1
mfhi $t0
mflo $t1
nor $t0, $s7, $s5
nor $t1, $s2, $s4
mult $t1, $t0
mfhi $t0
mflo $t1
slt $t0, $s0, $s4
slt $t1, $s6, $s3
mult $t0, $t1
mfhi $t0
mflo $t1
sltu $t0, $s3, $s1
sltu $t1, $s2, $s4
mult $t1, $t0
mfhi $t0
mflo $t1
sllv $t0, $s2, $s1
sllv $t1, $s2, $s6
mult $t0, $t1
mfhi $t0
mflo $t1
srlv $t0, $s5, $s1
srlv $t1, $s2, $s6
mult $t1, $t0
mfhi $t0
mflo $t1
srav $t0, $s0, $s7
srav $t1, $s6, $s3
mult $t0, $t1
mfhi $t0
mflo $t0
sll $t0, $s6, 4
sll $t1, $s3, 8
mult $t1, $t0
mfhi $t0
mflo $t1
srl $t0, $s7, 23
srl $t1, $s6, 12
mult $t0, $t1
mfhi $t0
mflo $t1
sra $t0, $s4, 15
sra $t1, $s2, 25
mult $t1, $t0
mfhi $t0
mflo $t1
######### mult-cali #########
addi $t0, $s6, 0x8934
addi $t1, $s3, 0x6543
mult $t0, $t1
mfhi $t0
mflo $t1
addiu $t0, $s3, 0x7483
addiu $t1, $s7, 0x2389
mult $t1, $t0
mfhi $t0
mflo $t1
andi $t0, $s5, 0x2348
andi $t1, $s2, 0x5683
mult $t0, $t1
mfhi $t0
mflo $t1
addi $t0, $s3, 0x8934
addi $t1, $s7, 0x6543
mult $t1, $t0
mfhi $t0
mflo $t1
ori $t0, $s2, 0x4723
ori $t1, $s4, 0x5432
mult $t0, $t1
mfhi $t0
mflo $t1
xori $t0, $s5, 0x7439
xori $t1, $s4, 0x4837
mult $t1, $t0
mfhi $t0
mflo $t1
lui $t0, 0x7432
lui $t1, 0x9034
mult $t0, $t1
mfhi $t0
mflo $t1
slti $t0, $s5, 0x5432
slti $t1, $s2, 0x5430
mult $t1, $t0
mfhi $t0
mflo $t1
sltiu $t0, $s7, 0x4738
sltiu $t1, $s4, 0x6234
mult $t0, $t1
mfhi $t0
mflo $t1
######### mult-jal #########
jal mult_jal_next1
mult $s0, $ra
mult_jal_next1:
mfhi $t0
mflo $t1
jal mult_jal_next2
nop
mult_jal_next2:
mult $ra, $s1
mfhi $t0
mflo $t1
######### mult-jalr #########
la $t0, mult_jalr_next1
la $t1, mult_jalr_next2
jalr $t0
mult $s5, $ra
mult_jalr_next1:
mfhi $t2
mflo $t3
jalr $t1
nop
mult_jalr_next2:
mult $ra, $s6
mfhi $t2
mflo $t3
######### mult-mf #########
mult $t2, $t3
mflo $t0
mfhi $t1
mult $t0, $t1
mfhi $t0
mfhi $t1
mult $t0, $t1
mfhi $t0
mflo $t1
######### mult-load #########
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
lw $t0, 0($0)
lw $t1, 4($0)
mult $t0, $t1
mfhi $t0
mflo $t1
lh $t0, 8($0)
lh $t1, 12($0)
mult $t1, $t0
mfhi $t0
mflo $t1
lhu $t0, 4($0)
lhu $t1, 8($0)
mult $t0, $t1
mfhi $t0
mflo $t1
lb $t0, 0($0)
lb $t1, 8($0)
mult $t1, $t0
mfhi $t0
mflo $t1
lbu $t0, 4($0)
lbu $t1, 8($0)
mult $t0, $t1
mfhi $t0
mflo $t1

mult $s4, $s5
addu $t0, $s3, $s4
ori $t1, $s3, 0x9432
lw $t2, 0($0)
mfhi $t3
subu $t0, $s4, $s2
mflo $t4
lui $t3, 0x8943
mfhi $t4
mflo $t5


###############  multu ###############
lui $s0, 0x4895
ori $s0, $s0, 0x5439
lui $s1, 0x0239
ori $s1, $s1, 0x3094
lui $s2, 0x9504
ori $s2, $s2, 0x0293
lui $s3, 0x2443
ori $s3, $s3, 0x9834
lui $s4, 0x8753
ori $s4, $s4, 0x7584
lui $s5, 0x9743
ori $s5, $s5, 0x2374
lui $s6, 0x8943
ori $s6, $s6, 0x9873
lui $s7, 0x9754
ori $s7, $s7, 0x2345
######### multu-calr #########
addu $t0, $s0, $s1
addu $t1, $s2, $s3
multu $t0, $t1
mfhi $t0
mflo $t1
subu $t0, $s0, $s3
subu $t1, $s4, $s6
multu $t1, $t0
mfhi $t0
mflo $t1
and $t0, $s3, $s6
and $t1, $s5, $s3
multu $t0, $t1
mfhi $t0
mflo $t1
or $t0, $s7, $s1
or $t1, $s2, $s6
multu $t1, $t0
mfhi $t0
mflo $t1
xor $t0, $s2, $s5
xor $t1, $s3, $s6
multu $t0, $t1
mfhi $t0
mflo $t1
nor $t0, $s7, $s5
nor $t1, $s2, $s4
multu $t1, $t0
mfhi $t0
mflo $t1
slt $t0, $s0, $s4
slt $t1, $s6, $s3
multu $t0, $t1
mfhi $t0
mflo $t1
sltu $t0, $s3, $s1
sltu $t1, $s2, $s4
multu $t1, $t0
mfhi $t0
mflo $t1
sllv $t0, $s2, $s1
sllv $t1, $s2, $s6
multu $t0, $t1
mfhi $t0
mflo $t1
srlv $t0, $s5, $s1
srlv $t1, $s2, $s6
multu $t1, $t0
mfhi $t0
mflo $t1
srav $t0, $s0, $s7
srav $t1, $s6, $s3
multu $t0, $t1
mfhi $t0
mflo $t0
sll $t0, $s6, 4
sll $t1, $s3, 8
multu $t1, $t0
mfhi $t0
mflo $t1
srl $t0, $s7, 23
srl $t1, $s6, 12
multu $t0, $t1
mfhi $t0
mflo $t1
sra $t0, $s4, 15
sra $t1, $s2, 25
multu $t1, $t0
mfhi $t0
mflo $t1
######### multu-cali #########
addi $t0, $s6, 0x8934
addi $t1, $s3, 0x6543
multu $t0, $t1
mfhi $t0
mflo $t1
addiu $t0, $s3, 0x7483
addiu $t1, $s7, 0x2389
multu $t1, $t0
mfhi $t0
mflo $t1
andi $t0, $s5, 0x2348
andi $t1, $s2, 0x5683
multu $t0, $t1
mfhi $t0
mflo $t1
addi $t0, $s3, 0x8934
addi $t1, $s7, 0x6543
multu $t1, $t0
mfhi $t0
mflo $t1
ori $t0, $s2, 0x4723
ori $t1, $s4, 0x5432
multu $t0, $t1
mfhi $t0
mflo $t1
xori $t0, $s5, 0x7439
xori $t1, $s4, 0x4837
multu $t1, $t0
mfhi $t0
mflo $t1
lui $t0, 0x7432
lui $t1, 0x9034
multu $t0, $t1
mfhi $t0
mflo $t1
slti $t0, $s5, 0x5432
slti $t1, $s2, 0x5430
multu $t1, $t0
mfhi $t0
mflo $t1
sltiu $t0, $s7, 0x4738
sltiu $t1, $s4, 0x7234
multu $t0, $t1
mfhi $t0
mflo $t1
######### multu-jal #########
jal multu_jal_next1
multu $s0, $ra
multu_jal_next1:
mfhi $t0
mflo $t1
jal multu_jal_next2
nop
multu_jal_next2:
multu $ra, $s1
mfhi $t0
mflo $t1
######### multu-jalr #########
la $t0, multu_jalr_next1
la $t1, multu_jalr_next2
jalr $t0
multu $s5, $ra
multu_jalr_next1:
mfhi $t2
mflo $t3
jalr $t1
nop
multu_jalr_next2:
multu $ra, $s6
mfhi $t2
mflo $t3
######### multu-mf #########
multu $t2, $t3
mflo $t0
mfhi $t1
multu $t0, $t1
mfhi $t0
mfhi $t1
multu $t0, $t1
mfhi $t0
mflo $t1
######### multu-load #########
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
lw $t0, 0($0)
lw $t1, 4($0)
multu $t0, $t1
mfhi $t0
mflo $t1
lh $t0, 8($0)
lh $t1, 12($0)
multu $t1, $t0
mfhi $t0
mflo $t1
lhu $t0, 4($0)
lhu $t1, 8($0)
multu $t0, $t1
mfhi $t0
mflo $t1
lb $t0, 0($0)
lb $t1, 8($0)
multu $t1, $t0
mfhi $t0
mflo $t1
lbu $t0, 4($0)
lbu $t1, 8($0)
multu $t0, $t1
mfhi $t0
mflo $t1

multu $s4, $s5
addu $t0, $s3, $s4
ori $t1, $s3, 0x9432
lw $t2, 0($0)
mfhi $t3
subu $t0, $s4, $s2
mflo $t4
lui $t3, 0x8943
mfhi $t4
mflo $t5


###############  div ###############
lui $s0, 0x9832
ori $s0, $s0, 0x5849
lui $s1, 0x2984
ori $s1, $s1, 0x2345
lui $s2, 0x9834
ori $s2, $s2, 0x2345
lui $s3, 0x4839
ori $s3, $s3, 0x0234
lui $s4, 0x5324
ori $s4, $s4, 0x5345
lui $s5, 0x8574
ori $s5, $s5, 0x2345
lui $s6, 0x9854
ori $s6, $s6, 0x3453
lui $s7, 0x3234
ori $s7, $s7, 0x7894
######### div-calr #########
addu $t0, $s0, $s1
addu $t1, $s2, $s3
div $t0, $t1
mfhi $t0
mflo $t1
subu $t0, $s0, $s3
subu $t1, $s4, $s6
div $t1, $t0
mfhi $t0
mflo $t1
and $t0, $s3, $s6
and $t1, $s5, $s3
div $t0, $t1
mfhi $t0
mflo $t1
or $t0, $s7, $s1
or $t1, $s2, $s6
div $t1, $t0
mfhi $t0
mflo $t1
xor $t0, $s2, $s5
xor $t1, $s3, $s6
div $t0, $t1
mfhi $t0
mflo $t1
nor $t0, $s7, $s5
nor $t1, $s2, $s4
div $t1, $t0
mfhi $t0
mflo $t1
slt $t0, $s0, $s4
slt $t1, $s6, $s3
div $t0, $t1
mfhi $t0
mflo $t1
sltu $t0, $s3, $s1
sltu $t1, $s2, $s4
div $t1, $t0
mfhi $t0
mflo $t1
sllv $t0, $s2, $s1
sllv $t1, $s2, $s6
div $t0, $t1
mfhi $t0
mflo $t1
srlv $t0, $s5, $s1
srlv $t1, $s2, $s6
div $t1, $t0
mfhi $t0
mflo $t1
srav $t0, $s0, $s7
srav $t1, $s6, $s3
div $t0, $t1
mfhi $t0
mflo $t0
sll $t0, $s6, 4
sll $t1, $s3, 8
div $t1, $t0
mfhi $t0
mflo $t1
srl $t0, $s7, 23
srl $t1, $s6, 12
div $t0, $t1
mfhi $t0
mflo $t1
sra $t0, $s4, 15
sra $t1, $s2, 25
div $t1, $t0
mfhi $t0
mflo $t1
######### div-cali #########
addi $t0, $s6, 0x8934
addi $t1, $s3, 0x6543
div $t0, $t1
mfhi $t0
mflo $t1
addiu $t0, $s3, 0x7483
addiu $t1, $s7, 0x2389
div $t1, $t0
mfhi $t0
mflo $t1
andi $t0, $s5, 0x2348
andi $t1, $s2, 0x5683
div $t0, $t1
mfhi $t0
mflo $t1
addi $t0, $s3, 0x8934
addi $t1, $s7, 0x6543
div $t1, $t0
mfhi $t0
mflo $t1
ori $t0, $s2, 0x4723
ori $t1, $s4, 0x5432
div $t0, $t1
mfhi $t0
mflo $t1
xori $t0, $s5, 0x7439
xori $t1, $s4, 0x4837
div $t1, $t0
mfhi $t0
mflo $t1
lui $t0, 0x7432
lui $t1, 0x9034
div $t0, $t1
mfhi $t0
mflo $t1
slti $t0, $s5, 0x5432
slti $t1, $s2, 0x5430
div $t1, $t0
mfhi $t0
mflo $t1
sltiu $t0, $s7, 0x4738
sltiu $t1, $s4, 0x5234
div $t0, $t1
mfhi $t0
mflo $t1
######### div-jal #########
jal div_jal_next1
div $s0, $ra
div_jal_next1:
mfhi $t0
mflo $t1
jal div_jal_next2
nop
div_jal_next2:
div $ra, $s1
mfhi $t0
mflo $t1
######### div-jalr #########
la $t0, div_jalr_next1
la $t1, div_jalr_next2
jalr $t0
div $s5, $ra
div_jalr_next1:
mfhi $t2
mflo $t3
jalr $t1
nop
div_jalr_next2:
div $ra, $s6
mfhi $t2
mflo $t3
######### div-mf #########
div $t2, $t3
mflo $t0
mfhi $t1
div $t0, $t1
mfhi $t0
mfhi $t1
div $t0, $t1
mfhi $t0
mflo $t1
######### div-load #########
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
lw $t0, 0($0)
lw $t1, 4($0)
div $t0, $t1
mfhi $t0
mflo $t1
lh $t0, 8($0)
lh $t1, 12($0)
div $t1, $t0
mfhi $t0
mflo $t1
lhu $t0, 4($0)
lhu $t1, 8($0)
div $t0, $t1
mfhi $t0
mflo $t1
lb $t0, 0($0)
lb $t1, 8($0)
div $t1, $t0
mfhi $t0
mflo $t1
lbu $t0, 4($0)
lbu $t1, 8($0)
div $t0, $t1
mfhi $t0
mflo $t1

div $s4, $s5
addu $t0, $s3, $s4
ori $t1, $s3, 0x9432
lw $t2, 0($0)
mfhi $t3
subu $t0, $s4, $s2
mflo $t4
lui $t3, 0x8943
mfhi $t4
mflo $t5


###############  divu ###############
lui $s0, 0x8943
ori $s0, $s0, 0x2345
lui $s1, 0x8794
ori $s1, $s1, 0x2345
lui $s2, 0x6789
ori $s2, $s2, 0x3453
lui $s3, 0x7493
ori $s3, $s3, 0x2839
lui $s4, 0x2435
ori $s4, $s4, 0x5894
lui $s5, 0x9503
ori $s5, $s5, 0x6323
lui $s6, 0x4324
ori $s6, $s6, 0x5432
lui $s7, 0x9543
ori $s7, $s7, 0x3456
######### divu-calr #########
addu $t0, $s0, $s1
addu $t1, $s2, $s3
divu $t0, $t1
mfhi $t0
mflo $t1
subu $t0, $s0, $s3
subu $t1, $s4, $s6
divu $t1, $t0
mfhi $t0
mflo $t1
and $t0, $s3, $s6
and $t1, $s5, $s3
divu $t0, $t1
mfhi $t0
mflo $t1
or $t0, $s7, $s1
or $t1, $s2, $s6
divu $t1, $t0
mfhi $t0
mflo $t1
xor $t0, $s2, $s5
xor $t1, $s3, $s6
divu $t0, $t1
mfhi $t0
mflo $t1
nor $t0, $s7, $s5
nor $t1, $s2, $s4
divu $t1, $t0
mfhi $t0
mflo $t1
slt $t0, $s0, $s4
slt $t1, $s6, $s3
divu $t0, $t1
mfhi $t0
mflo $t1
sltu $t0, $s3, $s1
sltu $t1, $s2, $s4
divu $t1, $t0
mfhi $t0
mflo $t1
sllv $t0, $s2, $s1
sllv $t1, $s2, $s6
divu $t0, $t1
mfhi $t0
mflo $t1
srlv $t0, $s5, $s1
srlv $t1, $s2, $s6
divu $t1, $t0
mfhi $t0
mflo $t1
srav $t0, $s0, $s7
srav $t1, $s6, $s3
divu $t0, $t1
mfhi $t0
mflo $t0
sll $t0, $s6, 4
sll $t1, $s3, 8
divu $t1, $t0
mfhi $t0
mflo $t1
srl $t0, $s7, 23
srl $t1, $s6, 12
divu $t0, $t1
mfhi $t0
mflo $t1
sra $t0, $s4, 15
sra $t1, $s2, 25
divu $t1, $t0
mfhi $t0
mflo $t1
######### divu-cali #########
addi $t0, $s6, 0x8934
addi $t1, $s3, 0x6543
divu $t0, $t1
mfhi $t0
mflo $t1
addiu $t0, $s3, 0x7483
addiu $t1, $s7, 0x2389
divu $t1, $t0
mfhi $t0
mflo $t1
andi $t0, $s5, 0x2348
andi $t1, $s2, 0x5683
divu $t0, $t1
mfhi $t0
mflo $t1
addi $t0, $s3, 0x8934
addi $t1, $s7, 0x6543
divu $t1, $t0
mfhi $t0
mflo $t1
ori $t0, $s2, 0x4723
ori $t1, $s4, 0x5432
divu $t0, $t1
mfhi $t0
mflo $t1
xori $t0, $s5, 0x7439
xori $t1, $s4, 0x4837
divu $t1, $t0
mfhi $t0
mflo $t1
lui $t0, 0x7432
lui $t1, 0x9034
divu $t0, $t1
mfhi $t0
mflo $t1
slti $t0, $s5, 0x5432
slti $t1, $s2, 0x5430
divu $t1, $t0
mfhi $t0
mflo $t1
sltiu $t0, $s7, 0x4738
sltiu $t1, $s4, 0x5234
divu $t0, $t1
mfhi $t0
mflo $t1
######### divu-jal #########
jal divu_jal_next1
divu $s0, $ra
divu_jal_next1:
mfhi $t0
mflo $t1
jal divu_jal_next2
nop
divu_jal_next2:
divu $ra, $s1
mfhi $t0
mflo $t1
######### divu-jalr #########
la $t0, divu_jalr_next1
la $t1, divu_jalr_next2
jalr $t0
divu $s5, $ra
divu_jalr_next1:
mfhi $t2
mflo $t3
jalr $t1
nop
divu_jalr_next2:
divu $ra, $s6
mfhi $t2
mflo $t3
######### divu-mf #########
divu $t2, $t3
mflo $t0
mfhi $t1
divu $t0, $t1
mfhi $t0
mfhi $t1
divu $t0, $t1
mfhi $t0
mflo $t1
######### divu-load #########
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
lw $t0, 0($0)
lw $t1, 4($0)
divu $t0, $t1
mfhi $t0
mflo $t1
lh $t0, 8($0)
lh $t1, 12($0)
divu $t1, $t0
mfhi $t0
mflo $t1
lhu $t0, 4($0)
lhu $t1, 8($0)
divu $t0, $t1
mfhi $t0
mflo $t1
lb $t0, 0($0)
lb $t1, 8($0)
divu $t1, $t0
mfhi $t0
mflo $t1
lbu $t0, 4($0)
lbu $t1, 8($0)
divu $t0, $t1
mfhi $t0
mflo $t1

divu $s4, $s5
addu $t0, $s3, $s4
ori $t1, $s3, 0x9432
lw $t2, 0($0)
mfhi $t3
subu $t0, $s4, $s2
mflo $t4
lui $t3, 0x8943
mfhi $t4
mflo $t5
