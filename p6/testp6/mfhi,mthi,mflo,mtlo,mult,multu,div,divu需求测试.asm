#需求者分析
li	$s1, 1
li	$s2, 2
li	$s3, 3
li	$s4, -2
li	$s5, -3
li	$s6, 7
li	$s7, -7
li	$a0, 0x12345678
li	$a1, 0xa1b2c3d4
li	$a2, 0x87654321
sw	$a0, 0($t0)

#需求者mfhi	标准供给者 add, addi ,lw, jal, jalr 
li	$a0, 0x12345678
li	$a1, 0xa1b2c3d4

li	$s0, 0
add	$s0, $a0, $a1
mfhi	$s0
	
li	$s0, 0
addi	$s0, $a0, 9
mfhi	$s0

li	$s0, 0
lw	$s0,0($zero)
mfhi	$s0

li	$s0, 0
jal	mfhi1
mfhi1:addi	$t0, $ra, 12
jalr	$s0, $t0
mfhi	$s0
li	$t1,1
li	$t2,2

li	$s0, 0
jal	mfhi2
mfhi2:mfhi	$ra
li	$t1,1
li	$t2,2

li	$zero, 0
add	$zero, $a0, $a1
mfhi	$zero
	
li	$zero, 0
addi	$zero, $a0, 9
mfhi	$zero
li	$zero, 0
lw	$zero,0($zero)
mfhi	$zero

#需求者mthi	标准供给者 add, addi ,lw, jal, jalr 
li	$a0, 0x12345678
li	$a1, 0xa1b2c3d4

li	$s0, 0
add	$s0, $a0, $a1
mthi	$s0
	
li	$s0, 0
addi	$s0, $a0, 9
mthi	$s0

li	$s0, 0
lw	$s0,0($zero)
mthi	$s0

li	$s0, 0
jal	mthi1
mthi1:addi	$t0, $ra, 12
jalr	$s0, $t0
mthi	$s0
li	$t1,1
li	$t2,2

li	$s0, 0
jal	mthi2
mthi2:mthi	$ra
li	$t1,1
li	$t2,2

li	$zero, 0
add	$zero, $a0, $a1
mthi	$zero
	
li	$zero, 0
addi	$zero, $a0, 9
mthi	$zero

li	$zero, 0
lw	$zero,0($zero)
mthi	$zero

#需求者mflo	标准供给者 add, addi ,lw, jal, jalr 

li	$a0, 0x12345678
li	$a1, 0xa1b2c3d4

li	$s0, 0
add	$s0, $a0, $a1
mflo	$s0
	
li	$s0, 0
addi	$s0, $a0, 9
mflo	$s0

li	$s0, 0
lw	$s0,0($zero)
mflo	$s0

li	$s0, 0
jal	mflo1
mflo1:addi	$t0, $ra, 12
jalr	$s0, $t0
mflo	$s0
li	$t1,1
li	$t2,2

li	$s0, 0
jal	mflo2
mflo2:mflo	$ra
li	$t1,1
li	$t2,2

li	$zero, 0
add	$zero, $a0, $a1
mflo	$zero
	
li	$zero, 0
addi	$zero, $a0, 9
mflo	$zero

li	$zero, 0
lw	$zero,0($zero)
mflo	$zero

#需求者mtlo	标准供给者 add, addi ,lw, jal, jalr 
li	$a0, 0x12345678
li	$a1, 0xa1b2c3d4

li	$s0, 0
add	$s0, $a0, $a1
mtlo	$s0
	
li	$s0, 0
addi	$s0, $a0, 9
mtlo	$s0

li	$s0, 0
lw	$s0,0($zero)
mtlo	$s0

li	$s0, 0
jal	mtlo1
mtlo1:addi	$t0, $ra, 12
jalr	$s0, $t0
mtlo	$s0
li	$t1,1
li	$t2,2

li	$s0, 0
jal	mtlo2
mtlo2:mtlo	$ra
li	$t1,1
li	$t2,2

li	$zero, 0
add	$zero, $a0, $a1
mtlo	$zero
	
li	$zero, 0
addi	$zero, $a0, 9
mtlo	$zero

li	$zero, 0
lw	$zero,0($zero)
mtlo	$zero

#需求者mult	标准供给者 add, addi ,lw, jal, jalr 
li	$a0, 0x12345678
li	$a1, 0xa1b2c3d4

li	$s0, 0
add	$s0, $a0, $a1
mult	$s0, $s1
mfhi	$t0
mflo	$t0
	
li	$s0, 0
addi	$s0, $a0, 9
mult	$s0, $s1
mfhi	$t0
mflo	$t0

li	$s0, 0
lw	$s0,0($zero)
mult	$s0, $s1
mfhi	$t0
mflo	$t0

li	$s0, 0
jal	mult1
mult1:addi	$t0, $ra, 12
jalr	$s0, $t0
mult	$s0, $s1
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$s0, 0
jal	mult2
mult2:mult	$ra, $s1
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$zero, 0
add	$zero, $a0, $a1
mult	$zero, $s1
mfhi	$t0
mflo	$t0
	
li	$zero, 0
addi	$zero, $a0, 9
mult	$zero, $s1
mfhi	$t0
mflo	$t0

li	$zero, 0
lw	$zero,0($zero)
mult	$zero, $s1
mfhi	$t0
mflo	$t0

li	$a0, 0x12345678
li	$a1, 0xa1b2c3d4

li	$s0, 0
add	$s0, $a0, $a1
mult	$s1, $s0
mfhi	$t0
mflo	$t0
	
li	$s0, 0
addi	$s0, $a0, 9
mult	$s1, $s0
mfhi	$t0
mflo	$t0

li	$s0, 0
lw	$s0,0($zero)
mult	$s1, $s0
mfhi	$t0
mflo	$t0

li	$s0, 0
jal	mult3
mult3:addi	$t0, $ra, 12
jalr	$s0, $t0
mult	$s1, $s0
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$s0, 0
jal	mult4
mult4:mult	$s1, $ra
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$zero, 0
add	$zero, $a0, $a1
mult	$s1, $zero
mfhi	$t0
mflo	$t0
	
li	$zero, 0
addi	$zero, $a0, 9
mult	$s1, $zero
mfhi	$t0
mflo	$t0

li	$zero, 0
lw	$zero,0($zero)
mult	$s1, $zero
mfhi	$t0
mflo	$t0

li	$zero, 0
add	$zero, $a0, $a1
mult	$zero, $zero
mfhi	$t0
mflo	$t0
	
li	$zero, 0
addi	$zero, $a0, 9
mult	$zero, $zero
mfhi	$t0
mflo	$t0

li	$zero, 0
lw	$zero,0($zero)
mult	$zero, $zero
mfhi	$t0
mflo	$t0

#需求者multu	标准供给者 add, addi ,lw, jal, jalr 
li	$a0, 0x12345678
li	$a1, 0xa1b2c3d4

li	$s0, 0
add	$s0, $a0, $a1
multu	$s0, $s1
mfhi	$t0
mflo	$t0
	
li	$s0, 0
addi	$s0, $a0, 9
multu	$s0, $s1
mfhi	$t0
mflo	$t0

li	$s0, 0
lw	$s0,0($zero)
multu	$s0, $s1
mfhi	$t0
mflo	$t0

li	$s0, 0
jal	multu1
multu1:addi	$t0, $ra, 12
jalr	$s0, $t0
multu	$s0, $s1
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$s0, 0
jal	multu2
multu2:multu	$ra, $s1
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$zero, 0
add	$zero, $a0, $a1
multu	$zero, $s1
mfhi	$t0
mflo	$t0
	
li	$zero, 0
addi	$zero, $a0, 9
multu	$zero, $s1
mfhi	$t0
mflo	$t0

li	$zero, 0
lw	$zero,0($zero)
multu	$zero, $s1
mfhi	$t0
mflo	$t0

li	$a0, 0x12345678
li	$a1, 0xa1b2c3d4

li	$s0, 0
add	$s0, $a0, $a1
multu	$s1, $s0
mfhi	$t0
mflo	$t0
	
li	$s0, 0
addi	$s0, $a0, 9
multu	$s1, $s0
mfhi	$t0
mflo	$t0

li	$s0, 0
lw	$s0,0($zero)
multu	$s1, $s0
mfhi	$t0
mflo	$t0

li	$s0, 0
jal	multu3
multu3:addi	$t0, $ra, 12
jalr	$s0, $t0
multu	$s1, $s0
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$s0, 0
jal	multu4
multu4:multu	$s1, $ra
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$zero, 0
add	$zero, $a0, $a1
multu	$s1, $zero
mfhi	$t0
mflo	$t0
	
li	$zero, 0
addi	$zero, $a0, 9
multu	$s1, $zero
mfhi	$t0
mflo	$t0

li	$zero, 0
lw	$zero,0($zero)
multu	$s1, $zero
mfhi	$t0
mflo	$t0

li	$zero, 0
add	$zero, $a0, $a1
multu	$zero, $zero
mfhi	$t0
mflo	$t0
	
li	$zero, 0
addi	$zero, $a0, 9
multu	$zero, $zero
mfhi	$t0
mflo	$t0

li	$zero, 0
lw	$zero,0($zero)
multu	$zero, $zero
mfhi	$t0
mflo	$t0

#需求者div	标准供给者 add, addi ,lw, jal, jalr 
li	$a0, 0x12345678
li	$a1, 0xa1b2c3d4

li	$s0, 0
add	$s0, $a0, $a1
div	$s0, $s1
mfhi	$t0
mflo	$t0
	
