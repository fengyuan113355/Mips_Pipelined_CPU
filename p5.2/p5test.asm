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

#cal_r - cal_i
lui $s0, 0x4325
ori $s0, $s0, 0x5432
lui $s1, 0x8954
ori $s1, $s1, 0x3459
addu $s2, $s1, $s0
subu $s3, $s1, $s0
ori $s4, $s3, 0x8932
subu $s5, $s0, $s4
addu $s6, $s0, $s4
ori $s7, $s5, 0x8954
ori $t0, $s6, 0x5894
addu $t1, $s7, $t0
lui $t2, 0x8594
subu $t3, $t2, $s0
lui $t4, 0x8594
addu $t5, $t4, $s0
lui $t4, 0x3498
lui $t5, 0x8265
addu $t6, $t4, $t5
lui $0, 0x8943
addu $t7, $s0, $0
ori $0, $0, 0x8594
ori $t8, $0, $t7
addu $t9, $t8, $0

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
addu $t5, $t3, $t4
addu $t6, $t3, $t4
subu $t7, $t6, $t6
lw $t8, 12($t7)
ori $t9, $0, 0x0010
addu $t0, $t9, $0
lw $t0, 0($t0)
addu $t1, $t0, $t9
ori $t2, $0, 0x0002
addu $t3, $t2, $t9
addu $t4, $t1, $t0
lw $t4, 0($t3)
subu $t5, $t3, $t4
addu $t6, $t3, $t2
addu $t7, $t6, $t2
lw $t8, 0($t6)
lw $t8, 0($t7)
addu $t9, $t8, $t7
subu $t9, $t8, $t8

#cal_r - jal
ori $s0, $0, 0x8593
ori $ra, $0, 0x5439
jal next1
addu $s2, $s0, $ra
next1:
addu $s3, $ra, $s0
addu $ra, $s3, $s0
jal next2
next2:
subu $s4, $ra, $s0
subu $s5, $s4, $ra
addu $ra, $ra, $s0
jal next3
addu $s6, $s5, $ra
subu $s6, $s5, $ra
nop
next3:
subu $s7, $s6, $ra
addu $ra, $ra, $ra
jal next4
nop
addu $t0, $ra, $s0
next4:
addu $t1, $ra, $ra
subu $t2, $ra, $ra

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

#cal_i - jal
lui $s0, 0x8954
ori $s0, $s0, 0x5432
ori $ra, $s0, 0x8943
jal next1
ori $s1, $ra, 0x8594
next1:
ori $s2, $ra, 0x2345
ori $ra, $ra, 0x8943
jal next2
next2:
ori $s3, $ra, 0x5483
ori $s4, $ra, 0x3456
lui $ra, 0x5843
jal next3
ori $ra, $ra, 0x5438
ori $s6, $ra, 0x8954
nop
next3:
ori $s6, $ra, 0x8965
ori $ra, $ra, 0x3453
jal next4
next4:
ori $ra, $ra, 0x1453
ori $s7, $ra, 0x5436

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
la $s2, next1
sw $s0, 4($0)
sw $s1, 0($s2)
ori $ra, $0, 0x0004
jal next1
nop
next1:
lw $t0, 0($ra)
la $s3, next2
sw $s1, 0($s3)
ori $ra, $0, 0x0004
jal next2
lw $t1, 0($ra)
next2:
lw $t2, 0($ra)
la $s4, next3
sw $s1, 0($s4)
ori $ra, $0, 0x0008
jal next3
next3:
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
jal next1
sw $s0, 0($ra)
next1:
sw $s0, 4($ra)
jal next2
next2:
sw $s0, 0($ra)
sw $s0, 8($ra)
jal next3
sw $ra, 0($0)
sw $ra, 4($0)
nop
next3:
sw $ra, 8($0)
jal next4
sw $ra, 0($ra)
next4:
sw $ra, 4($ra)

#beq - cal_r
lui $s0, 0x4583
ori $s1, $s0, 0x6542
addu $s2, $s0, $s1
beq $s2, $0, next1
nop
addu $s3, $s2, $s1
next1:
subu $s4, $s3, $s1
beq $s4, $s1, next2
nop
addu $s4, $s3, $s2
next2:
subu $s4, $s3, $s3
beq $s4, $0, next3
nop
lui $t0, 0x3543
next3:
subu $s3, $s1, $s1
nop
beq $s3, $0, next4
nop
lui $t1, 0x4835
next4:
addu $s3, $s0, $s1
addu $s4, $s0, $s1
beq $s3, $s4, next5
nop
lui $t2, 0x9543
next5:

#beq - cal_i
lui $s0, 0x5342
ori $s1, $s0, 0x5432
ori $s2, $s0, 0x5432
beq $s1, $s2, next1
nop
lui $s0, 0x4533
next1:
lui $s2, 0x5432
lui $s3, 0x5432
beq $s2, $s3, next2
nop
lui $s2, 0x5432
next2:
lui $s4, 0x9543
nop
beq $s4, $0, next3
nop
lui $s0, 0x5432
next3:

#beq - load
lui $s0, 0x8753
ori $s1, $s0, 0x8543
sw $s0, 0($0)
sw $s1, 4($0)
lw $s2, 0($0)
beq $s2, $0, next1
nop
lui $t0, 0x8594
next1:
lw $s3, 0($0)
nop
beq $s3, $0, next2
nop
lui $t2, 0x8954
next2:
lw $s4, 0($0)
lw $s5, 0($0)
beq $s4, $s5, next3
nop
lui $t3, 0x8453
next3:
lui $s7, ox8753
lw $s6, 0($0)
lw $s7, 4($0)
beq $s6, $s7, next4
nop
lui $t4, 0x8754
next4:

#beq - jal
lui $s0, 0x8754
addu $ra, $0, $0
jal next1
nop
next1:
beq $ra, $0, next2
nop
lui $t0, 0x4532
next2:

#jr - cal_r
la $s0, next1
la $s1, next2
addu $t0, $s0, $0
jr $t0
nop
next1:
addu $t1, $s1, $0
nop
jr $t1
nop
next2:

#jr - cal_i
addu $s0, $0, $0
lui $s0, 0x3010
jr $s0
nop
addu $s1, $s0, $0
ori $s1, $0, 0x3020
jr $s1
lui $t0, 0x5432
nop

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
la $s3, next2
lui $s0, 0x8754
addu $ra, $0, $0
jal next1
nop
next1:
jr $s3
nop
lui $t0, 0x4532
next2:

