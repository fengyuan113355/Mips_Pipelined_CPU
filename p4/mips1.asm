.text
	lui $s0, 0x2333
	ori $s1, $s0, 0x6666
	addu $s2, $s1, $s0
	subu $s3, $s1, $s0
	lui $0, 0x7777
	ori $0, $0, 0x5555
	sw $s2, 0($0)
	sw $s3, 4($0)
	lw $s4, 4($0)
	addu $s5, $0, $0
	beq $s5, $0, next
	addu $s5, $0, $s1
next:
	addu $s6, $0, $s1
	lui $s7, 0
	jal next2
	jal end
	lui $s7, 0x2222	
next2:
	ori $s7, 0x3333
	jr $ra
end: 
	nop
beq $0, $0, end
