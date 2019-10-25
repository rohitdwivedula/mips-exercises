# Write a program that asks if the user wants a triangle or a square. It then asks the
# user for the size of the object (the number of lines it takes to draw the object). The program
# then writes a triangle or a square of stars "*" to the console.*******
#
# *******
# *******
# *******
# *******
# *******
#
# or
#
# *
# **
# ***
# ****
# *****
# ******
#
# Write a subroutine for each figure. In them, use a subroutine print_star_line that writes a
# line of a given number of stars. (that number is passed as an argument to
# print_star_line function).

.data

msg: .asciiz "Triangle(0) or Square(1)?"
size: .asciiz "\nRequired size? "
star: .asciiz "*"
newline: .asciiz "\n"

.text

main:
	li $v0, 4
	la $a0, msg
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 4
	la $a0, size
	syscall

	li $v0, 5
	syscall
	move $a1, $v0

	li $v0, 4
	la $a0, newline
	syscall

	beq $t0, $zero, triangle
	jal print_square
	j exit
	triangle:
		jal print_triangle
	exit:
		li $v0, 10
		syscall

print_square:
	addi $sp, $sp, -4
	sw $ra, ($sp)

	li $t0, 1
	move $t1, $a1
	print_square_line:
		addi $sp, $sp, -8
		sw $t0, ($sp)
		sw $t1, 4($sp)
		move $a1, $t1
		jal print_star_line
		lw $t1, 4($sp)
		lw $t0, ($sp)
		addi $sp, $sp, 8
		addi $t0, $t0, 1
		ble $t0, $t1, print_square_line

	lw $ra, ($sp)
	addi $sp, $sp, 4
	jr $ra

print_triangle:
	# print a triangle of 'n' lines, where $a1 = n
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	li $t0, 1
	move $t1, $a1
	print_line:
		addi $sp, $sp, -8
		sw $t0, ($sp)
		sw $t1, 4($sp)
		move $a1, $t0
		jal print_star_line
		lw $t1, 4($sp)
		lw $t0, ($sp)
		addi $sp, $sp, 8
		addi $t0, $t0, 1
		ble $t0, $t1, print_line

	lw $ra, ($sp)
	addi $sp, $sp, 4
	jr $ra

print_star_line:
	# print a line with 'n' stars, where $a1 = n
	addi $sp, $sp, -4
	sw $ra, ($sp)
	li $v0, 4
	la $a0, star
	printstar:
		syscall
		addi $a1, $a1, -1
		bgt $a1, $zero, printstar
	la $a0, newline
	syscall
	lw $ra, ($sp)
	addi $sp, $sp, 4
	jr $ra