lui $s0, 0x2333
ori $s1, $s0, 0x6666
addu $s2, $s1, $s0
subu $s3, $s1, $s0
sw $s1, 0($0)
sw $s2, 4($0)
lw $s4, 4($0)
beq $s2, $s4, next
ori $s5, $0, 0x5555
next:
ori $s6, $0, 0x1234
addu $s7, $s6, $0
end:
nop
beq $0, $0, end