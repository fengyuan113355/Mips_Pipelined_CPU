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
#mtlo mthi
lw	$t0, 0($zero), 
mtlo	$t0
mflo	$t1
add	$t0, $t1, 1234
lw	$t0, 0($zero),
mthi	$t0
mfhi	$t1
sw	$t1,0($zero)

####
li	$t0, 0
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
#sw
sw	$a0, 0($t0)
addi	$t0, $t0, 4
sw	$a1, 0($t0)
addi	$t0, $t0, 4
sw	$a2, 0($t0)
addi	$t0, $t0, 4
#sb
sb	$a0, 0($t0)
addi	$t0, $t0, 4
sb	$a0, 1($t0)
addi	$t0, $t0, 4
sb	$a0, 2($t0)
addi	$t0, $t0, 4
sb	$a0, 3($t0)
addi	$t0, $t0, 4
sb	$a1, 0($t0)
addi	$t0, $t0, 4
sb	$a1, 1($t0)
addi	$t0, $t0, 4
sb	$a1, 2($t0)
addi	$t0, $t0, 4
sb	$a1, 3($t0)
addi	$t0, $t0, 4
sb	$a2, 0($t0)
addi	$t0, $t0, 4
sb	$a2, 1($t0)
addi	$t0, $t0, 4
sb	$a2, 2($t0)
addi	$t0, $t0, 4
sb	$a2, 3($t0)
addi	$t0, $t0, 4
#sh
sh	$a0, 0($t0)
addi	$t0, $t0, 4
sh	$a0, 2($t0)
addi	$t0, $t0, 4
sh	$a1, 0($t0)
addi	$t0, $t0, 4
sh	$a1, 2($t0)
addi	$t0, $t0, 4
sh	$a2, 0($t0)
addi	$t0, $t0, 4
sh	$a2, 2($t0)
addi	$t0, $t0, 4
#lw
lw	$t1, 0($zero)
lw	$t1, 4($zero)
lw	$t1, 8($zero)
#lb
lb	$t1, 0($zero)
lb	$t1, 1($zero)
lb	$t1, 2($zero)
lb	$t1, 3($zero)
lb	$t1, 4($zero)
lb	$t1, 5($zero)
lb	$t1, 6($zero)
lb	$t1, 7($zero)
lb	$t1, 8($zero)
lb	$t1, 9($zero)
lb	$t1, 10($zero)
lb	$t1, 11($zero)
#lbu
lbu	$t1, 0($zero)
lbu	$t1, 1($zero)
lbu	$t1, 2($zero)
lbu	$t1, 3($zero)
lbu	$t1, 4($zero)
lbu	$t1, 5($zero)
lbu	$t1, 6($zero)
lbu	$t1, 7($zero)
lbu	$t1, 8($zero)
lbu	$t1, 9($zero)
lbu	$t1, 10($zero)
lbu	$t1, 11($zero)
#lh
lh	$t1, 0($zero)
lh	$t1, 2($zero)
lh	$t1, 4($zero)
lh	$t1, 6($zero)
lh	$t1, 8($zero)
lh	$t1, 10($zero)
#lhu
lhu	$t1, 0($zero)
lhu	$t1, 2($zero)
lhu	$t1, 4($zero)
lhu	$t1, 6($zero)
lhu 	$t1, 8($zero)
lhu	$t1, 10($zero)




