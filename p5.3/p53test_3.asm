li	$s0, 234141234
li	$s1, 234555
li	$s2, 5451313
li	$s3, 4532545
sw	$s0, 0($zero)


#需求者视角 标准供给者add, addu ,lw,


#需求者bgez*******************************


add	$s0, $s0, $s1
bgez	$s0,  bgez_1
li	$a0, 1
li	$a1, 2
bgez_1:
nop
addi	$s0, $s0, 4771236
bgez	$s0,  bgez_2
li	$a0, 1
li	$a1, 2
bgez_2:
nop
lw	$s0, 0($zero)
bgez	$s0,  bgez_3
li	$a0, 1
li	$a1, 2
bgez_3:
nop

add	$zero, $zero, $s1
bgez	$zero,  bgez_4
li	$a0, 1
li	$a1, 2
bgez_4:
nop
addi	$zero, $zero, 4771236
bgez	$zero,  bgez_5
li	$a0, 1
li	$a1, 2
bgez_5:
nop
lw	$zero, 0($zero)
bgez	$zero,  bgez_6
li	$a0, 1
li	$a1, 2
bgez_6:
nop

add	$s0, $s0, $s1
nop
bgez	$s0,  bgez_7
li	$a0, 1
li	$a1, 2
bgez_7:
nop
addi	$s0, $s0, 4771236
nop
bgez	$s0,  bgez_8
li	$a0, 1
li	$a1, 2
bgez_8:
nop
lw	$s0, 0($zero)
nop
bgez	$s0,  bgez_9
li	$a0, 1
li	$a1, 2
bgez_9:
nop

add	$zero, $zero, $s1
nop
bgez	$zero,  bgez_10
li	$a0, 1
li	$a1, 2
bgez_10:
nop
addi	$zero, $zero, 4771236
nop
bgez	$zero,  bgez_11
li	$a0, 1
li	$a1, 2
bgez_11:
nop
lw	$zero, 0($zero)
nop
bgez	$zero,  bgez_12
li	$a0, 1
li	$a1, 2
bgez_12:
nop

li	$s1, -1
li	$s2, 1
li	$s3, 0
bgez	$s1, bgez_13
li	$a0, 1
li	$a1, 2
bgez_13:
nop
bgez	$s2, bgez_14
li	$a0, 1
li	$a1, 2
bgez_14:
nop
bgez	$s3, bgez_15
li	$a0, 1
li	$a1, 2
bgez_15:
nop

#需求者blez*******************************


add	$s0, $s0, $s1
blez	$s0,  blez_1
li	$a0, 1
li	$a1, 2
blez_1:
nop
addi	$s0, $s0, 4771236
blez	$s0,  blez_2
li	$a0, 1
li	$a1, 2
blez_2:
nop
lw	$s0, 0($zero)
blez	$s0,  blez_3
li	$a0, 1
li	$a1, 2
blez_3:
nop

add	$zero, $zero, $s1
blez	$zero,  blez_4
li	$a0, 1
li	$a1, 2
blez_4:
nop
addi	$zero, $zero, 4771236
blez	$zero,  blez_5
li	$a0, 1
li	$a1, 2
blez_5:
nop
lw	$zero, 0($zero)
blez	$zero,  blez_6
li	$a0, 1
li	$a1, 2
blez_6:
nop

add	$s0, $s0, $s1
nop
blez	$s0,  blez_7
li	$a0, 1
li	$a1, 2
blez_7:
nop
addi	$s0, $s0, 4771236
nop
blez	$s0,  blez_8
li	$a0, 1
li	$a1, 2
blez_8:
nop
lw	$s0, 0($zero)
nop
blez	$s0,  blez_9
li	$a0, 1
li	$a1, 2
blez_9:
nop

add	$zero, $zero, $s1
nop
blez	$zero,  blez_10
li	$a0, 1
li	$a1, 2
blez_10:
nop
addi	$zero, $zero, 4771236
nop
blez	$zero,  blez_11
li	$a0, 1
li	$a1, 2
blez_11:
nop
lw	$zero, 0($zero)
nop
blez	$zero,  blez_12
li	$a0, 1
li	$a1, 2
blez_12:
nop

li	$s1, -1
li	$s2, 1
li	$s3, 0
blez	$s1, blez_13
li	$a0, 1
li	$a1, 2
blez_13:
nop
blez	$s2, blez_14
li	$a0, 1
li	$a1, 2
blez_14:
nop
blez	$s3, blez_15
li	$a0, 1
li	$a1, 2
blez_15:
nop

#需求者bgtz*******************************


add	$s0, $s0, $s1
bgtz	$s0,  bgtz_1
li	$a0, 1
li	$a1, 2
bgtz_1:
nop
addi	$s0, $s0, 4771236
bgtz	$s0,  bgtz_2
li	$a0, 1
li	$a1, 2
bgtz_2:
nop
lw	$s0, 0($zero)
bgtz	$s0,  bgtz_3
li	$a0, 1
li	$a1, 2
bgtz_3:
nop

