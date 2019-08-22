###############  mthi ###############
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
######### mthi-calr #########
addu $t0, $s0, $s1
mthi $t0
mfhi $t0
subu $t0, $s0, $s6
mthi $t0
mfhi $t0
and $t0, $s3, $s6
mthi $t0
mfhi $t0
or $t0, $s7, $s1
mthi $t0
mfhi $t0
xor $t0, $s2, $s5
mthi $t0
mfhi $t0
nor $t0, $s7, $s5
mthi $t0
mfhi $t0
slt $t0, $s0, $s4
mthi $t0
mfhi $t0
sltu $t0, $s3, $s1
mthi $t0
mfhi $t0
sllv $t0, $s2, $s1
mthi $t0
mfhi $t0
srlv $t0, $s5, $s1
mthi $t0
mfhi $t0
srav $t0, $s0, $s7
mthi $t0
mfhi $t0
sll $t0, $s6, 4
mthi $t0
mfhi $t0
srl $t0, $s7, 23
mthi $t0
mfhi $t0
sra $t0, $s4, 15
mthi $t0
mfhi $t0
######### mthi-cali #########
addi $t0, $s6, 0x8934
mthi $t0
mfhi $t0
addiu $t0, $s3, 0x7483
mthi $t0
mfhi $t0
andi $t0, $s5, 0x2348
mthi $t0
mfhi $t0
addi $t0, $s3, 0x8934
mthi $t0
mfhi $t0
ori $t0, $s2, 0x4723
mthi $t0
mfhi $t0
xori $t0, $s5, 0x7439
mthi $t0
mfhi $t0
lui $t0, 0x7432
mthi $t0
mfhi $t0
slti $t0, $s5, 0x5432
mthi $t0
mfhi $t0
sltiu $t0, $s7, 0x4738
mthi $t0
mfhi $t0
######### mthi-jal #########
jal mthi_jal_next1
mthi $ra
mthi_jal_next1:
mfhi $t0
jal mthi_jal_next2
nop
mthi_jal_next2:
mthi $ra
mfhi $t0
######### mthi-jalr #########
la $t0, mthi_jalr_next1
la $t1, mthi_jalr_next2
jalr $t0
mthi $ra
mthi_jalr_next1:
mfhi $t2
jalr $t1
nop
mthi_jalr_next2:
mthi $s6
mfhi $t2
######### mthi-mf #########
mult $s0, $s1
mfhi $t0
mthi $t0
mflo $t0
nop
mthi $t0
mfhi $t0
mflo $t0
mthi $t0
mfhi $t0
######### mthi-load #########
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
lw $t0, 0($0)
mthi $t0
mfhi $t0
lh $t0, 8($0)
mthi $t0
mfhi $t0
lhu $t0, 4($0)
mthi $t0
mfhi $t0
lb $t0, 0($0)
mthi $t0
mfhi $t0
lbu $t0, 4($0)
mthi $t0
mfhi $t0

###############  mtlo ###############
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
######### mtlo-calr #########
addu $t0, $s0, $s1
mtlo $t0
mflo $t0
subu $t0, $s0, $s6
mtlo $t0
mflo $t0
and $t0, $s3, $s6
mtlo $t0
mflo $t0
or $t0, $s7, $s1
mtlo $t0
mflo $t0
xor $t0, $s2, $s5
mtlo $t0
mflo $t0
nor $t0, $s7, $s5
mtlo $t0
mflo $t0
slt $t0, $s0, $s4
mtlo $t0
mflo $t0
sltu $t0, $s3, $s1
mtlo $t0
mflo $t0
sllv $t0, $s2, $s1
mtlo $t0
mflo $t0
srlv $t0, $s5, $s1
mtlo $t0
mflo $t0
srav $t0, $s0, $s7
mtlo $t0
mflo $t0
sll $t0, $s6, 4
mtlo $t0
mflo $t0
srl $t0, $s7, 23
mtlo $t0
mflo $t0
sra $t0, $s4, 15
mtlo $t0
mflo $t0
######### mtlo-cali #########
addi $t0, $s6, 0x8934
mtlo $t0
mflo $t0
addiu $t0, $s3, 0x7483
mtlo $t0
mflo $t0
andi $t0, $s5, 0x2348
mtlo $t0
mflo $t0
addi $t0, $s3, 0x8934
mtlo $t0
mflo $t0
ori $t0, $s2, 0x4723
mtlo $t0
mflo $t0
xori $t0, $s5, 0x7439
mtlo $t0
mflo $t0
lui $t0, 0x7432
mtlo $t0
mflo $t0
slti $t0, $s5, 0x5432
mtlo $t0
mflo $t0
sltiu $t0, $s7, 0x4738
mtlo $t0
mflo $t0
######### mtlo-jal #########
jal mtlo_jal_next1
mtlo $ra
mtlo_jal_next1:
mflo $t0
jal mtlo_jal_next2
nop
mtlo_jal_next2:
mtlo $ra
mflo $t0
######### mtlo-jalr #########
la $t0, mtlo_jalr_next1
la $t1, mtlo_jalr_next2
jalr $t0
mtlo $ra
mtlo_jalr_next1:
mflo $t2
jalr $t1
nop
mtlo_jalr_next2:
mtlo $s6
mflo $t2
######### mtlo-mf #########
mult $s0, $s1
mflo $t0
mtlo $t0
mfhi $t0
nop
mtlo $t0
mflo $t0
mfhi $t0
mtlo $t0
mflo $t0
######### mtlo-load #########
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
lw $t0, 0($0)
mtlo $t0
mflo $t0
lh $t0, 8($0)
mtlo $t0
mflo $t0
lhu $t0, 4($0)
mtlo $t0
mflo $t0
lb $t0, 0($0)
mtlo $t0
mflo $t0
lbu $t0, 4($0)
mtlo $t0
mflo $t0
