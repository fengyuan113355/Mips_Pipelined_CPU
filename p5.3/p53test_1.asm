li	$s0, 234141234
li	$s1, 234555
li	$s2, 5451313
li	$s3, 4532545
sw	$s0, 0($zero)


#需求者视角 标准供给者add, addu ,lw,

#需求者sll*******************************

add	$s0, $s0, $s1
sll	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
sll	$t0, $s0, 9
nop
lw	$s0, 0($zero)
sll	$t0, $s0,9
nop

add	$zero, $zero, $s1
sll	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
sll	$t0, $zero, 9
nop
lw	$zero, 0($zero)
sll	$t0, $zero,9
nop

add	$s0, $s0, $s1
nop
sll	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
nop
sll	$t0, $s0, 9
nop
lw	$s0, 0($zero)
nop
sll	$t0, $s0,9
nop

add	$zero, $zero, $s1
nop
sll	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
nop
sll	$t0, $zero, 9
nop
lw	$zero, 0($zero)
nop
sll	$t0, $zero,9
nop

#需求者srl*******************************

add	$s0, $s0, $s1
srl	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
srl	$t0, $s0, 9
nop
lw	$s0, 0($zero)
srl	$t0, $s0,9
nop

add	$zero, $zero, $s1
srl	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
srl	$t0, $zero, 9
nop
lw	$zero, 0($zero)
srl	$t0, $zero,9
nop

add	$s0, $s0, $s1
nop
srl	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
nop
srl	$t0, $s0, 9
nop
lw	$s0, 0($zero)
nop
srl	$t0, $s0,9
nop

add	$zero, $zero, $s1
nop
srl	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
nop
srl	$t0, $zero, 9
nop
lw	$zero, 0($zero)
nop
srl	$t0, $zero,9
nop

#需求者sra*******************************

add	$s0, $s0, $s1
sra	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
sra	$t0, $s0, 9
nop
lw	$s0, 0($zero)
sra	$t0, $s0,9
nop

add	$zero, $zero, $s1
sra	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
sra	$t0, $zero, 9
nop
lw	$zero, 0($zero)
sra	$t0, $zero,9
nop

add	$s0, $s0, $s1
nop
sra	$t0, $s0,9
nop
addi	$s0, $s0, 4771236
nop
sra	$t0, $s0, 9
nop
lw	$s0, 0($zero)
nop
sra	$t0, $s0,9
nop

add	$zero, $zero, $s1
nop
sra	$t0, $zero,9
nop
addi	$zero, $zero, 4771236
nop
sra	$t0, $zero, 9
nop
lw	$zero, 0($zero)
nop
sra	$t0, $zero,9
nop

#需求者sllv*******************************
addi	$s2, $s2, 8

add	$s0, $s0, $s1
sllv	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
sllv	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
sllv	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
sllv	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
sllv	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
sllv	$t0, $zero,$s2
nop

add	$s0, $s0, $s1
nop
sllv	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
nop
sllv	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
nop
sllv	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
nop
sllv	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
nop
sllv	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
nop
sllv	$t0, $zero,$s2
nop

#rt
add	$s0, $s0, $s1
sllv	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
sllv	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
sllv	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
sllv	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
sllv	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
sllv	$t0, $s2, $zero
nop

add	$s0, $s0, $s1
nop
sllv	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
nop
sllv	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
nop
sllv	$t0, $s2,$s0
nop

add	$zero, $zero, $s1
nop
sllv	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
nop
sllv	$t0, $s2, $zero
nop
lw	$zero, 0($zero)
nop
sllv	$t0, $s2, $zero
nop


#需求者srlv*******************************
addi	$s2, $s2, 8

add	$s0, $s0, $s1
srlv	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
srlv	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
srlv	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
srlv	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
srlv	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
srlv	$t0, $zero,$s2
nop

add	$s0, $s0, $s1
nop
srlv	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
nop
srlv	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
nop
srlv	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
nop
srlv	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
nop
srlv	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
nop
srlv	$t0, $zero,$s2
nop

#rt
add	$s0, $s0, $s1
srlv	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
srlv	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
srlv	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
srlv	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
srlv	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
srlv	$t0, $s2, $zero
nop

add	$s0, $s0, $s1
nop
srlv	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
nop
srlv	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
nop
srlv	$t0, $s2,$s0
nop

add	$zero, $zero, $s1
nop
srlv	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
nop
srlv	$t0, $s2, $zero
nop
lw	$zero, 0($zero)
nop
srlv	$t0, $s2, $zero
nop

#需求者srav*******************************
addi	$s2, $s2, 8

add	$s0, $s0, $s1
srav	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
srav	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
srav	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
srav	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
srav	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
srav	$t0, $zero,$s2
nop

add	$s0, $s0, $s1
nop
srav	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
nop
srav	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
nop
srav	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
nop
srav	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
nop
srav	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
nop
srav	$t0, $zero,$s2
nop

#rt
add	$s0, $s0, $s1
srav	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
srav	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
srav	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
srav	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
srav	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
srav	$t0, $s2, $zero
nop

add	$s0, $s0, $s1
nop
srav	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
nop
srav	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
nop
srav	$t0, $s2,$s0
nop

