# find length of string stored in data segment

.data
welcomeMsg: .asciiz "Checking string:\n"
string: .asciiz "abcdefghijklmnopqrstuvwxyz"
endline: .asciiz "\n"
endMsg: .asciiz "Length is: "
.text

main:
	li $v0, 4
	la $a0, welcomeMsg
	syscall
	la $a0, string
	syscall
	la $a0, endline
	syscall
	la $a0, endMsg
	syscall

	la $a1, string
	li $t1, -1
	loop:
		lb $t0, ($a1)
		addi $a1, $a1, 1
		addi $t1, $t1, 1
		bne $t0, $zero, loop
	# print length
	move $a0, $t1
	li $v0, 1
	syscall

	li $v0, 10
	syscall