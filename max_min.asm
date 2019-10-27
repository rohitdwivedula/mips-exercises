# Find Minimum and maximum values of array


.data

array:      .word   5, 7, 12, 3, 4, 9, 6, 11, 2, 10
array_size: .word   10
array_min:  .asciiz "\nMin: " 
array_max:  .asciiz "\nMax: "

.text

main:   
    la $a0, array
    lw $a1, array_size
    lw $t2, ($a0) # max
    lw $t3, ($a0) # min
    loop_array:
        beq $a1, $zero, print_and_exit
        lw $t0, ($a0)
        bge $t0, $t3, not_min # if (current_element >= current_min) {don't modify min} 
        move $t3, $t0
        not_min:
        ble $t0, $t2, not_max # if (current_element <= current_max) {don't modify max}
        move $t2, $t0
        not_max:
        addi $a1, $a1, -1
        addi $a0, $a0, 4
        j loop_array

    print_and_exit:
    # print minimum
    li $v0, 4
    la $a0, array_max
    syscall

    li $v0, 1
    move $a0, $t2
    syscall 

    # print maximum
    li $v0, 4
    la $a0, array_min
    syscall

    li $v0, 1
    move $a0, $t3
    syscall 

    # exit
    li $v0, 10
    syscall