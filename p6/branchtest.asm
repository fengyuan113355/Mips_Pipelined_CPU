################# beq ##################
lui $s0, 0x8943
ori $s0, $s0, 0x2345
lui $s1, 0x7893
ori $s1, $s1, 0x4323
lui $s2, 0x0032
ori $s2, $s2, 0x3454
lui $s3, 0x8372
ori $s3, $s3, 0x3454
lui $s4, 0x7489
ori $s4, $s4, 0x3234
lui $s5, 0x6432
ori $s5, $s5, 0x3453
lui $s6, 0x7923
ori $s6, $s6, 0x2346
lui $s7, 0x9834
ori $s7, $s7, 0x8922

########### beq-calr ###########
addu $t0, $s0, $s1
addu $t1, $s1, $s0
beq $t0, $t1, beq_calr_next1
nop
lui $t0, 0x5432
beq_calr_next1:
subu $t0, $s2, $s3
subu $t1, $s4, $s5
beq $t1, $t0, beq_calr_next2
nop
lui $t1, 0x5342
beq_calr_next2:
and $t0, $s2, $s7
and $t1, $s2, $s7
beq $t0, $t1, beq_calr_next3
nop
lui $t0, 0x5342
beq_calr_next3:
or $t0, $s2, $s3
or $t1, $s3, $s2
beq $t1, $t0, beq_calr_next4
nop
lui $t1, 0x5342
beq_calr_next4:
xor $t0, $s6, $s3
xor $t1, $s6, $s3
beq $t0, $t1, beq_calr_next5
nop
lui $t0, 0x5342
beq_calr_next5:
nor $t0, $s4, $s5
nor $t1, $s4, $s5
beq $t1, $t0, beq_calr_next6
nop
lui $t1, 0x5342
beq_calr_next6:
slt $t0, $s4, $s5
slt $t1, $s4, $s5
beq $t0, $t1, beq_calr_next7
nop
lui $t0, 0x5342
beq_calr_next7:
sltu $t0, $s5, $s3
sltu $t1, $s5, $s3
beq $t1, $t0, beq_calr_next8
nop
lui $t1, 0x5342
beq_calr_next8:
sll $t0, $s6, 8
sll $t1, $s6, 8
beq $t0, $t1, beq_calr_next9
nop
lui $t0, 0x5342
beq_calr_next9:
srl $t0, $s6, 5
srl $t1, $s6, 5
beq $t0, $t1, beq_calr_next10
nop
lui $t1, 0x5342
beq_calr_next10:
sra $t0, $s0, 12
sra $t1, $s0, 12
beq $t0, $t1, beq_calr_next11
nop
lui $t0, 0x5342
beq_calr_next11:
sllv $t0, $s7, $s3
sllv $t1, $s7, $s3
beq $t0, $t1, beq_calr_next12
nop
lui $t1, 0x5342
beq_calr_next12:
srlv $t0, $s3, $s5
srlv $t1, $s3, $s5
beq $t0, $t1, beq_calr_next13
nop
lui $t0, 0x5342
beq_calr_next13:
srav $t0, $s6, $s5
srav $t1, $s6, $s5
beq $t0, $t1, beq_calr_next14
nop
lui $t1, 0x5342
beq_calr_next14:

########### beq-cali ###########
lui $t0, 0x2345
addi $t0, $s0, 0x8923
addi $t1, $s0, 0x8923
beq $t0, $t1, beq_cali_next1
nop
lui $t1, 0x5432
beq_cali_next1:
addiu $t0, $s4, 0x7854
addiu $t1, $s4, 0x7854
beq $t0, $t1, beq_cali_next2
nop
lui $t0, 0x5432
beq_cali_next2:
andi $t0, $s0, 0x7489
andi $t1, $s0, 0x7489
beq $t0, $t1, beq_cali_next3
nop
lui $t1, 0x5432
beq_cali_next3:
ori $t0, $s3, 0x2345
ori $t1, $s3, 0x2345
beq $t0, $t1, beq_cali_next4
nop
lui $t0, 0x5432
beq_cali_next4:
xori $t0, $s5, 0x3453
xori $t1, $s5, 0x3453
beq $t0, $t1, beq_cali_next5
nop
lui $t1, 0x5432
beq_cali_next5:
slti $t0, $s4, 0x5374
slti $t1, $s4, 0x5374
beq $t0, $t1, beq_cali_next6
nop
lui $t0, 0x5432
beq_cali_next6:
sltiu $t0, $s2, 0x2345
sltiu $t1, $s2, 0x2345
beq $t0, $t1, beq_cali_next7
nop
lui $t1, 0x5432
beq_cali_next7:
lui $t0, 0x7234
lui $t1, 0x7234
beq $t0, $t1, beq_cali_next8
nop
lui $t0, 0x5432
beq_cali_next8:

########## beq-mf ##########
lui $t0, 0x8954
mult $s7, $s3
mfhi $t0
mfhi $t1
beq $t0, $t1, beq_mf_next1
nop
lui $t1, 0x3455
beq_mf_next1:
mult $s2, $s4
mflo $t0
mflo $t1
beq $t0, $t1, beq_mf_next2
nop
lui $t0, 0x8954
beq_mf_next2:

########## beq-load ##########
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
lw $t0, 0($0)
lw $t1, 0($0)
beq $t0, $t1, beq_load_next1
nop
lui $t0, 0x8943
beq_load_next1:
lh $t0, 8($0)
lh $t1, 8($0)
beq $t1, $t0, beq_load_next2
nop
lui $t0, 0x7832
beq_load_next2:
lhu $t0, 4($0)
lhu $t1, 4($0)
beq $t0, $t1, beq_load_next3
nop
lui $t1, 0x8942
beq_load_next3:
lb $t0, 8($0)
lb $t1, 8($0)
beq $t1, $t0, beq_load_next4
nop
lui $t0, 0x7893
beq_load_next4:
lbu $t0, 12($0)
lbu $t1, 12($0)
beq $t0, $t1, beq_load_next5
nop
lui $t0, 0x8943
beq_load_next5:


################# bne ##################
lui $s0, 0x7843
ori $s0, $s0, 0x2345
lui $s1, 0x9043
ori $s1, $s1, 0x3463
lui $s2, 0x2346
ori $s2, $s2, 0x2346
lui $s3, 0x9654
ori $s3, $s3, 0x2364
lui $s4, 0x6934
ori $s4, $s4, 0x4693
lui $s5, 0x6323
ori $s5, $s5, 0x2443
lui $s6, 0x9754
ori $s6, $s6, 0x3245
lui $s7, 0x2345
ori $s7, $s7, 0x7859

########### bne-calr ###########
addu $t0, $s0, $s1
addu $t1, $s1, $s0
bne $t0, $t1, bne_calr_next1
nop
lui $t0, 0x5432
bne_calr_next1:
subu $t0, $s2, $s3
subu $t1, $s4, $s5
bne $t1, $t0, bne_calr_next2
nop
lui $t1, 0x5342
bne_calr_next2:
and $t0, $s2, $s7
and $t1, $s2, $s7
bne $t0, $t1, bne_calr_next3
nop
lui $t0, 0x5342
bne_calr_next3:
or $t0, $s2, $s3
or $t1, $s3, $s2
bne $t1, $t0, bne_calr_next4
nop
lui $t1, 0x5342
bne_calr_next4:
xor $t0, $s6, $s3
xor $t1, $s6, $s3
bne $t0, $t1, bne_calr_next5
nop
lui $t0, 0x5342
bne_calr_next5:
nor $t0, $s4, $s5
nor $t1, $s4, $s5
bne $t1, $t0, bne_calr_next6
nop
lui $t1, 0x5342
bne_calr_next6:
slt $t0, $s4, $s5
slt $t1, $s4, $s5
bne $t0, $t1, bne_calr_next7
nop
lui $t0, 0x5342
bne_calr_next7:
sltu $t0, $s5, $s3
sltu $t1, $s5, $s3
bne $t1, $t0, bne_calr_next8
nop
lui $t1, 0x5342
bne_calr_next8:
sll $t0, $s6, 8
sll $t1, $s6, 8
bne $t0, $t1, bne_calr_next9
nop
lui $t0, 0x5342
bne_calr_next9:
srl $t0, $s6, 5
srl $t1, $s6, 5
bne $t0, $t1, bne_calr_next10
nop
lui $t1, 0x5342
bne_calr_next10:
sra $t0, $s0, 12
sra $t1, $s0, 12
bne $t0, $t1, bne_calr_next11
nop
lui $t0, 0x5342
bne_calr_next11:
sllv $t0, $s7, $s3
sllv $t1, $s7, $s3
bne $t0, $t1, bne_calr_next12
nop
lui $t1, 0x5342
bne_calr_next12:
srlv $t0, $s3, $s5
srlv $t1, $s3, $s5
bne $t0, $t1, bne_calr_next13
nop
lui $t0, 0x5342
bne_calr_next13:
srav $t0, $s6, $s5
srav $t1, $s6, $s5
bne $t0, $t1, bne_calr_next14
nop
lui $t1, 0x5342
bne_calr_next14:

