#cal_r - cal_r
lui $s0, 0x5432
ori $s0, $s0, 0x9843
lui $s1, 0x5843
ori $s1, $s1, 0x6543
addu $s2, $s1, $s0
subu $s3, $s1, $s0
addu $s4, $s3, $s0
addu $s5, $s0, $s4
subu $s6, $s5, $s0
subu $s7, $s0, $s6
addu $t0, $s6, $s7
addu $t1, $t0, $s7
subu $t2, $t1, $t1
addu $t3, $t2, $t2
addu $0, $t2, $t3
subu $t4, $t3, $0
addu $t5, $0, $t4
subu $0, $t5, $0
addu $t6, $0, $0
xor $s2, $s1, $s0
sub $s3, $s1, $s0
add $s4, $s3, $s0
xor $s5, $s0, $s4
sub $s6, $s5, $s0
and $s7, $s0, $s6
add $t0, $s6, $s7
or $t1, $t0, $s7
sub $t2, $t1, $t1
add $t3, $t2, $t2
and $s2, $s1, $s0
or $s3, $s1, $s0
and $s4, $s3, $s0
addu $s5, $s0, $s4
or $s6, $s5, $s0
and $s7, $s0, $s6
subu $t0, $s6, $s7
and $t1, $t0, $s7
or $t2, $t1, $t1
or $t3, $t2, $t2
sll $s2, $s1, 23
srl $s3, $s2, 12
addu $s4, $s3, $s2
sll $s5, $s0, 7
srl $s6, $s4, 2
addu $s7, $s6, $s5
sll $t0, $s6, 3
sll $t1, $t0, 4
subu $t2, $t1, $t1
addu $t3, $t2, $t2


#cal_r - cal_i
lui $s0, 0x4325
ori $s0, $s0, 0x5432
lui $s1, 0x8954
ori $s1, $s1, 0x3459
addu $s2, $s1, $s0
subu $s3, $s1, $s0
ori $s4, $s3, 0x8932
sub $s5, $s0, $s4
add $s6, $s0, $s4
addi $s7, $s5, 0x8954
ori $t0, $s6, 0x5894
addu $t1, $s7, $t0
lui $t2, 0x8594
subu $t3, $t2, $s0
lui $t4, 0x8594
add $t5, $t4, $s0
lui $t4, 0x3498
lui $t5, 0x8265
add $t6, $t4, $t5
lui $0, 0x8943
addu $t7, $s0, $0
ori $0, $0, 0x8594
addiu $t8, $0, 0x4324
addu $t9, $t8, $0
addu $s2, $s1, $s0
subu $s3, $s1, $s0
addiu $s4, $s3, 0x8932
subu $s5, $s0, $s4
addu $s6, $s0, $s4
ori $s7, $s5, 0x8954
ori $t0, $s6, 0x5894
and $t1, $s7, $t0
lui $t2, 0x8594
or $t3, $t2, $s0
lui $t4, 0x8594
addu $t5, $t4, $s0
lui $t4, 0x3498
lui $t5, 0x8265
xor $t6, $t4, $t5
lui $0, 0x8943
addu $t7, $s0, $0
addi $0, $0, 0x8594
ori $t8, $0, 0x4832
xor $t9, $t8, $0

#cal_r - load
lui $s0, 0x8694
ori $s1, $s0, 0x8754
lui $s2, 0x8954
ori $s3, $s3, 0x5437
lui $s4, 0x2349
ori $s5, $0, 0x8954
lui $s6, 0x8954
ori $s7, $0, 0x7843 
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
sw $s4, 16($0)
sw $s5, 20($0)
sw $s6, 24($0)
sw $s7, 28($0)
lw $t0, 0($0)
addu $t1, $t0, $s0
addu $t2, $t0, $t1
lw $t2, 4($0)
subu $t3, $t2, $t1
subu $t4, $t3, $t2
lw $t3, 8($0)
lw $t4, 8($0)
add $t5, $t3, $t4
add $t6, $t3, $t4
sub $t7, $t6, $t6
lw $t8, 12($t7)
ori $t9, $0, 0x0010
add $t0, $t9, $0
lw $t0, 0($t0)
add $t1, $t0, $t9
ori $t2, $0, 0x0002
and $t3, $t2, $t9
and $t4, $t1, $t0
lw $t4, 0($t3)
subu $t5, $t3, $t4
addu $t6, $t3, $t2
or $t7, $t6, $t2
lw $t8, 0($t6)
lw $t8, 0($t7)
or $t9, $t8, $t7
xor $t9, $t8, $t8
lw $t0, 0($0)
addu $t1, $t0, $s0
xor $t2, $t0, $t1
lw $t2, 4($0)
subu $t3, $t2, $t1
subu $t4, $t3, $t2
lw $t3, 8($0)
lw $t4, 8($0)
sll $t5, $t4, 4
sll $t6, $t4, 8
subu $t7, $t6, $t6
lw $t8, 12($t7)
ori $t9, $0, 0x0010
sll $t0, $t9, 5
lw $t0, 0($t0)
srl $t1, $t0, 8
ori $t2, $0, 0x0002
addu $t3, $t2, $t9
srl $t4, $t1, 12
lw $t4, 0($t3)
subu $t5, $t3, $t4
add $t6, $t3, $t2
addu $t7, $t6, $t2
lw $t8, 0($t6)
lw $t8, 0($t7)
srl $t9, $t8, 23
srl $t9, $t8, 8

#cal_r - jal
ori $s0, $0, 0x8593
ori $ra, $0, 0x5439
jal calr_jal_next1
addu $s2, $s0, $ra
calr_jal_next1:
addu $s3, $ra, $s0
add $ra, $s3, $s0
jal calr_jal_next2
calr_jal_next2:
subu $s4, $ra, $s0
sub $s5, $s4, $ra
addu $ra, $ra, $s0
jal calr_jal_next3
and $s6, $s5, $ra
or $s6, $s5, $ra
nop
calr_jal_next3:
or $s7, $s6, $ra
and $ra, $ra, $ra
jal calr_jal_next4
nop
xor $t0, $ra, $s0
calr_jal_next4:
xor $t1, $ra, $ra
xor $t2, $ra, $ra
jal calr_jal_next5
add $s2, $s0, $ra
calr_jal_next5:
and $s3, $ra, $s0
and $ra, $s3, $s0
jal calr_jal_next6
calr_jal_next6:
sll $s4, $ra, 8
sll $s5, $ra, 9
srl $ra, $ra, 5
jal calr_jal_next7
srl $s6, $ra, 13
srl $s6, $ra, 15
nop
calr_jal_next7:
srl $s7, $ra, 23
sll $ra, $ra, 24
jal calr_jal_next8
nop
or $t0, $ra, $s0
calr_jal_next8:
and $t1, $ra, $ra
sll $t2, $ra, 24

#cal_i - cal_i
lui $s0, 0x5493
ori $s1, $s0, 0x8954
ori $s2, $s1, 0x6543
ori $s3, $s1, 0x2345
lui $s4, 0x8954
ori $s5, $s4, 0x3555
ori $s6, $s4, 0x8592
ori $s6, $s6, 0x3478
ori $s7, $s6, 0x8594
lui $0, 0x5439
ori $t0, $0, 0x8954
ori $0, $t0, 0x5432
lui $t1, 0x5342
ori $t2, $0, 0x2345
lui $s0, 0x5493
addi $s1, $s0, 0x8954
addi $s2, $s1, 0x6543
addi $s3, $s1, 0x2345
lui $s4, 0x8954
addiu $s5, $s4, 0x3555
ori $s6, $s4, 0x8592
addi $s6, $s6, 0x3478
addi $s7, $s6, 0x8594
lui $0, 0x5439
ori $t0, $0, 0x8954
addiu $0, $t0, 0x5432
lui $t1, 0x5342
ori $t2, $0, 0x2345
lui $s0, 0x5493
ori $s1, $s0, 0x8954
addiu $s2, $s1, 0x6543
addi $s3, $s1, 0x2345
lui $s4, 0x8954
addiu $s5, $s4, 0x3555
addiu $s6, $s4, 0x8592
addiu $s6, $s6, 0x3478
ori $s7, $s6, 0x8594
lui $0, 0x5439
addi $t0, $0, 0x8954
ori $0, $t0, 0x5432
lui $t1, 0x5342
addiu $t2, $0, 0x2345


#cal_i - load
lui $s0, 0x8954
ori $s1, $s0, 0x7854
lui $s2, 0x2345
ori $s3, $0, 0x8954
ori $s4, $2, 0x8432
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
sw $s4, 16($0)
lw $t0, 0($0)
ori $t1, $t0, 0x8954
ori $t1, $t0, 0x2345
lw $t1, 4($0)
lw $t1, 8($0)
ori $t2, $t1, 0x4352
ori $t3, $t1, 0x5435
lw $0, 4($0)
ori $t4, $0, 0x8594
ori $t4, $0, 0x000c
lw $t5, 0($t4)
ori $t5, $t5, 0x5432
ori $t6, $t5, 0x3543
ori $t6, $0, 0x0010
nop
lw $t7, 0($t6)
ori $t8, $t7, 0x8943
lui $t9, 0x0000
lw $t9, 0($t9)
ori $t0, $t9, 0x8943
ori $t1, $t9, 0x7548
lw $t0, 0($0)
addi $t1, $t0, 0x8954
addi $t1, $t0, 0x2345
lw $t1, 4($0)
lw $t1, 8($0)
addiu $t2, $t1, 0x4352
addiu $t3, $t1, 0x5435
lw $0, 4($0)
addi $t4, $0, 0x8594
addiu $t4, $0, 0x000c
lw $t5, 0($t4)
ori $t5, $t5, 0x5432
addiu $t6, $t5, 0x3543
addi $t6, $0, 0x0010
nop
lw $t7, 0($t6)
ori $t8, $t7, 0x8943
lui $t9, 0x0000
lw $t9, 0($t9)
addiu $t0, $t9, 0x8943
addiu $t1, $t9, 0x7548

#cal_i - jal
lui $s0, 0x8954
ori $s0, $s0, 0x5432
ori $ra, $s0, 0x8943
jal cali_jal_next1
ori $s1, $ra, 0x8594
cali_jal_next1:
ori $s2, $ra, 0x2345
ori $ra, $ra, 0x8943
jal cali_jal_next2
cali_jal_next2:
ori $s3, $ra, 0x5483
ori $s4, $ra, 0x3456
lui $ra, 0x5843
jal cali_jal_next3
ori $ra, $ra, 0x5438
ori $s6, $ra, 0x8954
nop
cali_jal_next3:
ori $s6, $ra, 0x8965
ori $ra, $ra, 0x3453
jal cali_jal_next4
cali_jal_next4:
ori $ra, $ra, 0x1453
ori $s7, $ra, 0x5436
jal cali_jal_next5
addi $s1, $ra, 0x8594
cali_jal_next5:
addi $s2, $ra, 0x2345
addi $ra, $ra, 0x8943
jal cali_jal_next6
cali_jal_next6:
addiu $s3, $ra, 0x5483
addiu $s4, $ra, 0x3456
lui $ra, 0x5843
jal cali_jal_next7
addi $ra, $ra, 0x5438
addiu $s6, $ra, 0x8954
nop
cali_jal_next7:
addiu $s6, $ra, 0x8965
addi $ra, $ra, 0x3453
jal cali_jal_next8
cali_jal_next8:
addiu $ra, $ra, 0x1453
addi $s7, $ra, 0x5436

#load - load
ori $s0, $0, 0x0000
ori $s1, $0, 0x0004
ori $s2, $0, 0x0008
ori $s3, $0, 0x000c
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
lw $t0, 0($0)
lw $t1, 0($t0)
lw $t2, 4($t0)
lw $t2, 0($t2)
lw $t3, 4($t2)
lw $t4, 8($t2)
lw $0, 0($t4)
lw $t5, 8($0)
lw $t6, 0($t5)
lw $t6, 0($t6)
lw $t6, 4($t6)
lw $t6, 8($0)

#load - jal
ori $s0, $0, 0x0004
ori $s1, $0, 0x0008
la $s2, load_jal_next1
sw $s0, 4($0)
sw $s1, 0($s2)
ori $ra, $0, 0x0004
jal load_jal_next1
nop
load_jal_next1:
lw $t0, 0($ra)
la $s3, load_jal_next2
sw $s1, 0($s3)
ori $ra, $0, 0x0004
jal load_jal_next2
lw $t1, 0($ra)
load_jal_next2:
lw $t2, 0($ra)
la $s4, load_jal_next3
sw $s1, 0($s4)
ori $ra, $0, 0x0008
jal load_jal_next3
load_jal_next3:
lw $t3, -4($ra)
lw $t4, -4($ra)

#store - cal_r
lui $s0, 0x8953
ori $s1, $s0, 0x2354
ori $s2, $0, 0x0004
lui $s3, 0x8955
addu $s3, $s0, $s1
sw $s3, 0($0)
sw $s3, 4($0)
lui $s4, 0x2364
subu $s4, $s3, $s1
sw $s4, 0($0)
sw $s4, 4($0)
ori $s5, $0, 0x0008
addu $s5, $s2, $0
sw $s4, 0($s5)
sw $s4, 4($s5)
lui $s6, 0x0004
subu $s6, $s4, $s4
sw $s3, 0($s6)
sw $s3, 4($s6)
add $s3, $s0, $s1
sw $s3, 0($0)
sw $s3, 4($0)
lui $s4, 0x2364
sub $s4, $s3, $s1
sw $s4, 0($0)
sw $s4, 4($0)
ori $s5, $0, 0x0008
add $s5, $s2, $0
sw $s4, 0($s5)
sw $s4, 4($s5)
lui $s6, 0x0004
sub $s6, $s4, $s4
sw $s3, 0($s6)
sw $s3, 4($s6)
and $s3, $s0, $s1
sw $s3, 0($0)
sw $s3, 4($0)
lui $s4, 0x2364
or $s4, $s3, $s1
sw $s4, 0($0)
sw $s4, 4($0)
ori $s5, $0, 0x0008
and $s5, $s2, $0
sw $s4, 0($s5)
sw $s4, 4($s5)
lui $s6, 0x0004
or $s6, $s4, $s4
sw $s3, 0($s6)
sw $s3, 4($s6)
sll $s3, $s0, 12
sw $s3, 0($0)
sw $s3, 4($0)
lui $s4, 0x2364
sll $s4, $s3, 21   
sw $s4, 0($0)
sw $s4, 4($0)
ori $s5, $0, 0x0008
srl $s5, $s2, 12
sw $s4, 0($s5)
sw $s4, 4($s5)
lui $s6, 0x0004
srl $s6, $s4, 1
sw $s3, 0($s6)
sw $s3, 4($s6)

#store - cal_i
lui $s0, 0x8954
ori $s1, $s0, 0x5438
lui $s1, 0x7853
sw $s1, 0($0)
sw $s1, 4($0)
ori $s1, $0, 0x5345
ori $s1, $0, 0x3465
sw $s1, 0($0)
sw $s1, 4($0)
ori $s2, $0, 0x0008
ori $s2, $0, 0x0004
sw $s2, 0($s2)
sw $s2, 4($s2)
ori $s3, $0, 0x0004
lui $s3, 0x0000
sw $s0, 0($s3)
sw $s0, 4($s3)
lui $s0, 0x8954
addi $s1, $s0, 0x5438
lui $s1, 0x7853
sw $s1, 0($0)
sw $s1, 4($0)
addi $s1, $0, 0x5345
addi $s1, $0, 0x3465
sw $s1, 0($0)
sw $s1, 4($0)
addiu $s2, $0, 0x0008
addiu $s2, $0, 0x0004
sw $s2, 0($s2)
sw $s2, 4($s2)
addi $s3, $0, 0x0004
lui $s3, 0x0000
sw $s0, 0($s3)
sw $s0, 4($s3)

#store - load
ori $s0, $0, 0x0004
ori $s1, $0, 0x0008
ori $s2, $0, 0x000c
ori $s3, $0, 0x0010
sw $s0, 0($0)
sw $s1, 4($0)
sw $s2, 8($0)
sw $s3, 12($0)
ori $t0, $0, 0x8954
nop
lw $t0, 0($0)
sw $t0, 16($0)
sw $t0, 20($0)
ori $t1, $0, 0x2444
lw $t1, 0($0)
sw $t0, 0($t1)
sw $t0, 4($t1)
lw $t2, 4($0)
lw $t3, 8($0)
sw $t2, 0($t3)
sw $t3, 4($t3)
lw $t4, 12($0)
sw $t4, 4($t4)

