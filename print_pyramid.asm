# Print a pyramid of height 'n' (user input) as shown below (for n=4)
#    *
#   * *
#  * * *
# * * * *

.data

msg: .asciiz "Enter height of pyramid: "
space: .asciiz " "
newline: .asciiz "\n"
star: .asciiz "*"

.text

main:
	# user input
	li $v0, 4
	la $a0, msg
	syscall
	li $v0, 5
	syscall

	move $s0, $v0 # height of pyramid
	move $s1, $v0
	addi $s1, $s1, -1 # number of spaces required before each line

	li $v0, 4
	la $a0, newline
	syscall
	
	li $t0, 1

	print_row:
		bgt $t0, $s0, exit
		
		# print spaces
		move $a1, $s1
		jal print_spaces
		addi $s1, $s1, -1

		# print stars
		move $a1, $t0
		jal print_stars
		addi $t0, $t0, 1

		j print_row

	exit: li $v0, 10
	syscall

print_stars:
	# print $a1 number of stars
	addi $sp, $sp, -12
	sw $ra, ($sp)
	sw $v0, 4($sp)
	sw $a0, 8($sp)
	li $v0, 4
	star_loop:
		beq $a1, $zero, return_stars
		la $a0, star
		syscall
		la $a0, space
		syscall
		addi $a1, $a1, -1
		j star_loop
	return_stars: la $a0, newline
	syscall
	lw $ra, ($sp)
	lw $v0, 4($sp)
	lw $a0, 8($sp)
	addi $sp, $sp, 12
	jr $ra

print_spaces:
	# print $a1 number of spaces
	addi $sp, $sp, -12
	sw $ra, ($sp)
	sw $v0, 4($sp)
	sw $a0, 8($sp)
	li $v0, 4
	la $a0, space
	print_one_more:
		beq $a1, $zero, return_spaces
		syscall
		addi $a1, $a1, -1
		j print_one_more
	return_spaces: lw $ra, ($sp)
	lw $v0, 4($sp)
	lw $a0, 8($sp)
	addi $sp, $sp, 12
	jr $ra