########### bne-cali ###########
lui $t0, 0x2345
addi $t0, $s0, 0x8923
addi $t1, $s0, 0x8923
bne $t0, $t1, bne_cali_next1
nop
lui $t1, 0x5432
bne_cali_next1:
addiu $t0, $s4, 0x7854
addiu $t1, $s4, 0x7854
bne $t0, $t1, bne_cali_next2
nop
lui $t0, 0x5432
bne_cali_next2:
andi $t0, $s0, 0x7489
andi $t1, $s0, 0x7489
bne $t0, $t1, bne_cali_next3
nop
lui $t1, 0x5432
bne_cali_next3:
ori $t0, $s3, 0x2345
ori $t1, $s3, 0x2345
bne $t0, $t1, bne_cali_next4
nop
lui $t0, 0x5432
bne_cali_next4:
xori $t0, $s5, 0x3453
xori $t1, $s5, 0x3453
bne $t0, $t1, bne_cali_next5
nop
lui $t1, 0x5432
bne_cali_next5:
slti $t0, $s4, 0x6374
slti $t1, $s4, 0x6374
bne $t0, $t1, bne_cali_next6
nop
lui $t0, 0x5432
bne_cali_next6:
sltiu $t0, $s2, 0x2345
sltiu $t1, $s2, 0x2345
bne $t0, $t1, bne_cali_next7
nop
lui $t1, 0x5432
bne_cali_next7:
lui $t0, 0x7234
lui $t1, 0x7234
bne $t0, $t1, bne_cali_next8
nop
lui $t0, 0x5432
bne_cali_next8:

########## bne-mf ##########
lui $t0, 0x8954
mult $s7, $s3
mfhi $t0
mfhi $t1
bne $t0, $t1, bne_mf_next1
nop
lui $t1, 0x3455
bne_mf_next1:
mult $s2, $s4
mflo $t0
mflo $t1
bne $t0, $t1, bne_mf_next2
nop
lui $t0, 0x8954
bne_mf_next2:

########## bne-load ##########
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
lw $t0, 0($0)
lw $t1, 0($0)
bne $t0, $t1, bne_load_next1
nop
lui $t0, 0x8943
bne_load_next1:
lh $t0, 8($0)
lh $t1, 8($0)
bne $t1, $t0, bne_load_next2
nop
lui $t0, 0x7832
bne_load_next2:
lhu $t0, 4($0)
lhu $t1, 4($0)
bne $t0, $t1, bne_load_next3
nop
lui $t1, 0x8942
bne_load_next3:
lb $t0, 8($0)
lb $t1, 8($0)
bne $t1, $t0, bne_load_next4
nop
lui $t0, 0x7893
bne_load_next4:
lbu $t0, 12($0)
lbu $t1, 12($0)
bne $t0, $t1, bne_load_next5
nop
lui $t0, 0x8943
bne_load_next5:


################# bgtz ##################
lui $s0, 0x7843
ori $s0, $s0, 0x2345
lui $s1, 0x9043
ori $s1, $s1, 0x3463
lui $s2, 0x2346
ori $s2, $s2, 0x2346
lui $s3, 0x9654
ori $s3, $s3, 0x2364
lui $s4, 0x6934
ori $s4, $s4, 0x4693
lui $s5, 0x6323
ori $s5, $s5, 0x2443
lui $s6, 0x9754
ori $s6, $s6, 0x3245
lui $s7, 0x2345
ori $s7, $s7, 0x7859

########### bgtz-calr ###########
addu $t0, $s0, $s1
bgtz $t0, bgtz_calr_next1
nop
lui $t0, 0x5432
bgtz_calr_next1:
subu $t0, $s2, $s3
bgtz $t0, bgtz_calr_next2
nop
lui $t1, 0x5342
bgtz_calr_next2:
and $t0, $s2, $s7
bgtz $t0, bgtz_calr_next3
nop
lui $t0, 0x5342
bgtz_calr_next3:
or $t0, $s2, $s3
bgtz $t0, bgtz_calr_next4
nop
lui $t1, 0x5342
bgtz_calr_next4:
xor $t0, $s6, $s3
bgtz $t0, bgtz_calr_next5
nop
lui $t0, 0x5342
bgtz_calr_next5:
nor $t0, $s4, $s5
bgtz $t0, bgtz_calr_next6
nop
lui $t1, 0x5342
bgtz_calr_next6:
slt $t0, $s4, $s5
bgtz $t0, bgtz_calr_next7
nop
lui $t0, 0x5342
bgtz_calr_next7:
sltu $t0, $s5, $s3
bgtz $t0, bgtz_calr_next8
nop
lui $t1, 0x5342
bgtz_calr_next8:
sll $t0, $s6, 8
bgtz $t0, bgtz_calr_next9
nop
lui $t0, 0x5342
bgtz_calr_next9:
srl $t0, $s6, 5
bgtz $t0, bgtz_calr_next10
nop
lui $t1, 0x5342
bgtz_calr_next10:
sra $t0, $s0, 12
bgtz $t0, bgtz_calr_next11
nop
lui $t0, 0x5342
bgtz_calr_next11:
sllv $t0, $s7, $s3
bgtz $t0, bgtz_calr_next12
nop
lui $t1, 0x5342
bgtz_calr_next12:
srlv $t0, $s3, $s5
bgtz $t0, bgtz_calr_next13
nop
lui $t0, 0x5342
bgtz_calr_next13:
srav $t0, $s6, $s5
bgtz $t0, bgtz_calr_next14
nop
lui $t1, 0x5342
bgtz_calr_next14:

########### bgtz-cali ###########
lui $t0, 0x2345
addi $t0, $s0, 0x8923
bgtz $t0, bgtz_cali_next1
nop
lui $t1, 0x5432
bgtz_cali_next1:
addiu $t0, $s4, 0x7854
bgtz $t0, bgtz_cali_next2
nop
lui $t0, 0x5432
bgtz_cali_next2:
andi $t0, $s0, 0x7489
bgtz $t0, bgtz_cali_next3
nop
lui $t1, 0x5432
bgtz_cali_next3:
ori $t0, $s3, 0x2345
bgtz $t0, bgtz_cali_next4
nop
lui $t0, 0x5432
bgtz_cali_next4:
xori $t0, $s5, 0x3453
bgtz $t0, bgtz_cali_next5
nop
lui $t1, 0x5432
bgtz_cali_next5:
slti $t0, $s4, 0x7374
bgtz $t0, bgtz_cali_next6
nop
lui $t0, 0x5432
bgtz_cali_next6:
sltiu $t0, $s2, 0x2345
bgtz $t0, bgtz_cali_next7
nop
lui $t1, 0x5432
bgtz_cali_next7:
lui $t0, 0x7234
bgtz $t0, bgtz_cali_next8
nop
lui $t0, 0x5432
bgtz_cali_next8:

########## bgtz-mf ##########
lui $t0, 0x8954
mult $s7, $s3
mfhi $t0
bgtz $t0, bgtz_mf_next1
nop
lui $t1, 0x3455
bgtz_mf_next1:
mult $s2, $s4
mflo $t0
bgtz $t0, bgtz_mf_next2
nop
lui $t0, 0x8954
bgtz_mf_next2:

########## bgtz-load ##########
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
lw $t0, 0($0)
bgtz $t0, bgtz_load_next1
nop
lui $t0, 0x8943
bgtz_load_next1:
lh $t0, 8($0)
bgtz $t0, bgtz_load_next2
nop
lui $t0, 0x7832
bgtz_load_next2:
lhu $t0, 4($0)
bgtz $t0, bgtz_load_next3
nop
lui $t1, 0x8942
bgtz_load_next3:
lb $t0, 8($0)
bgtz $t0, bgtz_load_next4
nop
lui $t0, 0x7893
bgtz_load_next4:
lbu $t0, 12($0)
bgtz $t0, bgtz_load_next5
nop
lui $t0, 0x8943
bgtz_load_next5:


################# bltz ##################
lui $s0, 0x7584
ori $s0, $s0, 0x3245
lui $s1, 0x9654
ori $s1, $s1, 0x2347
lui $s2, 0x8754
ori $s2, $s2, 0x2345
lui $s3, 0x7584
ori $s3, $s3, 0x8795
lui $s4, 0x0745
ori $s4, $s4, 0x3456
lui $s5, 0x7954
ori $s5, $s5, 0x4563
lui $s6, 0x0754
ori $s6, $s6, 0x3456
lui $s7, 0x6843
ori $s7, $s7, 0x6543

########### bltz-calr ###########
addu $t0, $s0, $s1
bltz $t0, bltz_calr_next1
nop
lui $t0, 0x5432
bltz_calr_next1:
subu $t0, $s2, $s3
bltz $t0, bltz_calr_next2
nop
lui $t1, 0x5342
bltz_calr_next2:
and $t0, $s2, $s7
bltz $t0, bltz_calr_next3
nop
lui $t0, 0x5342
bltz_calr_next3:
or $t0, $s2, $s3
bltz $t0, bltz_calr_next4
nop
lui $t1, 0x5342
bltz_calr_next4:
xor $t0, $s6, $s3
bltz $t0, bltz_calr_next5
nop
lui $t0, 0x5342
bltz_calr_next5:
nor $t0, $s4, $s5
bltz $t0, bltz_calr_next6
nop
lui $t1, 0x5342
bltz_calr_next6:
slt $t0, $s4, $s5
bltz $t0, bltz_calr_next7
nop
lui $t0, 0x5342
bltz_calr_next7:
sltu $t0, $s5, $s3
bltz $t0, bltz_calr_next8
nop
lui $t1, 0x5342
bltz_calr_next8:
sll $t0, $s6, 8
bltz $t0, bltz_calr_next9
nop
lui $t0, 0x5342
bltz_calr_next9:
srl $t0, $s6, 5
bltz $t0, bltz_calr_next10
nop
lui $t1, 0x5342
bltz_calr_next10:
sra $t0, $s0, 12
bltz $t0, bltz_calr_next11
nop
lui $t0, 0x5342
bltz_calr_next11:
sllv $t0, $s7, $s3
bltz $t0, bltz_calr_next12
nop
lui $t1, 0x5342
bltz_calr_next12:
srlv $t0, $s3, $s5
bltz $t0, bltz_calr_next13
nop
lui $t0, 0x5342
bltz_calr_next13:
srav $t0, $s6, $s5
bltz $t0, bltz_calr_next14
nop
lui $t1, 0x5342
bltz_calr_next14:

########### bltz-cali ###########
lui $t0, 0x2345
addi $t0, $s0, 0x8923
bltz $t0, bltz_cali_next1
nop
lui $t1, 0x5432
bltz_cali_next1:
addiu $t0, $s4, 0x7854
bltz $t0, bltz_cali_next2
nop
lui $t0, 0x5432
bltz_cali_next2:
andi $t0, $s0, 0x7489
bltz $t0, bltz_cali_next3
nop
lui $t1, 0x5432
bltz_cali_next3:
ori $t0, $s3, 0x2345
bltz $t0, bltz_cali_next4
nop
lui $t0, 0x5432
bltz_cali_next4:
xori $t0, $s5, 0x3453
bltz $t0, bltz_cali_next5
nop
lui $t1, 0x5432
bltz_cali_next5:
slti $t0, $s4, 0x5374
bltz $t0, bltz_cali_next6
nop
lui $t0, 0x5432
bltz_cali_next6:
sltiu $t0, $s2, 0x2345
bltz $t0, bltz_cali_next7
nop
lui $t1, 0x5432
bltz_cali_next7:
lui $t0, 0x7234
bltz $t0, bltz_cali_next8
nop
lui $t0, 0x5432
bltz_cali_next8:

########## bltz-mf ##########
lui $t0, 0x8954
mult $s7, $s3
mfhi $t0
bltz $t0, bltz_mf_next1
nop
lui $t1, 0x3455
bltz_mf_next1:
mult $s2, $s4
mflo $t0
bltz $t0, bltz_mf_next2
nop
lui $t0, 0x8954
bltz_mf_next2:

########## bltz-load ##########
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
lw $t0, 0($0)
bltz $t0, bltz_load_next1
nop
lui $t0, 0x8943
bltz_load_next1:
lh $t0, 8($0)
bltz $t0, bltz_load_next2
nop
lui $t0, 0x7832
bltz_load_next2:
lhu $t0, 4($0)
bltz $t0, bltz_load_next3
nop
lui $t1, 0x8942
bltz_load_next3:
lb $t0, 8($0)
bltz $t0, bltz_load_next4
nop
lui $t0, 0x7893
bltz_load_next4:
lbu $t0, 12($0)
bltz $t0, bltz_load_next5
nop
lui $t0, 0x8943
bltz_load_next5:


################# bgez ##################
lui $s0, 0x6854
ori $s0, $s0, 0x2345
lui $s1, 0x9654
ori $s1, $s1, 0x2345
lui $s2, 0x6984
ori $s2, $s2, 0x9433
lui $s3, 0x2445
ori $s3, $s3, 0x9878
lui $s4, 0x3454
ori $s4, $s4, 0x2345
lui $s5, 0x0979
ori $s5, $s5, 0x6322
lui $s6, 0x9754
ori $s6, $s6, 0x6432
lui $s7, 0x8754
ori $s7, $s7, 0x5436

########### bgez-calr ###########
addu $t0, $s0, $s1
bgez $t0, bgez_calr_next1
nop
lui $t0, 0x5432
bgez_calr_next1:
subu $t0, $s2, $s3
bgez $t0, bgez_calr_next2
nop
lui $t1, 0x5342
bgez_calr_next2:
and $t0, $s2, $s7
bgez $t0, bgez_calr_next3
nop
lui $t0, 0x5342
bgez_calr_next3:
or $t0, $s2, $s3
bgez $t0, bgez_calr_next4
nop
lui $t1, 0x5342
bgez_calr_next4:
xor $t0, $s6, $s3
bgez $t0, bgez_calr_next5
nop
lui $t0, 0x5342
bgez_calr_next5:
nor $t0, $s4, $s5
bgez $t0, bgez_calr_next6
nop
lui $t1, 0x5342
bgez_calr_next6:
slt $t0, $s4, $s5
bgez $t0, bgez_calr_next7
nop
lui $t0, 0x5342
bgez_calr_next7:
sltu $t0, $s5, $s3
bgez $t0, bgez_calr_next8
nop
lui $t1, 0x5342
bgez_calr_next8:
sll $t0, $s6, 8
bgez $t0, bgez_calr_next9
nop
lui $t0, 0x5342
bgez_calr_next9:
srl $t0, $s6, 5
bgez $t0, bgez_calr_next10
nop
lui $t1, 0x5342
bgez_calr_next10:
sra $t0, $s0, 12
bgez $t0, bgez_calr_next11
nop
lui $t0, 0x5342
bgez_calr_next11:
sllv $t0, $s7, $s3
bgez $t0, bgez_calr_next12
nop
lui $t1, 0x5342
bgez_calr_next12:
srlv $t0, $s3, $s5
bgez $t0, bgez_calr_next13
nop
lui $t0, 0x5342
bgez_calr_next13:
srav $t0, $s6, $s5
bgez $t0, bgez_calr_next14
nop
lui $t1, 0x5342
bgez_calr_next14:

