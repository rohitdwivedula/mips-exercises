.data

msg: .asciiz "Enter a number"
answer: .asciiz "\nFactorial is: "

.text

# welcome message
li $v0, 4
la $a0, msg
syscall

# read integer
li $v0, 5
syscall

# print the integer
move $a0, $v0
li $v0, 1
syscall

jal calculate_factorial
move $a1, $v0

li $v0, 4
la $a0, answer
syscall

move $a0, $a1
li $v0, 1
syscall

li $v0, 10
syscall

calculate_factorial:
	addi $sp, $sp-4
	sw $ra, ($sp)

	li $v0, 1
	multiply:
		beq $a0, $zero, return
		mul $v0, $v0, $a0
		addi $a0, $a0, -1
		j multiply

	return:
	lw $ra, ($sp)
	jr $ra