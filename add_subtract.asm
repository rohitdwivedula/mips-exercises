# Problem: Input two numbers and display their sum and difference

.data

myMsg: .asciiz "Provide two integers: "
addMsg: .asciiz "Sum of numbers: "
subMsg: .asciiz "Difference of numbers: "

.text

main:
	# print welcome message
	li $v0, 4
	la $a0, myMsg
	syscall

	# read integers
	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 5
	syscall
	move $t1, $v0

	# add and display
	li $v0, 4
	la $a0, addMsg
	syscall

	add $a0, $t0, $t1
	li $v0, 1
	syscall

	# subtract and display
	li $v0, 4
	la $a0, subMsg
	syscall

	sub $a0, $t0, $t1
	li $v0, 1
	syscall
	
	# exit
	li $v0, 10
	syscall