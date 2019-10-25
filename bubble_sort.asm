# implement bubble sort using the given C code as template

# int main()
# {
# 	int Sz = 10;
# 	int List[10] = {17, 5, 92, 87,41, 10, 23, 55, 72, 36} ;
# 	int Stop, Curr, Next, Temp; 
# 	for (Stop = Sz-1; Stop > 0; Stop){
# 		for (Curr = 0; Curr < Stop; Curr++){
# 			Next = Curr + 1;
# 			if (List[Curr] > List[Next]){
# 				Temp = List[Curr];
# 				List[Curr] = List[Next];
# 				List[Next] = Temp;
# 			}
# 		}
# 	}
# 	printf("Sorted list in ascending order:\n");
# 	for (Curr = 0; Curr < Stop; Curr++)
# 	printf("%d\n", List[Curr]);
# }
# NOTE: Incomplete code. There's some bug in this. 

.data

list: .word 17, 5, 92, 87, 41, 10, 23, 55, 72, 36
listSize: .word 10
msg: .asciiz "Sorted list is: "
welcomeMsg: .asciiz "Original list is: "
space: .asciiz " "
endline: .asciiz "\n"

.text

li $v0, 4
la $a0, welcomeMsg
syscall

jal print_array

li $v0, 4
la $a0, endline
syscall

la $a0, list
lw $t0, listSize 
addi $t0, $t0, -1 # Stop

loop1: 
	ble $t0, $zero, out1
	li $t1, 0 # curr
	loop2:
		bge $t1, $t0, out2
		addi $t2, $t1, 1 # next
		sll $t3, $t1, 2
		add $t3, $t3, $a0 # &list[curr]
		sll $t4, $t2, 2
		add $t4, $t4, $a0 # &list[next]
		lw $t5, ($t3) # list[curr]
		lw $t6, ($t4) # list[next]
		ble $t5, $t6, endif
		sw $t5, ($t4)
		sw $t6, ($t3)
		endif: addi $t1, $t1, 1
		addi $t1, $t1, 1
		j loop2
	out2:
	 	addi $t0, $t0, -1
	 	j loop1
out1:

li $v0, 4
la $a0, msg
syscall
jal print_array
exit:
	li $v0, 10
	syscall

print_array:

	lw $t0, listSize
	la $a2, list
	li $t1, 0

	print_sorted:
		beq $t1, $t0, return
		lw $a0, ($a2)
		li $v0, 1
		syscall
		li $v0, 4
		la $a0, space
		syscall
		addi $a2, $a2, 4
		addi $t1, $t1, 1
		j print_sorted

	return:
		jr $ra