add	$zero, $zero, $s1
bgtz	$zero,  bgtz_4
li	$a0, 1
li	$a1, 2
bgtz_4:
nop
addi	$zero, $zero, 4771236
bgtz	$zero,  bgtz_5
li	$a0, 1
li	$a1, 2
bgtz_5:
nop
lw	$zero, 0($zero)
bgtz	$zero,  bgtz_6
li	$a0, 1
li	$a1, 2
bgtz_6:
nop

add	$s0, $s0, $s1
nop
bgtz	$s0,  bgtz_7
li	$a0, 1
li	$a1, 2
bgtz_7:
nop
addi	$s0, $s0, 4771236
nop
bgtz	$s0,  bgtz_8
li	$a0, 1
li	$a1, 2
bgtz_8:
nop
lw	$s0, 0($zero)
nop
bgtz	$s0,  bgtz_9
li	$a0, 1
li	$a1, 2
bgtz_9:
nop

add	$zero, $zero, $s1
nop
bgtz	$zero,  bgtz_10
li	$a0, 1
li	$a1, 2
bgtz_10:
nop
addi	$zero, $zero, 4771236
nop
bgtz	$zero,  bgtz_11
li	$a0, 1
li	$a1, 2
bgtz_11:
nop
lw	$zero, 0($zero)
nop
bgtz	$zero,  bgtz_12
li	$a0, 1
li	$a1, 2
bgtz_12:
nop

li	$s1, -1
li	$s2, 1
li	$s3, 0
bgtz	$s1, bgtz_13
li	$a0, 1
li	$a1, 2
bgtz_13:
nop
bgtz	$s2, bgtz_14
li	$a0, 1
li	$a1, 2
bgtz_14:
nop
bgtz	$s3, bgtz_15
li	$a0, 1
li	$a1, 2
bgtz_15:
nop

#需求者bltzal*******************************


add	$s0, $s0, $s1
bltzal	$s0,  bltzal_1
li	$a0, 1
li	$a1, 2
bltzal_1:
nop
addi	$s0, $s0, 4771236
bltzal	$s0,  bltzal_2
li	$a0, 1
li	$a1, 2
bltzal_2:
nop
lw	$s0, 0($zero)
bltzal	$s0,  bltzal_3
li	$a0, 1
li	$a1, 2
bltzal_3:
nop

add	$zero, $zero, $s1
bltzal	$zero,  bltzal_4
li	$a0, 1
li	$a1, 2
bltzal_4:
nop
addi	$zero, $zero, 4771236
bltzal	$zero,  bltzal_5
li	$a0, 1
li	$a1, 2
bltzal_5:
nop
lw	$zero, 0($zero)
bltzal	$zero,  bltzal_6
li	$a0, 1
li	$a1, 2
bltzal_6:
nop

add	$s0, $s0, $s1
nop
bltzal	$s0,  bltzal_7
li	$a0, 1
li	$a1, 2
bltzal_7:
nop
addi	$s0, $s0, 4771236
nop
bltzal	$s0,  bltzal_8
li	$a0, 1
li	$a1, 2
bltzal_8:
nop
lw	$s0, 0($zero)
nop
bltzal	$s0,  bltzal_9
li	$a0, 1
li	$a1, 2
bltzal_9:
nop

add	$zero, $zero, $s1
nop
bltzal	$zero,  bltzal_10
li	$a0, 1
li	$a1, 2
bltzal_10:
nop
addi	$zero, $zero, 4771236
nop
bltzal	$zero,  bltzal_11
li	$a0, 1
li	$a1, 2
bltzal_11:
nop
lw	$zero, 0($zero)
nop
bltzal	$zero,  bltzal_12
li	$a0, 1
li	$a1, 2
bltzal_12:
nop

li	$s1, -1
li	$s2, 1
li	$s3, 0
bltzal	$s1, bltzal_13
li	$a0, 1
li	$a1, 2
bltzal_13:
nop
bltzal	$s2, bltzal_14
li	$a0, 1
li	$a1, 2
bltzal_14:
nop
bltzal	$s3, bltzal_15
li	$a0, 1
li	$a1, 2
bltzal_15:
nop

#需求者bgezal*******************************


add	$s0, $s0, $s1
bgezal	$s0,  bgezal_1
li	$a0, 1
li	$a1, 2
bgezal_1:
nop
addi	$s0, $s0, 4771236
bgezal	$s0,  bgezal_2
li	$a0, 1
li	$a1, 2
bgezal_2:
nop
lw	$s0, 0($zero)
bgezal	$s0,  bgezal_3
li	$a0, 1
li	$a1, 2
bgezal_3:
nop

add	$zero, $zero, $s1
bgezal	$zero,  bgezal_4
li	$a0, 1
li	$a1, 2
bgezal_4:
nop
addi	$zero, $zero, 4771236
bgezal	$zero,  bgezal_5
li	$a0, 1
li	$a1, 2
bgezal_5:
nop
lw	$zero, 0($zero)
bgezal	$zero,  bgezal_6
li	$a0, 1
li	$a1, 2
bgezal_6:
nop

add	$s0, $s0, $s1
nop
bgezal	$s0,  bgezal_7
li	$a0, 1
li	$a1, 2
bgezal_7:
nop
addi	$s0, $s0, 4771236
nop
bgezal	$s0,  bgezal_8
li	$a0, 1
li	$a1, 2
bgezal_8:
nop
lw	$s0, 0($zero)
nop
bgezal	$s0,  bgezal_9
li	$a0, 1
li	$a1, 2
bgezal_9:
nop

add	$zero, $zero, $s1
nop
bgezal	$zero,  bgezal_10
li	$a0, 1
li	$a1, 2
bgezal_10:
nop
addi	$zero, $zero, 4771236
nop
bgezal	$zero,  bgezal_11
li	$a0, 1
li	$a1, 2
bgezal_11:
nop
lw	$zero, 0($zero)
nop
bgezal	$zero,  bgezal_12
li	$a0, 1
li	$a1, 2
bgezal_12:
nop

li	$s1, -1
li	$s2, 1
li	$s3, 0
bgezal	$s1, bgezal_13
li	$a0, 1
li	$a1, 2
bgezal_13:
nop
bgezal	$s2, bgezal_14
li	$a0, 1
li	$a1, 2
bgezal_14:
nop
bgezal	$s3, bgezal_15
li	$a0, 1
li	$a1, 2
bgezal_15:
nop

#需求者addi*******************************

add	$s0, $s0, $s1
addi	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
addi	$t0, $s0, 9
nop
lw	$s0, 0($zero)
addi	$t0, $s0,9
nop

add	$zero, $zero, $s1
addi	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
addi	$t0, $zero, 9
nop
lw	$zero, 0($zero)
addi	$t0, $zero,9
nop

add	$s0, $s0, $s1
nop
addi	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
nop
addi	$t0, $s0, 9
nop
lw	$s0, 0($zero)
nop
addi	$t0, $s0,9
nop

add	$zero, $zero, $s1
nop
addi	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
nop
addi	$t0, $zero, 9
nop
lw	$zero, 0($zero)
nop
addi	$t0, $zero,9
nop

#需求者addiu*******************************

add	$s0, $s0, $s1
addiu	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
addiu	$t0, $s0, 9
nop
lw	$s0, 0($zero)
addiu	$t0, $s0,9
nop

add	$zero, $zero, $s1
addiu	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
addiu	$t0, $zero, 9
nop
lw	$zero, 0($zero)
addiu	$t0, $zero,9
nop

add	$s0, $s0, $s1
nop
addiu	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
nop
addiu	$t0, $s0, 9
nop
lw	$s0, 0($zero)
nop
addiu	$t0, $s0,9
nop

add	$zero, $zero, $s1
nop
addiu	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
nop
addiu	$t0, $zero, 9
nop
lw	$zero, 0($zero)
nop
addiu	$t0, $zero,9
nop

#需求者andi*******************************

add	$s0, $s0, $s1
andi	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
andi	$t0, $s0, 9
nop
lw	$s0, 0($zero)
andi	$t0, $s0,9
nop

add	$zero, $zero, $s1
andi	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
andi	$t0, $zero, 9
nop
lw	$zero, 0($zero)
andi	$t0, $zero,9
nop

add	$s0, $s0, $s1
nop
andi	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
nop
andi	$t0, $s0, 9
nop
lw	$s0, 0($zero)
nop
andi	$t0, $s0,9
nop

add	$zero, $zero, $s1
nop
andi	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
nop
andi	$t0, $zero, 9
nop
lw	$zero, 0($zero)
nop
andi	$t0, $zero,9
nop


#需求者ori*******************************

add	$s0, $s0, $s1
ori	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
ori	$t0, $s0, 9
nop
lw	$s0, 0($zero)
ori	$t0, $s0,9
nop

add	$zero, $zero, $s1
ori	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
ori	$t0, $zero, 9
nop
lw	$zero, 0($zero)
ori	$t0, $zero,9
nop

add	$s0, $s0, $s1
nop
ori	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
nop
ori	$t0, $s0, 9
nop
lw	$s0, 0($zero)
nop
ori	$t0, $s0,9
nop

add	$zero, $zero, $s1
nop
ori	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
nop
ori	$t0, $zero, 9
nop
lw	$zero, 0($zero)
nop
ori	$t0, $zero,9
nop

#需求者xori*******************************

add	$s0, $s0, $s1
xori	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
xori	$t0, $s0, 9
nop
lw	$s0, 0($zero)
xori	$t0, $s0,9
nop

add	$zero, $zero, $s1
xori	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
xori	$t0, $zero, 9
nop
lw	$zero, 0($zero)
xori	$t0, $zero,9
nop

add	$s0, $s0, $s1
nop
xori	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
nop
xori	$t0, $s0, 9
nop
lw	$s0, 0($zero)
nop
xori	$t0, $s0,9
nop

add	$zero, $zero, $s1
nop
xori	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
nop
xori	$t0, $zero, 9
nop
lw	$zero, 0($zero)
nop
xori	$t0, $zero,9
nop




