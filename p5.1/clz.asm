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
#clz-addu/subu
clz $t0 $t1
addu $t2 $t0 $t1
addu $t2 $t0 $t1
addu $t2 $t0 $t1
clz $t0 $t1
addu $t2 $t1 $t0
addu $t2 $t1 $t0
addu $t2 $t1 $t0
clz $t0 $t1
subu $t2 $t0 $t1
subu $t2 $t0 $t1
subu $t2 $t0 $t1
clz $t0 $t1
subu $t2 $t1 $t0
subu $t2 $t1 $t0
subu $t2 $t1 $t0
#clz-ori
clz $t0 $t1
ori $t2 $t0 10
ori $t2 $t0 10
ori $t2 $t0 10
#addu/subu/ori/lui-clz
addu $t2 $t0 $t1
clz $t3 $t2
clz $t3 $t2
clz $t3 $t2
subu $t2 $t0 $t1
clz $t3 $t2
clz $t3 $t2
clz $t3 $t2
ori $t2 $t0 21
clz $t3 $t2
clz $t3 $t2
clz $t3 $t2
lui $t2 21
clz $t3 $t2
clz $t3 $t2
clz $t3 $t2

j loop
clz $t4 $t2
clz $t4 $t2 #not to do

loop:
lui $t0 0
j loop
lui $t1 0