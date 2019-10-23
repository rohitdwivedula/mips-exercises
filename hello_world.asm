# Print hello world, input an integer and print it back onto console

.data

myMsg: .asciiz "Hello world! Please enter number: "
readMsg: .asciiz "Number provided is:"

.text

main:
	# print welcome message
	li $v0, 4
	la $a0, myMsg
	syscall

	# read integer and store in $t0
	li $v0, 5
	syscall
	move $t0, $v0
	addi $t0, $t0, 1 
	# print string
	li $v0, 4
	la $a0, readMsg

	# print integer provided
	li $v0, 1
	move $a0, $t0
	syscall

	# exit
	li $v0, 10
	syscall