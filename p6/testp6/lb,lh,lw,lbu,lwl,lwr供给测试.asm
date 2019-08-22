#供给测试
#供给者lb	标准需求者beq_rs, beq_rt, jr_rs, add_rs, add_rt, addi_rs, lb_rs, sw_rs, sw_rt, 
li	$s0, 4
sw	$s0, 8($zero)
li	$s1, 0x12345678
sw	$s1, 0($zero)
li	$s0, 0
lb	$s0, 0($zero)
beq	$s0, $s1,lb1
li	$a0, 1
li	$a1, 2
lb1:
li	$s0, 0
lb	$s0, 0($zero)
beq	$s1, $s0,lb2
li	$a0, 1
li	$a1, 2
lb2:
jal	lb3
nop
lb3:addi	$s0, $ra, 20
sw	$s0, 4($zero)
lb	$s0, 4($zero)
#jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
lb	$s0, 0($zero)
add	$t0, $s0, $s1
li	$s0, 0
lb	$s0, 0($zero)
add	$t0, $s1, $s0
li	$s0, 0
lb	$s0, 0($zero)
addi	$t0, $s0, 9
li	$s0, 0
lb	$s0, 8($zero)
lw	$t0, 0($s0)
li	$s0, 0
lb	$s0, 8($zero)
sw	$s1, 0($s0)
li	$s0, 0
lb	$s0, 0($zero)
sw	$s0, 12($zero)
#nop
li	$s0, 4
sw	$s0, 8($zero)
li	$s1, 0x12345678
sw	$s1, 0($zero)
li	$s0, 0
lb	$s0, 0($zero)
nop
beq	$s0, $s1,lb4
li	$a0, 1
li	$a1, 2
lb4:
li	$s0, 0
lb	$s0, 0($zero)
nop
beq	$s1, $s0,lb5
li	$a0, 1
li	$a1, 2
lb5:
jal	lb6
nop
lb6:addi	$s0, $ra, 20
sw	$s0, 4($zero)
lb	$s0, 4($zero)
nop
#jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
lb	$s0, 0($zero)
nop
add	$t0, $s0, $s1
li	$s0, 0
lb	$s0, 0($zero)
nop
add	$t0, $s1, $s0
li	$s0, 0
lb	$s0, 0($zero)
nop
addi	$t0, $s0, 9
li	$s0, 0
lb	$s0, 8($zero)
nop
lw	$t0, 0($s0)
li	$s0, 0
lw	$s0, 8($zero)
nop
sw	$s1, 0($s0)
li	$s0, 0
lb	$s0, 0($zero)
nop
sw	$s0, 12($zero)

#供给者lbu	标准需求者beq_rs, beq_rt, jr_rs, add_rs, add_rt, addi_rs, lbu_rs, sw_rs, sw_rt, 
li	$s0, 4
sw	$s0, 8($zero)
li	$s1, 0x12345678
sw	$s1, 0($zero)
li	$s0, 0
lbu	$s0, 0($zero)
beq	$s0, $s1,lbu1
li	$a0, 1
li	$a1, 2
lbu1:
li	$s0, 0
lbu	$s0, 0($zero)
beq	$s1, $s0,lbu2
li	$a0, 1
li	$a1, 2
lbu2:
jal	lbu3
nop
lbu3:addi	$s0, $ra, 20
sw	$s0, 4($zero)
lbu	$s0, 4($zero)
#jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
lbu	$s0, 0($zero)
add	$t0, $s0, $s1
li	$s0, 0
lbu	$s0, 0($zero)
add	$t0, $s1, $s0
li	$s0, 0
lbu	$s0, 0($zero)
addi	$t0, $s0, 9
li	$s0, 0
lbu	$s0, 8($zero)
lw	$t0, 0($s0)
li	$s0, 0
lbu	$s0, 8($zero)
sw	$s1, 0($s0)
li	$s0, 0
lbu	$s0, 0($zero)
sw	$s0, 12($zero)
#nop
li	$s0, 4
sw	$s0, 8($zero)
li	$s1, 0x12345678
sw	$s1, 0($zero)
li	$s0, 0
lbu	$s0, 0($zero)
nop
beq	$s0, $s1,lbu4
li	$a0, 1
li	$a1, 2
lbu4:
li	$s0, 0
lbu	$s0, 0($zero)
nop
beq	$s1, $s0,lbu5
li	$a0, 1
li	$a1, 2
lbu5:
jal	lbu6
nop
lbu6:addi	$s0, $ra, 20
sw	$s0, 4($zero)
lbu	$s0, 4($zero)
nop
#jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
lbu	$s0, 0($zero)
nop
add	$t0, $s0, $s1
li	$s0, 0
lbu	$s0, 0($zero)
nop
add	$t0, $s1, $s0
li	$s0, 0
lbu	$s0, 0($zero)
nop
addi	$t0, $s0, 9
li	$s0, 0
lbu	$s0, 8($zero)
nop
lbu	$t0, 0($s0)
li	$s0, 0
lw	$s0, 8($zero)
nop
sw	$s1, 0($s0)
li	$s0, 0
lbu	$s0, 0($zero)
nop
sw	$s0, 12($zero)

