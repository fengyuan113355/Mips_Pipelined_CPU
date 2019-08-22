.data
	print: .asciiz "\nString is:"
	chars: .space 20
.text
	li $v0 5
	syscall
	move $s0, $v0
	
	move $s1, $0
	li $s2, 97
	li $s3, 122
	li $s4, 10
	la $s5, chars
store:
	slt $t0, $s1, $s0
	beq $t0, $0, end_store
	li $v0 12
	syscall
	move $s6, $v0
	
	beq $s6, $s4, store
	trans:
		slt $t0, $s6, $s2
		bne $t0, $0, end_trans
		slt $t0, $s3, $s6
		bne $t0, $0, end_trans
		
		addi $s6, $s6, -32
	end_trans:	
	add $t0, $s5, $s1
	sb $s6, 0($t0)
	
	addi $s1, $s1, 1
	j store			
end_store:
	move $s1, $0
output:
	la $a0, print
	li $v0, 4
	syscall
	output_loop:
		slt $t0, $s1, $s0
		beq $t0, $0, end_output
		add $t0, $s5, $s1
		lbu $a0, 0($t0)
		li $v0, 11
		syscall
	
		addi $s1, $s1, 1
		j output_loop 
end_output:
	
	li $v0, 10
	syscall			