li	$s0, 0
addi	$s0, $a0, 9
div	$s0, $s1
mfhi	$t0
mflo	$t0

li	$s0, 0
lw	$s0,0($zero)
div	$s0, $s1
mfhi	$t0
mflo	$t0

li	$s0, 0
jal	div1
div1:addi	$t0, $ra, 12
jalr	$s0, $t0
div	$s0, $s1
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$s0, 0
jal	div2
div2:div	$ra, $s1
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$zero, 0
add	$zero, $a0, $a1
div	$zero, $s1
mfhi	$t0
mflo	$t0
	
li	$zero, 0
addi	$zero, $a0, 9
div	$zero, $s1
mfhi	$t0
mflo	$t0

li	$zero, 0
lw	$zero,0($zero)
div	$zero, $s1
mfhi	$t0
mflo	$t0

li	$a0, 0x12345678
li	$a1, 0xa1b2c3d4

li	$s0, 0
add	$s0, $a0, $a1
div	$s1, $s0
mfhi	$t0
mflo	$t0
	
li	$s0, 0
addi	$s0, $a0, 9
div	$s1, $s0
mfhi	$t0
mflo	$t0

li	$s0, 0
lw	$s0,0($zero)
div	$s1, $s0
mfhi	$t0
mflo	$t0

li	$s0, 0
jal	div3
div3:addi	$t0, $ra, 12
jalr	$s0, $t0
div	$s1, $s0
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$s0, 0
jal	div4
div4:div	$s1, $ra
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$zero, 0
add	$zero, $a0, $a1
div	$s1, $zero
mfhi	$t0
mflo	$t0
	
li	$zero, 0
addi	$zero, $a0, 9
div	$s1, $zero
mfhi	$t0
mflo	$t0

li	$zero, 0
lw	$zero,0($zero)
div	$s1, $zero
mfhi	$t0
mflo	$t0

li	$zero, 0
add	$zero, $a0, $a1
div	$zero, $zero
mfhi	$t0
mflo	$t0
	
li	$zero, 0
addi	$zero, $a0, 9
div	$zero, $zero
mfhi	$t0
mflo	$t0

li	$zero, 0
lw	$zero,0($zero)
div	$zero, $zero
mfhi	$t0
mflo	$t0

#需求者divu	标准供给者 add, addi ,lw, jal, jalr 
li	$a0, 0x12345678
li	$a1, 0xa1b2c3d4

li	$s0, 0
add	$s0, $a0, $a1
divu	$s0, $s1
mfhi	$t0
mflo	$t0
	
li	$s0, 0
addi	$s0, $a0, 9
divu	$s0, $s1
mfhi	$t0
mflo	$t0

li	$s0, 0
lw	$s0,0($zero)
divu	$s0, $s1
mfhi	$t0
mflo	$t0

li	$s0, 0
jal	divu1
divu1:addi	$t0, $ra, 12
jalr	$s0, $t0
divu	$s0, $s1
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$s0, 0
jal	divu2
divu2:divu	$ra, $s1
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$zero, 0
add	$zero, $a0, $a1
divu	$zero, $s1
mfhi	$t0
mflo	$t0
	
li	$zero, 0
addi	$zero, $a0, 9
divu	$zero, $s1
mfhi	$t0
mflo	$t0

li	$zero, 0
lw	$zero,0($zero)
divu	$zero, $s1
mfhi	$t0
mflo	$t0

li	$a0, 0x12345678
li	$a1, 0xa1b2c3d4

li	$s0, 0
add	$s0, $a0, $a1
divu	$s1, $s0
mfhi	$t0
mflo	$t0
	
li	$s0, 0
addi	$s0, $a0, 9
divu	$s1, $s0
mfhi	$t0
mflo	$t0

li	$s0, 0
lw	$s0,0($zero)
divu	$s1, $s0
mfhi	$t0
mflo	$t0

li	$s0, 0
jal	divu3
divu3:addi	$t0, $ra, 12
jalr	$s0, $t0
divu	$s1, $s0
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$s0, 0
jal	divu4
divu4:divu	$s1, $ra
mfhi	$t0
mflo	$t0
li	$t1,1
li	$t2,2

li	$zero, 0
add	$zero, $a0, $a1
divu	$s1, $zero
mfhi	$t0
mflo	$t0
	
li	$zero, 0
addi	$zero, $a0, 9
divu	$s1, $zero
mfhi	$t0
mflo	$t0

li	$zero, 0
lw	$zero,0($zero)
divu	$s1, $zero
mfhi	$t0
mflo	$t0

li	$zero, 0
add	$zero, $a0, $a1
divu	$zero, $zero
mfhi	$t0
mflo	$t0
	
li	$zero, 0
addi	$zero, $a0, 9
divu	$zero, $zero
mfhi	$t0
mflo	$t0

li	$zero, 0
lw	$zero,0($zero)
divu	$zero, $zero
mfhi	$t0
mflo	$t0