#供给者lh	标准需求者beq_rs, beq_rt, jr_rs, add_rs, add_rt, addi_rs, lh_rs, sw_rs, sw_rt, 
li	$s0, 4
sw	$s0, 8($zero)
li	$s1, 0x12345678
sw	$s1, 0($zero)
li	$s0, 0
lh	$s0, 0($zero)
beq	$s0, $s1,lh1
li	$a0, 1
li	$a1, 2
lh1:
li	$s0, 0
lh	$s0, 0($zero)
beq	$s1, $s0,lh2
li	$a0, 1
li	$a1, 2
lh2:
jal	lh3
nop
lh3:addi	$s0, $ra, 20
sw	$s0, 4($zero)
lh	$s0, 4($zero)
jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
lh	$s0, 0($zero)
add	$t0, $s0, $s1
li	$s0, 0
lh	$s0, 0($zero)
add	$t0, $s1, $s0
li	$s0, 0
lh	$s0, 0($zero)
addi	$t0, $s0, 9
li	$s0, 0
lh	$s0, 8($zero)
lw	$t0, 0($s0)
li	$s0, 0
lh	$s0, 8($zero)
sw	$s1, 0($s0)
li	$s0, 0
lh	$s0, 0($zero)
sw	$s0, 12($zero)
#nop
li	$s0, 4
sw	$s0, 8($zero)
li	$s1, 0x12345678
sw	$s1, 0($zero)
li	$s0, 0
lh	$s0, 0($zero)
nop
beq	$s0, $s1,lh4
li	$a0, 1
li	$a1, 2
lh4:
li	$s0, 0
lh	$s0, 0($zero)
nop
beq	$s1, $s0,lh5
li	$a0, 1
li	$a1, 2
lh5:
jal	lh6
nop
lh6:addi	$s0, $ra, 20
sw	$s0, 4($zero)
lh	$s0, 4($zero)
nop
jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
lh	$s0, 0($zero)
nop
add	$t0, $s0, $s1
li	$s0, 0
lh	$s0, 0($zero)
nop
add	$t0, $s1, $s0
li	$s0, 0
lh	$s0, 0($zero)
nop
addi	$t0, $s0, 9
li	$s0, 0
lh	$s0, 8($zero)
nop
lh	$t0, 0($s0)
li	$s0, 0
lw	$s0, 8($zero)
nop
sw	$s1, 0($s0)
li	$s0, 0
lh	$s0, 0($zero)
nop
sw	$s0, 12($zero)

#供给者lhu	标准需求者beq_rs, beq_rt, jr_rs, add_rs, add_rt, addi_rs, lhu_rs, sw_rs, sw_rt, 
li	$s0, 4
sw	$s0, 8($zero)
li	$s1, 0x12345678
sw	$s1, 0($zero)
li	$s0, 0
lhu	$s0, 0($zero)
beq	$s0, $s1,lhu1
li	$a0, 1
li	$a1, 2
lhu1:
li	$s0, 0
lhu	$s0, 0($zero)
beq	$s1, $s0,lhu2
li	$a0, 1
li	$a1, 2
lhu2:
jal	lhu3
nop
lhu3:addi	$s0, $ra, 20
sw	$s0, 4($zero)
lhu	$s0, 4($zero)
jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
lhu	$s0, 0($zero)
add	$t0, $s0, $s1
li	$s0, 0
lhu	$s0, 0($zero)
add	$t0, $s1, $s0
li	$s0, 0
lhu	$s0, 0($zero)
addi	$t0, $s0, 9
li	$s0, 0
lhu	$s0, 8($zero)
lw	$t0, 0($s0)
li	$s0, 0
lhu	$s0, 8($zero)
sw	$s1, 0($s0)
li	$s0, 0
lhu	$s0, 0($zero)
sw	$s0, 12($zero)
#nop
li	$s0, 4
sw	$s0, 8($zero)
li	$s1, 0x12345678
sw	$s1, 0($zero)
li	$s0, 0
lhu	$s0, 0($zero)
nop
beq	$s0, $s1,lhu4
li	$a0, 1
li	$a1, 2
lhu4:
li	$s0, 0
lhu	$s0, 0($zero)
nop
beq	$s1, $s0,lhu5
li	$a0, 1
li	$a1, 2
lhu5:
jal	lhu6
nop
lhu6:addi	$s0, $ra, 20
sw	$s0, 4($zero)
lhu	$s0, 4($zero)
nop
jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
lhu	$s0, 0($zero)
nop
add	$t0, $s0, $s1
li	$s0, 0
lhu	$s0, 0($zero)
nop
add	$t0, $s1, $s0
li	$s0, 0
lhu	$s0, 0($zero)
nop
addi	$t0, $s0, 9
li	$s0, 0
lhu	$s0, 8($zero)
nop
lhu	$t0, 0($s0)
li	$s0, 0
lw	$s0, 8($zero)
nop
sw	$s1, 0($s0)
li	$s0, 0
lhu	$s0, 0($zero)
nop
sw	$s0, 12($zero)

#供给者lwl	标准需求者beq_rs, beq_rt, jr_rs, add_rs, add_rt, addi_rs, lwl_rs, sw_rs, sw_rt, 
li	$s0, 4
sw	$s0, 8($zero)
li	$s1, 0x12345678
sw	$s1, 0($zero)
li	$s0, 0
lwl	$s0, 0($zero)
beq	$s0, $s1,lwl1
li	$a0, 1
li	$a1, 2
lwl1:
li	$s0, 0
lwl	$s0, 0($zero)
beq	$s1, $s0,lwl2
li	$a0, 1
li	$a1, 2
lwl2:
jal	lwl3
nop
lwl3:addi	$s0, $ra, 20
sw	$s0, 4($zero)
lwl	$s0, 4($zero)
#jr	$s0
li	$a0, 1
li	$a1, 2
li	$s1, 1345345
li	$s0, 0
lwl	$s0, 0($zero)
add	$t0, $s0, $s1
li	$s0, 0
lwl	$s0, 0($zero)
add	$t0, $s1, $s0
li	$s0, 0
lwl	$s0, 0($zero)
addi	$t0, $s0, 9
li	$s0, 0
lwl	$s0, 8($zero)
#lw	$t0, 0($s0)
li	$s0, 0
lwl	$s0, 8($zero)
#sw	$s1, 0($s0)
li	$s0, 0
lwl	$s0, 0($zero)
sw	$s0, 12($zero)
#nop
li	$s0, 4
sw	$s0, 8($zero)
li	$s1, 0x12345678
sw	$s1, 0($zero)
li	$s0, 0
lwl	$s0, 0($zero)
nop
beq	$s0, $s1,lwl4
li	$a0, 1
li	$a1, 2
lwl4:
li	$s0, 0
lwl	$s0, 0($zero)
nop
beq	$s1, $s0,lwl5
li	$a0, 1
li	$a1, 2
lwl5:
jal	lwl6
nop
lwl6:addi	$s0, $ra, 20
sw	$s0, 4($zero)
lwl	$s0, 4($zero)
nop
#jr	$s0
li	$a0, 1
li	$a1, 2
li	$s1, 1234513
li	$s0, 0
lwl	$s0, 0($zero)
nop
add	$t0, $s0, $s1
li	$s0, 0
lwl	$s0, 0($zero)
nop
add	$t0, $s1, $s0
li	$s0, 0
lwl	$s0, 0($zero)
nop
addi	$t0, $s0, 9
li	$s0, 0
lwl	$s0, 8($zero)
nop
#lw	$t0, 0($s0)
li	$s0, 0
lw	$s0, 8($zero)
nop
#sw	$s1, 0($s0)
li	$s0, 0
lwl	$s0, 0($zero)
nop
sw	$s0, 12($zero)

#供给者lwr	标准需求者beq_rs, beq_rt, jr_rs, add_rs, add_rt, addi_rs, lwr_rs, sw_rs, sw_rt, 
li	$s0, 4
sw	$s0, 8($zero)
li	$s1, 0x12345678
sw	$s1, 0($zero)
li	$s0, 0
lwr	$s0, 0($zero)
beq	$s0, $s1,lwr1
li	$a0, 1
li	$a1, 2
lwr1:
li	$s0, 0
lwr	$s0, 0($zero)
beq	$s1, $s0,lwr2
li	$a0, 1
li	$a1, 2
lwr2:
jal	lwr3
nop
lwr3:addi	$s0, $ra, 20
sw	$s0, 4($zero)
lwr	$s0, 4($zero)
jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
lwr	$s0, 0($zero)
add	$t0, $s0, $s1
li	$s0, 0
lwr	$s0, 0($zero)
add	$t0, $s1, $s0
li	$s0, 0
lwr	$s0, 0($zero)
addi	$t0, $s0, 9
li	$s0, 0
lwr	$s0, 8($zero)
lw	$t0, 0($s0)
li	$s0, 0
lwr	$s0, 8($zero)
sw	$s1, 0($s0)
li	$s0, 0
lwr	$s0, 0($zero)
sw	$s0, 12($zero)
#nop
li	$s0, 4
sw	$s0, 8($zero)
li	$s1, 0x12345678
sw	$s1, 0($zero)
li	$s0, 0
lwr	$s0, 0($zero)
nop
beq	$s0, $s1,lwr4
li	$a0, 1
li	$a1, 2
lwr4:
li	$s0, 0
lwr	$s0, 0($zero)
nop
beq	$s1, $s0,lwr5
li	$a0, 1
li	$a1, 2
lwr5:
jal	lwr6
nop
lwr6:addi	$s0, $ra, 20
sw	$s0, 4($zero)
lwr	$s0, 4($zero)
nop
jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
lwr	$s0, 0($zero)
nop
add	$t0, $s0, $s1
li	$s0, 0
lwr	$s0, 0($zero)
nop
add	$t0, $s1, $s0
li	$s0, 0
lwr	$s0, 0($zero)
nop
addi	$t0, $s0, 9
li	$s0, 0
lwr	$s0, 8($zero)
nop
lwr	$t0, 0($s0)
li	$s0, 0
lw	$s0, 8($zero)
nop
sw	$s1, 0($s0)
li	$s0, 0
lwr	$s0, 0($zero)
nop
sw	$s0, 12($zero)

#供给者lw	标准需求者beq_rs, beq_rt, jr_rs, add_rs, add_rt, addi_rs, lw_rs, sw_rs, sw_rt, 
li	$s0, 4
sw	$s0, 8($zero)
li	$s1, 0x12345678
sw	$s1, 0($zero)
li	$s0, 0
lw	$s0, 0($zero)
beq	$s0, $s1,lw1
li	$a0, 1
li	$a1, 2
lw1:
li	$s0, 0
lw	$s0, 0($zero)
beq	$s1, $s0,lw2
li	$a0, 1
li	$a1, 2
lw2:
jal	lw3
nop
lw3:addi	$s0, $ra, 20
sw	$s0, 4($zero)
lw	$s0, 4($zero)
jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
lw	$s0, 0($zero)
add	$t0, $s0, $s1
li	$s0, 0
lw	$s0, 0($zero)
add	$t0, $s1, $s0
li	$s0, 0
lw	$s0, 0($zero)
addi	$t0, $s0, 9
li	$s0, 0
lw	$s0, 8($zero)
lw	$t0, 0($s0)
li	$s0, 0
lw	$s0, 8($zero)
sw	$s1, 0($s0)
li	$s0, 0
lw	$s0, 0($zero)
sw	$s0, 12($zero)
#nop
li	$s0, 4
sw	$s0, 8($zero)
li	$s1, 0x12345678
sw	$s1, 0($zero)
li	$s0, 0
lw	$s0, 0($zero)
nop
beq	$s0, $s1,lw4
li	$a0, 1
li	$a1, 2
lw4:
li	$s0, 0
lw	$s0, 0($zero)
nop
beq	$s1, $s0,lw5
li	$a0, 1
li	$a1, 2
lw5:
jal	lw6
nop
lw6:addi	$s0, $ra, 20
sw	$s0, 4($zero)
lw	$s0, 4($zero)
nop
jr	$s0
li	$a0, 1
li	$a1, 2
li	$s0, 0
lw	$s0, 0($zero)
nop
add	$t0, $s0, $s1
li	$s0, 0
lw	$s0, 0($zero)
nop
add	$t0, $s1, $s0
li	$s0, 0
lw	$s0, 0($zero)
nop
addi	$t0, $s0, 9
li	$s0, 0
lw	$s0, 8($zero)
nop
lw	$t0, 0($s0)
li	$s0, 0
lw	$s0, 8($zero)
nop
sw	$s1, 0($s0)
li	$s0, 0
lw	$s0, 0($zero)
nop
sw	$s0, 12($zero)