add	$zero, $zero, $s1
nop
srav	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
nop
srav	$t0, $s2, $zero
nop
lw	$zero, 0($zero)
nop
srav	$t0, $s2, $zero
nop


#需求者add*******************************
addi	$s2, $s2, 8

add	$s0, $s0, $s1
add	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
add	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
add	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
add	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
add	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
add	$t0, $zero,$s2
nop

add	$s0, $s0, $s1
nop
add	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
nop
add	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
nop
add	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
nop
add	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
nop
add	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
nop
add	$t0, $zero,$s2
nop

#rt
add	$s0, $s0, $s1
add	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
add	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
add	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
add	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
add	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
add	$t0, $s2, $zero
nop

add	$s0, $s0, $s1
nop
add	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
nop
add	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
nop
add	$t0, $s2,$s0
nop

add	$zero, $zero, $s1
nop
add	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
nop
add	$t0, $s2, $zero
nop
lw	$zero, 0($zero)
nop
add	$t0, $s2, $zero
nop


#需求者addu*******************************
addi	$s2, $s2, 8

addu	$s0, $s0, $s1
addu	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
addu	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
addu	$t0, $s0,$s2
nop

addu	$zero, $zero, $s1
addu	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
addu	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
addu	$t0, $zero,$s2
nop

addu	$s0, $s0, $s1
nop
addu	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
nop
addu	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
nop
addu	$t0, $s0,$s2
nop

addu	$zero, $zero, $s1
nop
addu	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
nop
addu	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
nop
addu	$t0, $zero,$s2
nop

#rt
addu	$s0, $s0, $s1
addu	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
addu	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
addu	$t0, $s0,$s2
nop

addu	$zero, $zero, $s1
addu	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
addu	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
addu	$t0, $s2, $zero
nop

addu	$s0, $s0, $s1
nop
addu	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
nop
addu	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
nop
addu	$t0, $s2,$s0
nop

addu	$zero, $zero, $s1
nop
addu	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
nop
addu	$t0, $s2, $zero
nop
lw	$zero, 0($zero)
nop
addu	$t0, $s2, $zero
nop


#需求者sub*******************************
addi	$s2, $s2, 8

add	$s0, $s0, $s1
sub	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
sub	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
sub	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
sub	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
sub	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
sub	$t0, $zero,$s2
nop

add	$s0, $s0, $s1
nop
sub	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
nop
sub	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
nop
sub	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
nop
sub	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
nop
sub	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
nop
sub	$t0, $zero,$s2
nop

#rt
add	$s0, $s0, $s1
sub	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
sub	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
sub	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
sub	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
sub	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
sub	$t0, $s2, $zero
nop

add	$s0, $s0, $s1
nop
sub	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
nop
sub	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
nop
sub	$t0, $s2,$s0
nop

add	$zero, $zero, $s1
nop
sub	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
nop
sub	$t0, $s2, $zero
nop
lw	$zero, 0($zero)
nop
sub	$t0, $s2, $zero
nop


#需求者subu*******************************
addi	$s2, $s2, 8

add	$s0, $s0, $s1
subu	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
subu	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
subu	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
subu	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
subu	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
subu	$t0, $zero,$s2
nop

add	$s0, $s0, $s1
nop
subu	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
nop
subu	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
nop
subu	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
nop
subu	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
nop
subu	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
nop
subu	$t0, $zero,$s2
nop

#rt
add	$s0, $s0, $s1
subu	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
subu	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
subu	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
subu	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
subu	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
subu	$t0, $s2, $zero
nop

add	$s0, $s0, $s1
nop
subu	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
nop
subu	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
nop
subu	$t0, $s2,$s0
nop

add	$zero, $zero, $s1
nop
subu	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
nop
subu	$t0, $s2, $zero
nop
lw	$zero, 0($zero)
nop
subu	$t0, $s2, $zero
nop


#需求者and*******************************
addi	$s2, $s2, 8

add	$s0, $s0, $s1
and	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
and	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
and	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
and	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
and	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
and	$t0, $zero,$s2
nop

add	$s0, $s0, $s1
nop
and	$t0, $s0,$s2
nop
addi	$s0, $s0, 4771236
nop
and	$t0, $s0, $s2
nop
lw	$s0, 0($zero)
nop
and	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
nop
and	$t0, $zero,$s2
nop
addi	$zero, $zero, 4771236
nop
and	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
nop
and	$t0, $zero,$s2
nop

#rt
add	$s0, $s0, $s1
and	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
and	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
and	$t0, $s0,$s2
nop

add	$zero, $zero, $s1
and	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
and	$t0, $zero, $s2
nop
lw	$zero, 0($zero)
and	$t0, $s2, $zero
nop

add	$s0, $s0, $s1
nop
and	$t0, $s2,$s0
nop
addi	$s0, $s0, 4771236
nop
and	$t0, $s2, $s0
nop
lw	$s0, 0($zero)
nop
and	$t0, $s2,$s0
nop

add	$zero, $zero, $s1
nop
and	$t0, $s2, $zero
nop
addi	$zero, $zero, 4771236
nop
and	$t0, $s2, $zero
nop
lw	$zero, 0($zero)
nop
and	$t0, $s2, $zero
nop
