########### bgez-cali ###########
lui $t0, 0x2345
addi $t0, $s0, 0x8923
bgez $t0, bgez_cali_next1
nop
lui $t1, 0x5432
bgez_cali_next1:
addiu $t0, $s4, 0x7854
bgez $t0, bgez_cali_next2
nop
lui $t0, 0x5432
bgez_cali_next2:
andi $t0, $s0, 0x7489
bgez $t0, bgez_cali_next3
nop
lui $t1, 0x5432
bgez_cali_next3:
ori $t0, $s3, 0x2345
bgez $t0, bgez_cali_next4
nop
lui $t0, 0x5432
bgez_cali_next4:
xori $t0, $s5, 0x3453
bgez $t0, bgez_cali_next5
nop
lui $t1, 0x5432
bgez_cali_next5:
slti $t0, $s4, 0x7374
bgez $t0, bgez_cali_next6
nop
lui $t0, 0x5432
bgez_cali_next6:
sltiu $t0, $s2, 0x2345
bgez $t0, bgez_cali_next7
nop
lui $t1, 0x5432
bgez_cali_next7:
lui $t0, 0x7234
bgez $t0, bgez_cali_next8
nop
lui $t0, 0x5432
bgez_cali_next8:

########## bgez-mf ##########
lui $t0, 0x8954
mult $s7, $s3
mfhi $t0
bgez $t0, bgez_mf_next1
nop
lui $t1, 0x3455
bgez_mf_next1:
mult $s2, $s4
mflo $t0
bgez $t0, bgez_mf_next2
nop
lui $t0, 0x8954
bgez_mf_next2:

########## bgez-load ##########
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
lw $t0, 0($0)
bgez $t0, bgez_load_next1
nop
lui $t0, 0x8943
bgez_load_next1:
lh $t0, 8($0)
bgez $t0, bgez_load_next2
nop
lui $t0, 0x7832
bgez_load_next2:
lhu $t0, 4($0)
bgez $t0, bgez_load_next3
nop
lui $t1, 0x8942
bgez_load_next3:
lb $t0, 8($0)
bgez $t0, bgez_load_next4
nop
lui $t0, 0x7893
bgez_load_next4:
lbu $t0, 12($0)
bgez $t0, bgez_load_next5
nop
lui $t0, 0x8943
bgez_load_next5:


################# blez ##################
lui $s0, 0x2345
ori $s0, $s0, 0x6398
lui $s1, 0x8745
ori $s1, $s1, 0x9874
lui $s2, 0x2345
ori $s2, $s2, 0x0975
lui $s3, 0x6704
ori $s3, $s3, 0x2309
lui $s4, 0x9985
ori $s4, $s4, 0x6543
lui $s5, 0x9074
ori $s5, $s5, 0x2745
lui $s6, 0x0754
ori $s6, $s6, 0x8975
lui $s7, 0x2475
ori $s7, $s7, 0x5943

