#需求者分析
li	$a0, 3
li	$a1, 9
li	$a2,12
li	$s1, 0x12345678
li	$s2, 0xffffffff
sw	$s1,12($zero)
sw	$a2, 8($zero)
sw	$s2, 0($zero)

#需求者lw 	标准供给者add, addi, lw
li	$s0, 0
add	$s0, $a0, $a1
lw	$t0, 0($s0)
li	$s0, 0
addi	$s0, $a0, 9
lw	$t0, 0($s0)
li	$s0, 0
lw	$s0,8($zero)
lw	$t0, 0($s0)
li	$zero, 0
add	$zero, $a0, $a1
lw	$t0, 0($zero)
li	$zero, 0
addi	$zero, $a0, 9
lw	$t0, 0($zero)
li	$zero, 0
lw	$zero,0($zero)
lw	$t0, 0($zero)
#nop
li	$s0, 0
add	$s0, $a0, $a1
nop
lw	$t0, 0($s0)
li	$s0, 0
addi	$s0, $a0, 9
nop
lw	$t0, 0($s0)
li	$s0, 0
lw	$s0,8($zero)
nop
lw	$t0, 0($s0)
li	$zero, 0
add	$zero, $a0, $a1
nop
lw	$t0, 0($zero)
li	$zero, 0
addi	$zero, $a0, 9
nop
lw	$t0, 0($zero)
li	$zero, 0
lw	$zero,0($zero)
nop
lw	$t0, 0($zero)
#需求者lb 	标准供给者add, addi, lw
li	$s0, 0
add	$s0, $a0, $a1
lb	$t0, 0($s0)
li	$s0, 0
addi	$s0, $a0, 9
lb  	$t0, 0($s0)
li	$s0, 0
lw	$s0,8($zero)
lb	$t0, 0($s0)
li	$zero, 0
add	$zero, $a0, $a1
lb	$t0, 0($zero)	
li	$zero, 0
addi	$zero, $a0, 9
lb	$t0, 0($zero)
li	$zero, 0
lw	$zero,0($zero)
lb	$t0, 0($zero)
#nop
li	$s0, 0
add	$s0, $a0, $a1
nop
lb	$t0, 0($s0)	
li	$s0, 0
addi	$s0, $a0, 9
nop
lb  	$t0, 0($s0)
li	$s0, 0
lw	$s0,8($zero)
nop
lb	$t0, 0($s0)
li	$zero, 0
add	$zero, $a0, $a1
nop
lb	$t0, 0($zero)
li	$zero, 0
addi	$zero, $a0, 9
nop
lb	$t0, 0($zero)
li	$zero, 0
lw	$zero,0($zero)
nop
lb	$t0, 0($zero)
#需求者lbu 	标准供给者add, addi, lw
li	$s0, 0
add	$s0, $a0, $a1
lbu	$t0, 0($s0)
li	$s0, 0
addi	$s0, $a0, 9
lbu  	$t0, 0($s0)
li	$s0, 0
lw	$s0,8($zero)
lbu	$t0, 0($s0)
li	$zero, 0
add	$zero, $a0, $a1
lbu	$t0, 0($zero)	
li	$zero, 0
addi	$zero, $a0, 9
lbu	$t0, 0($zero)
li	$zero, 0
lw	$zero,0($zero)
lbu	$t0, 0($zero)
#nop
li	$s0, 0
add	$s0, $a0, $a1
nop
lbu	$t0, 0($s0)	
li	$s0, 0
addi	$s0, $a0, 9
nop
lbu  	$t0, 0($s0)
li	$s0, 0
lw	$s0,8($zero)
nop
lbu	$t0, 0($s0)
li	$zero, 0
add	$zero, $a0, $a1
nop
lbu	$t0, 0($zero)
li	$zero, 0
addi	$zero, $a0, 9
nop
lbu	$t0, 0($zero)
li	$zero, 0
lw	$zero,0($zero)
nop
lbu	$t0, 0($zero)
#需求者lh 	标准供给者add, addi, lw
li	$s0, 0
add	$s0, $a0, $a1
lh	$t0, 0($s0)
li	$s0, 0
addi	$s0, $a0, 9
lh  	$t0, 0($s0)
li	$s0, 0
lw	$s0,8($zero)
lh	$t0, 0($s0)
li	$zero, 0
add	$zero, $a0, $a1
lh	$t0, 0($zero)	
li	$zero, 0
addi	$zero, $a0, 9
lh	$t0, 0($zero)
li	$zero, 0
lw	$zero,0($zero)
lh	$t0, 0($zero)
#nop
li	$s0, 0
add	$s0, $a0, $a1
nop
lh	$t0, 0($s0)	
li	$s0, 0
addi	$s0, $a0, 9
nop
lh  	$t0, 0($s0)
li	$s0, 0
lw	$s0,8($zero)
nop
lh	$t0, 0($s0)
li	$zero, 0
add	$zero, $a0, $a1
nop
lh	$t0, 0($zero)
li	$zero, 0
addi	$zero, $a0, 9
nop
lh	$t0, 0($zero)
li	$zero, 0
lw	$zero,0($zero)
nop
lh	$t0, 0($zero)
#需求者lhu 	标准供给者add, addi, lw
li	$s0, 0
add	$s0, $a0, $a1
lhu	$t0, 0($s0)
li	$s0, 0
addi	$s0, $a0, 9
lhu  	$t0, 0($s0)
li	$s0, 0
lw	$s0,8($zero)
lhu	$t0, 0($s0)
li	$zero, 0
add	$zero, $a0, $a1
lhu	$t0, 0($zero)	
li	$zero, 0
addi	$zero, $a0, 9
lhu	$t0, 0($zero)
li	$zero, 0
lw	$zero,0($zero)
lhu	$t0, 0($zero)
#nop
li	$s0, 0
add	$s0, $a0, $a1
nop
lhu	$t0, 0($s0)	
li	$s0, 0
addi	$s0, $a0, 9
nop
lhu  	$t0, 0($s0)
li	$s0, 0
lw	$s0,8($zero)
nop
lhu	$t0, 0($s0)
li	$zero, 0
add	$zero, $a0, $a1
nop
lhu	$t0, 0($zero)
li	$zero, 0
addi	$zero, $a0, 9
nop
lhu	$t0, 0($zero)
li	$zero, 0
lw	$zero,0($zero)
nop
lhu	$t0, 0($zero)
#需求者lwl 	标准供给者add, addi, lw
li	$s0, 0
add	$s0, $a0, $a1
lwl	$t0, 0($s0)
li	$s0, 0
addi	$s0, $a0, 9
lwl  	$t0, 0($s0)
li	$s0, 0
lw	$s0,8($zero)
lwl	$t0, 0($s0)
li	$zero, 0
add	$zero, $a0, $a1
lwl	$t0, 0($zero)	
li	$zero, 0
addi	$zero, $a0, 9
lwl	$t0, 0($zero)
li	$zero, 0
lw	$zero,0($zero)
lwl	$t0, 0($zero)
#nop
li	$s0, 0
add	$s0, $a0, $a1
nop
lwl	$t0, 0($s0)	
li	$s0, 0
addi	$s0, $a0, 9
nop
lwl  	$t0, 0($s0)
li	$s0, 0
lw	$s0,8($zero)
nop
lwl	$t0, 0($s0)
li	$zero, 0
add	$zero, $a0, $a1
nop
lwl	$t0, 0($zero)
li	$zero, 0
addi	$zero, $a0, 9
nop
lwl	$t0, 0($zero)
li	$zero, 0
lw	$zero,0($zero)
nop
lwl	$t0, 0($zero)
#需求者lwr 	标准供给者add, addi, lw
li	$s0, 0
add	$s0, $a0, $a1
lwr	$t0, 0($s0)
li	$s0, 0
addi	$s0, $a0, 9
lwr  	$t0, 0($s0)
li	$s0, 0
lw	$s0,8($zero)
lwr	$t0, 0($s0)
li	$zero, 0
add	$zero, $a0, $a1
lwr	$t0, 0($zero)	
li	$zero, 0
addi	$zero, $a0, 9
lwr	$t0, 0($zero)
li	$zero, 0
lw	$zero,0($zero)
lwr	$t0, 0($zero)
#nop
li	$s0, 0
add	$s0, $a0, $a1
nop
lwr	$t0, 0($s0)	
li	$s0, 0
addi	$s0, $a0, 9
nop
lwr  	$t0, 0($s0)
li	$s0, 0
lw	$s0,8($zero)
nop
lwr	$t0, 0($s0)
li	$zero, 0
add	$zero, $a0, $a1
nop
lwr	$t0, 0($zero)
li	$zero, 0
addi	$zero, $a0, 9
nop
lwr	$t0, 0($zero)
li	$zero, 0
lw	$zero,0($zero)
nop
lwr	$t0, 0($zero)

#需求者sw	标准供给者add, addi, lw
#rs
li	$s1, 0x12345678
li	$s2, 0xa1b2c3d4
li	$s0, 0
add	$s0, $s1, $s2
sw	$s0, 0($zero)
li	$s0, 0
addi	$s0, $s1, 9
sw	$s0, 0($zero)
li	$s0, 0
lw	$s0 ,8($zero)
sw	$s0, 0($zero)
li	$zero, 0
add	$zero, $s1, $s2
sw	$zero, 0($zero)
li	$zero, 0
addi	$zero, $s1, 9
sw	$zero, 0($zero)
li	$zero, 0
lw	$zero ,8($zero)
sw	$zero, 0($zero)
#rt
li	$s1, 3
li	$s2, 9
li	$s0, 0
add	$s0, $s1, $s2
sw	$zero, 0($s0)
li	$s0, 0
addi	$s0, $s1, 9
sw	$zero, 0($s0)
li	$s0, 0
lw	$s0 ,8($zero)
sw	$zero, 0($s0)
#nop
#rs
li	$s1, 0x12345678
li	$s2, 0xa1b2c3d4
li	$s0, 0
add	$s0, $s1, $s2
nop
sw	$s0, 0($zero)
li	$s0, 0
addi	$s0, $s1, 9
nop
sw	$s0, 0($zero)
li	$s0, 0
lw	$s0 ,8($zero)
nop
sw	$s0, 0($zero)
li	$zero, 0
add	$zero, $s1, $s2
nop
sw	$zero, 0($zero)
li	$zero, 0
addi	$zero, $s1, 9
nop
sw	$zero, 0($zero)
li	$zero, 0
lw	$zero ,8($zero)
nop
sw	$zero, 0($zero)
#rt
li	$s1, 3
li	$s2, 9
li	$s0, 0
add	$s0, $s1, $s2
nop
sw	$zero, 0($s0)
li	$s0, 0
addi	$s0, $s1, 9
nop
sw	$zero, 0($s0)
li	$s0, 0
lw	$s0 ,8($zero)
nop
sw	$zero, 0($s0)

#需求者sb	标准供给者add, addi, lw
#rs
li	$s1, 0x12345678
li	$s2, 0xa1b2c3d4
li	$s0, 0
add	$s0, $s1, $s2
sb	$s0, 0($zero)
li	$s0, 0
addi	$s0, $s1, 9
sb	$s0, 0($zero)
li	$s0, 0
lw	$s0 ,8($zero)
sb	$s0, 0($zero)
li	$zero, 0
add	$zero, $s1, $s2
sb	$zero, 0($zero)
li	$zero, 0
addi	$zero, $s1, 9
sb	$zero, 0($zero)
li	$zero, 0
lw	$zero ,8($zero)
sb	$zero, 0($zero)
#rt
li	$s1, 3
li	$s2, 9
li	$s0, 0
add	$s0, $s1, $s2
sb	$zero, 0($s0)
li	$s0, 0
addi	$s0, $s1, 9
sb	$zero, 0($s0)
li	$s0, 0
lw	$s0 ,8($zero)
sb	$zero, 0($s0)
#nop
#rs
li	$s1, 0x12345678
li	$s2, 0xa1b2c3d4
li	$s0, 0
add	$s0, $s1, $s2
nop
sb	$s0, 0($zero)
li	$s0, 0
addi	$s0, $s1, 9
nop
sb	$s0, 0($zero)
li	$s0, 0
lw	$s0 ,8($zero)
nop
sb	$s0, 0($zero)
li	$zero, 0
add	$zero, $s1, $s2
nop
sb	$zero, 0($zero)
li	$zero, 0
addi	$zero, $s1, 9
nop
sb	$zero, 0($zero)
li	$zero, 0
lw	$zero ,8($zero)
nop
sb	$zero, 0($zero)
#rt
li	$s1, 3
li	$s2, 9
li	$s0, 0
add	$s0, $s1, $s2
nop
sb	$zero, 0($s0)
li	$s0, 0
addi	$s0, $s1, 9
nop
sb	$zero, 0($s0)
li	$s0, 0
lw	$s0 ,8($zero)
nop
sb	$zero, 0($s0)

#需求者sh	标准供给者add, addi, lw
#rs
li	$s1, 0x12345678
li	$s2, 0xa1b2c3d4
li	$s0, 0
add	$s0, $s1, $s2
sh	$s0, 0($zero)
li	$s0, 0
addi	$s0, $s1, 9
sh	$s0, 0($zero)
li	$s0, 0
lw	$s0 ,8($zero)
sh	$s0, 0($zero)
li	$zero, 0
add	$zero, $s1, $s2
sh	$zero, 0($zero)
li	$zero, 0
addi	$zero, $s1, 9
sh	$zero, 0($zero)
li	$zero, 0
lw	$zero ,8($zero)
sh	$zero, 0($zero)
#rt
li	$s1, 3
li	$s2, 9
li	$s0, 0
add	$s0, $s1, $s2
sh	$zero, 0($s0)
li	$s0, 0
addi	$s0, $s1, 9
sh	$zero, 0($s0)
li	$s0, 0
lw	$s0 ,8($zero)
sh	$zero, 0($s0)
#nop
#rs
li	$s1, 0x12345678
li	$s2, 0xa1b2c3d4
li	$s0, 0
add	$s0, $s1, $s2
nop
sh	$s0, 0($zero)
li	$s0, 0
addi	$s0, $s1, 9
nop
sh	$s0, 0($zero)
li	$s0, 0
lw	$s0 ,8($zero)
nop
sh	$s0, 0($zero)
li	$zero, 0
add	$zero, $s1, $s2
nop
sh	$zero, 0($zero)
li	$zero, 0
addi	$zero, $s1, 9
nop
sh	$zero, 0($zero)
li	$zero, 0
lw	$zero ,8($zero)
nop
sh	$zero, 0($zero)
#rt
li	$s1, 3
li	$s2, 9
li	$s0, 0
add	$s0, $s1, $s2
nop
sh	$zero, 0($s0)
li	$s0, 0
addi	$s0, $s1, 9
nop
sh	$zero, 0($s0)
li	$s0, 0
lw	$s0 ,8($zero)
nop
sh	$zero, 0($s0)
#需求者swl	标准供给者add, addi, lw
#rs
li	$s1, 0x12345678
li	$s2, 0xa1b2c3d4
li	$s0, 0
add	$s0, $s1, $s2
swl	$s0, 0($zero)
li	$s0, 0
addi	$s0, $s1, 9
swl	$s0, 0($zero)
li	$s0, 0
lw	$s0 ,8($zero)
swl	$s0, 0($zero)
li	$zero, 0
add	$zero, $s1, $s2
swl	$zero, 0($zero)
li	$zero, 0
addi	$zero, $s1, 9
swl	$zero, 0($zero)
li	$zero, 0
lw	$zero ,8($zero)
swl	$zero, 0($zero)
#rt
li	$s1, 3
li	$s2, 9
li	$s0, 0
add	$s0, $s1, $s2
swl	$zero, 0($s0)
li	$s0, 0
addi	$s0, $s1, 9
swl	$zero, 0($s0)
li	$s0, 0
lw	$s0 ,8($zero)
swl	$zero, 0($s0)
#nop
#rs
li	$s1, 0x12345678
li	$s2, 0xa1b2c3d4
li	$s0, 0
add	$s0, $s1, $s2
nop
swl	$s0, 0($zero)
li	$s0, 0
addi	$s0, $s1, 9
nop
swl	$s0, 0($zero)
li	$s0, 0
lw	$s0 ,8($zero)
nop
swl	$s0, 0($zero)
li	$zero, 0
add	$zero, $s1, $s2
nop
swl	$zero, 0($zero)
li	$zero, 0
addi	$zero, $s1, 9
nop
swl	$zero, 0($zero)
li	$zero, 0
lw	$zero ,8($zero)
nop
swl	$zero, 0($zero)
#rt
li	$s1, 3
li	$s2, 9
li	$s0, 0
add	$s0, $s1, $s2
nop
swl	$zero, 0($s0)
li	$s0, 0
addi	$s0, $s1, 9
nop
swl	$zero, 0($s0)
li	$s0, 0
lw	$s0 ,8($zero)
nop
swl	$zero, 0($s0)
#需求者swr	标准供给者add, addi, lw
#rs
li	$s1, 0x12345678
li	$s2, 0xa1b2c3d4
li	$s0, 0
add	$s0, $s1, $s2
swr	$s0, 0($zero)
li	$s0, 0
addi	$s0, $s1, 9
swr	$s0, 0($zero)
li	$s0, 0
lw	$s0 ,8($zero)
swr	$s0, 0($zero)
li	$zero, 0
add	$zero, $s1, $s2
swr	$zero, 0($zero)
li	$zero, 0
addi	$zero, $s1, 9
swr	$zero, 0($zero)
li	$zero, 0
lw	$zero ,8($zero)
swr	$zero, 0($zero)
#rt
li	$s1, 3
li	$s2, 9
li	$s0, 0
add	$s0, $s1, $s2
swr	$zero, 0($s0)
li	$s0, 0
addi	$s0, $s1, 9
swr	$zero, 0($s0)
li	$s0, 0
lw	$s0 ,8($zero)
swr	$zero, 0($s0)
#nop
#rs
li	$s1, 0x12345678
li	$s2, 0xa1b2c3d4
li	$s0, 0
add	$s0, $s1, $s2
nop
swr	$s0, 0($zero)
li	$s0, 0
addi	$s0, $s1, 9
nop
swr	$s0, 0($zero)
li	$s0, 0
lw	$s0 ,8($zero)
nop
swr	$s0, 0($zero)
li	$zero, 0
add	$zero, $s1, $s2
nop
swr	$zero, 0($zero)
li	$zero, 0
addi	$zero, $s1, 9
nop
swr	$zero, 0($zero)
li	$zero, 0
lw	$zero ,8($zero)
nop
swr	$zero, 0($zero)
#rt
li	$s1, 3
li	$s2, 9
li	$s0, 0
add	$s0, $s1, $s2
nop
swr	$zero, 0($s0)
li	$s0, 0
addi	$s0, $s1, 9
nop
swr	$zero, 0($s0)
li	$s0, 0
lw	$s0 ,8($zero)
nop
swr	$zero, 0($s0)






