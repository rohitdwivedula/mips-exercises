# Write MIPS Assembly code to print all the multiples of the given number
# between 0 and 100. Your program should allow the user to give the input number. 
# Sample test case: Input: 25, Output: 25 50 75

.data

msg: .asciiz "enter integer: "
space: .asciiz " "

.text

main:
	li $v0, 4
	la $a0, msg
	syscall

	li $v0, 5
	syscall
	move $a1, $v0 # number

	li $t0, 0
	li $a2, 100 # max_value

	loop: 
		mul $a0, $a1, $t0
		bge $a0, $a2, endloop
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, space
		syscall
		addi $t0, $t0, 1
		j loop
	endloop:
	li $v0, 10
	syscall