########### blez-calr ###########
addu $t0, $s0, $s1
blez $t0, blez_calr_next1
nop
lui $t0, 0x5432
blez_calr_next1:
subu $t0, $s2, $s3
blez $t0, blez_calr_next2
nop
lui $t1, 0x5342
blez_calr_next2:
and $t0, $s2, $s7
blez $t0, blez_calr_next3
nop
lui $t0, 0x5342
blez_calr_next3:
or $t0, $s2, $s3
blez $t0, blez_calr_next4
nop
lui $t1, 0x5342
blez_calr_next4:
xor $t0, $s6, $s3
blez $t0, blez_calr_next5
nop
lui $t0, 0x5342
blez_calr_next5:
nor $t0, $s4, $s5
blez $t0, blez_calr_next6
nop
lui $t1, 0x5342
blez_calr_next6:
slt $t0, $s4, $s5
blez $t0, blez_calr_next7
nop
lui $t0, 0x5342
blez_calr_next7:
sltu $t0, $s5, $s3
blez $t0, blez_calr_next8
nop
lui $t1, 0x5342
blez_calr_next8:
sll $t0, $s6, 8
blez $t0, blez_calr_next9
nop
lui $t0, 0x5342
blez_calr_next9:
srl $t0, $s6, 5
blez $t0, blez_calr_next10
nop
lui $t1, 0x5342
blez_calr_next10:
sra $t0, $s0, 12
blez $t0, blez_calr_next11
nop
lui $t0, 0x5342
blez_calr_next11:
sllv $t0, $s7, $s3
blez $t0, blez_calr_next12
nop
lui $t1, 0x5342
blez_calr_next12:
srlv $t0, $s3, $s5
blez $t0, blez_calr_next13
nop
lui $t0, 0x5342
blez_calr_next13:
srav $t0, $s6, $s5
blez $t0, blez_calr_next14
nop
lui $t1, 0x5342
blez_calr_next14:

########### blez-cali ###########
lui $t0, 0x2345
addi $t0, $s0, 0x8923
blez $t0, blez_cali_next1
nop
lui $t1, 0x5432
blez_cali_next1:
addiu $t0, $s4, 0x7854
blez $t0, blez_cali_next2
nop
lui $t0, 0x5432
blez_cali_next2:
andi $t0, $s0, 0x7489
blez $t0, blez_cali_next3
nop
lui $t1, 0x5432
blez_cali_next3:
ori $t0, $s3, 0x2345
blez $t0, blez_cali_next4
nop
lui $t0, 0x5432
blez_cali_next4:
xori $t0, $s5, 0x3453
blez $t0, blez_cali_next5
nop
lui $t1, 0x5432
blez_cali_next5:
slti $t0, $s4, 0x6374
blez $t0, blez_cali_next6
nop
lui $t0, 0x5432
blez_cali_next6:
sltiu $t0, $s2, 0x2345
blez $t0, blez_cali_next7
nop
lui $t1, 0x5432
blez_cali_next7:
lui $t0, 0x7234
blez $t0, blez_cali_next8
nop
lui $t0, 0x5432
blez_cali_next8:

########## blez-mf ##########
lui $t0, 0x8954
mult $s7, $s3
mfhi $t0
blez $t0, blez_mf_next1
nop
lui $t1, 0x3455
blez_mf_next1:
mult $s2, $s4
mflo $t0
blez $t0, blez_mf_next2
nop
lui $t0, 0x8954
blez_mf_next2:

########## blez-load ##########
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
lw $t0, 0($0)
blez $t0, blez_load_next1
nop
lui $t0, 0x8943
blez_load_next1:
lh $t0, 8($0)
blez $t0, blez_load_next2
nop
lui $t0, 0x7832
blez_load_next2:
lhu $t0, 4($0)
blez $t0, blez_load_next3
nop
lui $t1, 0x8942
blez_load_next3:
lb $t0, 8($0)
blez $t0, blez_load_next4
nop
lui $t0, 0x7893
blez_load_next4:
lbu $t0, 12($0)
blez $t0, blez_load_next5
nop
lui $t0, 0x8943
blez_load_next5:
