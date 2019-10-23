# basic floating point arithmetic manipulation

.data

float_val: .float 0.001
double_val: .double 0.002
floatMsg: .asciiz "FP number entered is: "
doubleMsg: .asciiz "Double is: "
newline: .asciiz "\n"

.text

main:
	# print FP number
	l.s $f12, float_val
	li $v0, 2
	syscall
	jal print_new_line

	# print double precision number
	l.d $f12, double_val
	li $v0, 3
	syscall
	jal print_new_line

	# read float
	li $v0, 6
	syscall
	mov.s $f3, $f0

	# read double
	li $v0, 7
	syscall

	# print float
	li $v0, 4
	la $a0, floatMsg
	syscall
	li $v0,2
	mov.s $f12, $f3
	syscall
	jal print_new_line

	# print double
	li $v0, 4
	la $a0, doubleMsg
	syscall
	li $v0, 3
	mov.d $f12, $f0
	syscall
	jal print_new_line

	# convert float to double
	cvt.d.s $f4, $f3

	# sum of numbers
	add.d $f12, $f4, $f0
	li $v0, 3
	syscall
	jal print_new_line

	# difference of numbers
	sub.d $f12, $f4, $f0
	li $v0, 3
	syscall
	jal print_new_line

	# exit
	li $v0, 10
	syscall

print_new_line:
	li $v0, 4
	la $a0, newline
	syscall
	jr $ra