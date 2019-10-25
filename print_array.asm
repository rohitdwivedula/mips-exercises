.data

list: .word 17, 5, 92, 87, 41, 10, 23, 55, 72, 36
listSize: .word 10
msg: .asciiz "Array is: "
space: .asciiz " "

.text

lw $t0, listSize
la $a2, list
li $t1, 0

print:
	beq $t1, $t0, exit
	lw $a0, ($a2)
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, space
	syscall
	addi $a2, $a2, 4
	addi $t1, $t1, 1
	j print
	
exit:
li $v0, 10
syscall