#store - jal
lui $s0, 0x9823
ori $s0, $s0, 0x4532
ori $ra, 0x5325
jal store_jal_next1
sw $s0, 0($ra)
store_jal_next1:
sw $s0, 4($ra)
jal store_jal_next2
store_jal_next2:
sw $s0, 0($ra)
sw $s0, 8($ra)
jal store_jal_next3
sw $ra, 0($0)
sw $ra, 4($0)
nop
store_jal_next3:
sw $ra, 8($0)
jal store_jal_next4
sw $ra, 0($ra)
store_jal_next4:
sw $ra, 4($ra)

#beq - cal_r
lui $s0, 0x4583
ori $s1, $s0, 0x6542
addu $s2, $s0, $s1
beq $s2, $0, beq_calr_next1
nop
addu $s3, $s2, $s1
beq_calr_next1:
subu $s4, $s3, $s1
beq $s4, $s1, beq_calr_next2
nop
addu $s4, $s3, $s2
beq_calr_next2:
subu $s4, $s3, $s3
beq $s4, $0, beq_calr_next3
nop
lui $t0, 0x3543
beq_calr_next3:
subu $s3, $s1, $s1
nop
beq $s3, $0, beq_calr_next4
nop
lui $t1, 0x4835
beq_calr_next4:
addu $s3, $s0, $s1
addu $s4, $s0, $s1
beq $s3, $s4, beq_calr_next5
nop
lui $t2, 0x9543
beq_calr_next5:
lui $s0, 0x4583
ori $s1, $s0, 0x6542
add $s2, $s0, $s1
bne $s2, $0, beq_calr_next6
nop
add $s3, $s2, $s1
beq_calr_next6:
sub $s4, $s3, $s1
bne $s4, $s1, beq_calr_next7
nop
add $s4, $s3, $s2
beq_calr_next7:
sub $s4, $s3, $s3
beq $s4, $0, beq_calr_next8
nop
lui $t0, 0x3543
beq_calr_next8:
sub $s3, $s1, $s1
nop
bne $s3, $0, beq_calr_next9
nop
lui $t1, 0x4835
beq_calr_next9:
add $s3, $s0, $s1
add $s4, $s0, $s1
beq $s3, $s4, beq_calr_next10
nop
lui $t2, 0x9543
beq_calr_next10:
lui $s0, 0x4583
ori $s1, $s0, 0x6542
and $s2, $s0, $s1
bne $s2, $0, beq_calr_next11
nop
add $s3, $s2, $s1
beq_calr_next11:
or $s4, $s3, $s1
beq $s4, $s1, beq_calr_next12
nop
and $s4, $s3, $s2
beq_calr_next12:
xor $s4, $s3, $s3
beq $s4, $0, beq_calr_next13
nop
lui $t0, 0x3543
beq_calr_next13:
xor $s3, $s1, $s1
nop
beq $s3, $0, beq_calr_next14
nop
lui $t1, 0x4835
beq_calr_next14:
and $s3, $s0, $s1
and $s4, $s0, $s1
bne $s3, $s4, beq_calr_next15
nop
lui $t2, 0x9543
beq_calr_next15:
lui $s0, 0x4583
ori $s1, $s0, 0x6542
sll $s2, $s0, 4
bne $s2, $0, beq_calr_next16
nop
sll $s3, $s2, 23
beq_calr_next16:
or $s4, $s3, $s1
beq $s4, $s1, beq_calr_next17
nop
and $s4, $s3, $s2
beq_calr_next17:
sll $s4, $s3, 23
beq $s4, $0, beq_calr_next18
nop
lui $t0, 0x3543
beq_calr_next18:
sll $s3, $s1, 21
sll $s4, $s1, 21
nop
beq $s3, $s4, beq_calr_next19
nop
lui $t1, 0x4835
sll $s4, $s0, 14
beq_calr_next19:
sll $s3, $s0, 13
srl $s4, $s0, 14
bne $s3, $s4, beq_calr_next20
nop
lui $t2, 0x9543
beq_calr_next20:

#beq - cal_i
lui $s0, 0x5342
ori $s1, $s0, 0x5432
ori $s2, $s0, 0x5432
bne $s1, $s2, beq_cali_next1
nop
lui $s0, 0x4533
beq_cali_next1:
addi $s2, $s0, 0x5432
addi $s3, $s0, 0x5432
beq $s2, $s3, beq_cali_next2
nop
lui $s2, 0x5432
beq_cali_next2:
lui $s4, 0x9543
nop
beq $s4, $0, beq_cali_next3
nop
lui $s0, 0x5432
beq_cali_next3:
lui $s0, 0x5342
addiu $s1, $s0, 0x5432
addiu $s2, $s0, 0x5432
bne $s1, $s2, beq_cali_next4
nop
lui $s0, 0x4533
beq_cali_next4:
lui $s2, 0x5432
lui $s3, 0x5432
bne $s2, $s3, beq_cali_next5
nop
lui $s2, 0x5432
beq_cali_next5:
lui $s4, 0x9543
nop
bne $s4, $0, beq_cali_next6
nop
lui $s0, 0x5432
beq_cali_next6:
lui $s0, 0x5342
addi $s1, $s0, 0x5432
addiu $s2, $s0, 0x5432
bne $s1, $s2, beq_cali_next7
nop
lui $s0, 0x4533
beq_cali_next7:
lui $s2, 0x5432
lui $s3, 0x5432
bne $s2, $s3, beq_cali_next8
nop
lui $s2, 0x5432
beq_cali_next8:
lui $s4, 0x9543
nop
bne $s4, $0, beq_cali_next9
nop
lui $s0, 0x5432
beq_cali_next9:

#beq - load
lui $s0, 0x8753
ori $s1, $s0, 0x8543
sw $s0, 0($0)
sw $s1, 4($0)
lw $s2, 0($0)
beq $s2, $0, beq_load_next1
nop
lui $t0, 0x8594
beq_load_next1:
lw $s3, 0($0)
nop
bne $s3, $0, beq_load_next2
nop
lui $t2, 0x8954
beq_load_next2:
lw $s4, 0($0)
lw $s5, 0($0)
beq $s4, $s5, beq_load_next3
nop
lui $t3, 0x8453
beq_load_next3:
lui $s7, 0x8753
lw $s6, 0($0)
lw $s7, 4($0)
bne $s6, $s7, beq_load_next4
nop
lui $t4, 0x8754
beq_load_next4:
lui $s0, 0x8753
ori $s1, $s0, 0x8543
sw $s0, 0($0)
sw $s1, 4($0)
lw $s2, 0($0)
beq $s2, $0, beq_load_next5
nop
lui $t0, 0x8594
beq_load_next5:
lw $s3, 0($0)
nop
bne $s3, $0, beq_load_next6
nop
lui $t2, 0x8954
beq_load_next6:
lw $s4, 0($0)
lw $s5, 0($0)
beq $s4, $s5, beq_load_next7
nop
lui $t3, 0x8453
beq_load_next7:
lui $s7, 0x8753
lw $s6, 0($0)
lw $s7, 4($0)
bne $s6, $s7, beq_load_next8
nop
lui $t4, 0x8754
beq_load_next8:

#beq - jal
lui $s0, 0x8754
addu $ra, $0, $0
jal beq_jal_next1
nop
beq_jal_next1:
beq $ra, $0, beq_jal_next2
nop
lui $t0, 0x4532
beq_jal_next2:

#jr - cal_r
la $s0, jr_calr_next1
la $s1, jr_calr_next2
addu $t0, $s0, $0
jr $t0
nop
jr_calr_next1:
addu $t1, $s1, $0
nop
jr $t1
nop
jr_calr_next2:


#jr - load
ori $s0, $0, 0x3020
ori $s1, $0, 0x3030
sw $s0, 0($0)
sw $s1, 4($0)
addu $s2, $0, $0
lw $s2, 0($0)
jr $s2
nop
addu $s3, $0, $0
lw $s3, 4($0)
nop
jr $s3
nop

#jr - jal
la $s3, jr_jal_next2
lui $s0, 0x8754
addu $ra, $0, $0
jal jr_jal_next1
nop
jr_jal_next1:
jr $s3
nop
lui $t0, 0x4532
jr_jal_next2:

