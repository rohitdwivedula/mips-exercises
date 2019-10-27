# Write a recursive MIPS assembly program to print the nth number of Fibonacci sequence
# Input: Single Integer (6)
# Output : Single Integer (8)

# int fib(int n)
# {
# 	if (n == 0) return 0;
# 	else if (n == 1) return 1;
# 	return fib(n - 1) + fib(n – 2);
# }
# void main()
# {
# 	int n;
# 	printf(“Please enter a non negative integer :”);
# 	scanf(“%d”,&n);
# 	ans=fib(n);
# 	printf(“The %dth fibonacii number is %d.”,n,ans);
# 	exit(0);
# }

.data

msg: .asciiz "Enter a number: "
fibNum: .asciiz "\nFibonacci number is: "
.text

main:
	# print message
	li $v0, 4
	la $a0, msg
	syscall

	# take input and print to screen
	li $v0, 5
	syscall
	move $a0, $v0
	li $v0, 1
	syscall

	jal fib

	move $a1, $v0
	li $v0, 4
	la $a0, fibNum
	syscall

	li $v0, 1
	move $a0, $a1
	syscall

	# exit
	li $v0, 10
	syscall

fib: # variables modified: $a0, $t0, $v0
	addi $sp, $sp, -4
	sw $ra, ($sp)
	
	beq $a0, $zero, return_zero
	li $t0, 1
	beq $a0, $t0, return_one
	
	addi $a0, $a0, -1
	
	addi $sp, $sp, -8
	sw $a0, ($sp)
	sw $t0, 4($sp)
	jal fib
	lw $a0, ($sp)
	lw $t0, 4($sp)
	addi $sp, $sp, 8

	move $t0, $v0
	addi $a0, $a0, -1

	addi $sp, $sp, -8
	sw $a0, ($sp)
	sw $t0, 4($sp)
	jal fib
	lw $a0, ($sp)
	lw $t0, 4($sp)
	addi $sp, $sp, 8

	add $v0, $v0, $t0

	exit: 
		lw $ra, ($sp)
		addi $sp, $sp, 4
		jr $ra
	return_zero:
		move $v0, $zero
		j exit
	return_one:
		move $v0, $zero
		addi $v0, $v0, 1
		j exit