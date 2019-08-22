#供给测试
#供给者mflo	标准需求者beq_rs, beq_rt, jr_rs, add_rs, add_rt, addi_rs, lw_rs, sw_rs, sw_rt,
li	$s0, 4
li	$s1, 8
li	$s2, 0x12345678
mthi	$s1
mtlo	$s2

li	$s0, 0
mflo	$s0
beq	$s2, $s0,mflo1
li	$a0, 1
li	$a1, 2
mflo1:
li	$s0, 0
mflo	$s0
beq	$s2, $s0,mflo2
li	$a0, 1
li	$a1, 2
mflo2:
jal	mflo3
nop
mflo3:addi	$s0, $ra, 20
mtlo	$s0
mflo	$s0
jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
mtlo	$s1
mflo	$s0
add	$t0, $s0, $s1
li	$s0, 0
mflo	$s0
add	$t0, $s1, $s0
li	$s0, 0
mflo	$s0
addi	$t0, $s0, 9
li	$s0, 0
mflo	$s0
lw	$t0, 0($s0)
li	$s0, 0
mflo	$s0
sw	$s1, 0($s0)
li	$s0, 0
mflo	$s0
sw	$s0, 12($zero)
#nop
li	$s0, 4
li	$s1, 8
li	$s2, 0x12345678
mthi	$s1
mtlo	$s2

li	$s0, 0
mflo	$s0
nop
beq	$s2, $s0,mflo4
li	$a0, 1
li	$a1, 2
mflo4:
li	$s0, 0
mflo	$s0
nop
beq	$s2, $s0,mflo5
li	$a0, 1
li	$a1, 2
mflo5:
jal	mflo6
nop
mflo6:addi	$s0, $ra, 20
mtlo	$s0
mflo	$s0
nop
jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
mtlo	$s1
mflo	$s0
nop
add	$t0, $s0, $s1
li	$s0, 0
mflo	$s0
nop
add	$t0, $s1, $s0
li	$s0, 0
mflo	$s0
nop
addi	$t0, $s0, 9
li	$s0, 0
mflo	$s0
lw	$t0, 0($s0)
li	$s0, 0
mflo	$s0
nop
sw	$s1, 0($s0)
li	$s0, 0
mflo	$s0
nop
sw	$s0, 12($zero)
#供给者mfhi	标准需求者beq_rs, beq_rt, jr_rs, add_rs, add_rt, addi_rs, lw_rs, sw_rs, sw_rt,
 
li	$s0, 4
li	$s1, 8
li	$s2, 0x12345678
mthi	$s1
mthi	$s2

li	$s0, 0
mfhi	$s0
beq	$s2, $s0,mfhi1
li	$a0, 1
li	$a1, 2
mfhi1:
li	$s0, 0
mfhi	$s0
beq	$s2, $s0,mfhi2
li	$a0, 1
li	$a1, 2
mfhi2:
jal	mfhi3
nop
mfhi3:addi	$s0, $ra, 20
mthi	$s0
mfhi	$s0
jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
mthi	$s1
mfhi	$s0
add	$t0, $s0, $s1
li	$s0, 0
mfhi	$s0
add	$t0, $s1, $s0
li	$s0, 0
mfhi	$s0
addi	$t0, $s0, 9
li	$s0, 0
mfhi	$s0
lw	$t0, 0($s0)
li	$s0, 0
mfhi	$s0
sw	$s1, 0($s0)
li	$s0, 0
mfhi	$s0
sw	$s0, 12($zero)
#nop
li	$s0, 4
li	$s1, 8
li	$s2, 0x12345678
mthi	$s1
mthi	$s2

li	$s0, 0
mfhi	$s0
nop
beq	$s2, $s0,mfhi4
li	$a0, 1
li	$a1, 2
mfhi4:
li	$s0, 0
mfhi	$s0
nop
beq	$s2, $s0,mfhi5
li	$a0, 1
li	$a1, 2
mfhi5:
jal	mfhi6
nop
mfhi6:addi	$s0, $ra, 20
mthi	$s0
mfhi	$s0
nop
jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
mthi	$s1
mfhi	$s0
nop
add	$t0, $s0, $s1
li	$s0, 0
mfhi	$s0
nop
add	$t0, $s1, $s0
li	$s0, 0
mfhi	$s0
nop
addi	$t0, $s0, 9
li	$s0, 0
mfhi	$s0
lw	$t0, 0($s0)
li	$s0, 0
mfhi	$s0
nop
sw	$s1, 0($s0)
li	$s0, 0
mfhi	$s0
nop
sw	$s0, 12($zero)

