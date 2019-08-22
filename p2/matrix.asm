.extern matrix, 1024

.text
		li $t0, 16
		move $t1, $0
		la $t2, matrix
		move $s0, $0
		move $s1, $0
		move $s2, $0
		
loop:
		add $t1, $s1, $0
		mul $t1, $t1, $t0
		add $t1, $t1, $s2
		sll $t1, $t1, 2
		add $t1, $t1, $t2
		sw $s0, 0($t1)
		
		addi $s0, $s0, 1
		addi $s1, $s1, 1
		bne $s1, $t0, loop
		
		move $s1, $0
		addi $s2, $s2, 1
		bne $s2, $t0, loop
		
li $v0, 10
syscall
		