.text 
ori $t0 $0 66
ori $t1 $0 88
addu $t2 $t0 $t1
addu $t3 $0 $t1
subu $t4 $t2 $t3
subu $t5 $t3 $t2
subu $t6 $t4 $t3

lui $t0 66
lui $t1 88
addu $t2 $t0 $t1
addu $t3 $0 $t1
subu $t4 $t2 $t3
subu $t5 $t3 $t2
subu $t6 $t4 $t3
j begin
lui $t0 66
lui $t1 88
addu $t2 $t0 $t1
addu $t3 $0 $t1
begin:
subu $s0 $t2 $t3
subu $s1 $t3 $t2
addu $t0 $s0 $s1
addu $t1 $s1 $s0
addu $t1 $s1 $s0

ori $t0 $0 66
ori $t1 $0 88
addu $t2 $t1 $t0
addu $t3 $t1 $0
subu $t4 $t3 $t2
subu $t5 $t2 $t3
subu $t6 $t3 $t4

lui $t0 66
lui $t1 88
addu $t2 $t0 $t1
addu $t3 $0 $t1
subu $t4 $t3 $t2
subu $t5 $t2 $t3
subu $t6 $t3 $t4

#new
#nor-addu
lui $t0 66
lui $t1 88
nor $t2 $t0 $t1
addu $t3 $t2 $t0
addu $t4 $t2 $t0
addu $t5 $t2 $t0

lui $t0 66
lui $t1 88
nor $t2 $t1 $t0
addu $t3 $t0 $t2
addu $t4 $t0 $t2
addu $t5 $t0 $t2

#nor-subu
lui $t1 66
lui $t0 88
nor $t2 $t0 $t1
subu $t3 $t2 $t0
subu $t4 $t2 $t0
subu $t5 $t2 $t0

lui $t1 66
lui $t0 88
nor $t2 $t1 $t0
subu $t3 $t0 $t2
subu $t4 $t0 $t2
subu $t5 $t0 $t2

#nor-ori
lui $t0 66
lui $t1 88
nop
nor $t2 $t0 $t1
ori $t3 $t2 1
ori $t4 $t2 2
ori $t5 $t2 3

#addu-nor
lui $t0 66
lui $t1 88
addu $t2 $t0 $t1
nor $t3 $t0 $t2
nor $t4 $t0 $t2
nor $t5 $t0 $t2
addu $t2 $t0 $t1
nor $t3 $t2 $t0
nor $t4 $t2 $t0
nor $t5 $t2 $t0

#subu-nor
lui $t0 66
lui $t1 88
subu $t2 $t0 $t1
nor $t3 $t0 $t2
nor $t4 $t0 $t2
nor $t5 $t0 $t2
subu $t2 $t0 $t1
nor $t3 $t2 $t0
nor $t4 $t2 $t0
nor $t5 $t2 $t0

#ori-nor
ori $t0 $0 22
ori $t1 $0 33
nor $t3 $t0 $t1
ori $t0 $0 22
ori $t1 $0 33
nor $t3 $t1 $t0
ori $t0 $0 22
ori $t1 $0 33
nop
nor $t3 $t0 $t1
ori $t0 $0 22
ori $t1 $0 33
nop
nor $t3 $t1 $t0
j loop
nor $t4 $t1 $t0
nor $t4 $t1 $t0

loop:
lui $t0 0
j loop
lui $t1 0