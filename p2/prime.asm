.data
print:	.asciiz "The prime numbers are:\n"
space:  .asciiz " "
endl:   .asciiz "\n"
words:	.word 0 : 1001

.text
	li $v0 5
	syscall
	move $s0, $v0
	li $v0, 5
	syscall
	move $s1, $v0
	
	la $s2, words
	li $t1, 2
fill:
	slt $t0, $s1, $t1
	bne $t0, $0,end_fill
	sll $t2, $t1, 2 	
	add $t2, $t2, $s2
	sw $t1, 0($t2)
	addi $t1, $t1, 1
	j fill	
end_fill:
	li $s3, 2
loop:
	mul $s4, $s3, $s3
	slt $t0, $s1, $s4
	bne $t0, $0, end_loop
	sll $t2, $s4, 2
	add $t2, $t2, $s2
	lw $t0, 0($t2)
	beq $t0, $0, loop_next
	
	erase:
		slt $t0, $s1, $s4 							
		bne $t0, $0, end_erase
	    sll $t2, $s4, 2
	    add $t2, $t2, $s2
	    sw $0, 0($t2)
	 	add $s4, $s4, $s3
	 	j erase
	end_erase:
		
	loop_next:	
		addi $s3, $s3, 1
		j loop
end_loop:

output:
	li $v0, 4
	la $a0, print
	syscall
	
	move $t1, $0
	li $t2, 10
	output_loop:
		slt $t0, $s1, $s0
		bne $t0, $0, end_output_loop
		sll $t0, $s0, 2
		add $t0, $t0, $s2
		lw $t0, 0($t0)
		beq $t0, $0, output_next
		move $a0, $t0
		li $v0, 1
		syscall
		
		addi $t1, $t1, 1
		beq $t1, $t2, next_line
		li $v0, 4
		la $a0, space
		syscall
		j output_next
		next_line:
			move $t1, $0
			li $v0, 4
			la $a0, endl
			syscall
	output_next:
		addi $s0, $s0, 1
		j output_loop
	end_output_loop:
		
	li $v0, 10
	syscall