#mult
li	$s1, 0x12345678
li	$s2, 0x87654321
mult	$s1,$s2
add	$t0, $s1, $s2
mfhi	$t0
mflo	$t0
li	$s1, -123451
li	$s2, 1234123
mult	$s1,$s2
addi	$t0, $s1, 9
mfhi	$t0
mflo	$t0
li	$s1, 1423453
li	$s2, -5432234
mult	$s1,$s2
beq	$s1, $s1, mult1
nop
li	$a1,1
mult1:li $a2, 2
mfhi	$t0
mflo	$t0
li	$s1, -2351244
li	$s2, -5432234
mult	$s1,$s2
jal	mult2
nop
mult2:addi	$s2, $ra, 8
jr	$s2
li	$a1, 1
li	$a2, 2
li	$a3, 3
mfhi	$t0
mflo	$t0
li	$s1, 112343
li	$s2, 422234
mult	$s1,$s2
lw	$s1, 0($zero)
li	$a1, 234
li	$a2, 2341
mfhi	$t0
mflo	$t0

#multu
li	$s1, 0x12345678
li	$s2, 0x87654321
multu	$s1,$s2
add	$t0, $s1, $s2
mfhi	$t0
mflo	$t0
li	$s1, -123451
li	$s2, 1234123
multu	$s1,$s2
addi	$t0, $s1, 9
mfhi	$t0
mflo	$t0
li	$s1, 1423453
li	$s2, -5432234
multu	$s1,$s2
beq	$s1, $s1, multu1
nop
li	$a1,1
multu1:li $a2, 2
mfhi	$t0
mflo	$t0
li	$s1, -2351244
li	$s2, -5432234
multu	$s1,$s2
jal	multu2
nop
multu2:addi	$s2, $ra, 8
jr	$s2
li	$a1, 1
li	$a2, 2
li	$a3, 3
mfhi	$t0
mflo	$t0
li	$s1, 112343
li	$s2, 422234
multu	$s1,$s2
lw	$s1, 0($zero)
li	$a1, 234
li	$a2, 2341
mfhi	$t0
mflo	$t0

#div
li	$s1, 0x12345678
li	$s2, 0x87654321
div	$s1,$s2
add	$t0, $s1, $s2
mfhi	$t0
mflo	$t0
li	$s1, -123451
li	$s2, 1234123
div	$s1,$s2
addi	$t0, $s1, 9
mfhi	$t0
mflo	$t0
li	$s1, 1423453
li	$s2, -543223
div	$s1,$s2
beq	$s1, $s1, div1
nop
li	$a1,1
div1:li $a2, 2
mfhi	$t0
mflo	$t0
li	$s1, -2351244
li	$s2, -5432234
div	$s1,$s2
jal	div2
nop
div2:addi	$s2, $ra, 8
jr	$s2
li	$a1, 1
li	$a2, 2
li	$a3, 3
mfhi	$t0
mflo	$t0
li	$s1, 112343
li	$s2, 422234
div	$s1,$s2
lw	$s1, 0($zero)
li	$a1, 234
li	$a2, 2341
mfhi	$t0
mflo	$t0

#divu
li	$s1, 0x12345678
li	$s2, 0x87654321
divu	$s1,$s2
add	$t0, $s1, $s2
mfhi	$t0
mflo	$t0
li	$s1, -123451
li	$s2, 1234123
divu	$s1,$s2
addi	$t0, $s1, 9
mfhi	$t0
mflo	$t0
li	$s1, 1423453
li	$s2, -5432234
divu	$s1,$s2
beq	$s1, $s1, divu1
nop
li	$a1,1
divu1:li $a2, 2
mfhi	$t0
mflo	$t0
li	$s1, -2351244
li	$s2, -5432234
divu	$s1,$s2
jal	divu2
nop
divu2:addi	$s2, $ra, 8
jr	$s2
li	$a1, 1
li	$a2, 2
li	$a3, 3
mfhi	$t0
mflo	$t0
li	$s1, 112343
li	$s2, 422234
divu	$s1,$s2
lw	$s1, 0($zero)
li	$a1, 234
li	$a2, 2341
mfhi	$t0
mflo	$t0

#乘除功能测试
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

#mult
mult	$s2, $s3
mfhi	$t0
mflo	$t0
nop
nop
mult	$s2, $s5
mfhi	$t0
mflo	$t0
mult	$s4, $s3
mfhi	$t0
mflo	$t0
mult	$s4, $s5
mfhi	$t0
mflo	$t0
#multu
multu	$s2, $s3
mfhi	$t0
mflo	$t0
multu	$s2, $s5
mfhi	$t0
mflo	$t0
multu	$s4, $s3
mfhi	$t0
mflo	$t0
multu	$s4, $s5
mfhi	$t0
mflo	$t0
#div
div	$s7, $s3
mfhi	$t0
mflo	$t0
div	$s7, $s5
mfhi	$t0
mflo	$t0
div	$s6, $s3
mfhi	$t0
mflo	$t0
div	$s6, $s5
mfhi	$t0
mflo	$t0
#divu
divu	$s7, $s3
mfhi	$t0
mflo	$t0
divu	$s7, $s5
mfhi	$t0
mflo	$t0
divu	$s6, $s3
mfhi	$t0
mflo	$t0
divu	$s6, $s5
mfhi	$t0
mflo	$t0
nop
nop
