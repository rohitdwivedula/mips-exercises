# disassembly exercises: given the binary/hex codes calculate the assembly instructions 

.text

jr $31 # 03e00008
jalr $4, $16 # 02002009
c.le.s $f2, $f4 # 4604103e
sdc1 $f10, 0($4) # f48a0000
swc1 $f10, 0($4) # e48a0000
sc $10, 0($4) # e08a0000
sb $10, 0($t4) # a18a0000
ll $10, 0($4) # c08a0000
lb $12, 0($10) # 814c0000
beq $19,$4,label # 12640001
label: mfc1 $a0, $f4 # 44042000
mul.s $f3, $f1, $f2 # 460208c2
mtc1 $t0, $f0 # 44880000
cvt.s.w $f1, $f0 # 46800060
li $v0, 10
syscall