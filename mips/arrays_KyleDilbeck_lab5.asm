# arrays_KyleDilbeck.asm
#   <Kyle Dilbeck> Team Member 1> - CST 237 Fall 20 Online
# <Jennifer Jopez> Team Member 2> - CST 237 Fall 20 Online
#   <Isaac Hirzel> Team Member 3> - CST 237 Fall 20 Online
#  <Nicole Webber> Team Member 4> - CST 237 Fall 20 Online

.data  
	fibonacci: .word 1,1,2,3,5,8,13
	comma: .asciiz ", "
	fib_length: .word 7
	print_len: .word 6
.text  

main:  # main function starts here
	# int i = 0; $t0 will be our index i
	li $t0, 0
	# $s0 is a pointer to fibonacci
	la $s0, fibonacci
while:
# while (i != fib_length) {; $t1 = fib_length 
	lw $t1, fib_length
	beq $t0, $t1, endwhile
	lw $t4, print_len 
# printf("%d",fibonacci[i]); $s0 = *fibonacci
# store the index offset in $t2 -> (i*4)
	sll $t2, $t0, 2
# get fibonacci[i] into $t3
# -> fibonacci address ($s0) + index offset ($t2)
	add $t3, $s0, $t2
# print fibonacci[i]
	lw $a0, 0($t3)
	addi $v0, $zero, 1
	syscall
#print comma
	beq $t0, $t4, skipComma
        la $a0, comma 
        li $v0, 4 
        syscall
skipComma:
# i++;
	addi $t0, $t0, 1
	j while
endwhile:# } end while

exit:# exit cleanly
	li $v0, 10  #exit code for MARS
	syscall

