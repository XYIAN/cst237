#Kyle Xyian Dilbeck 
#Homework 9 cst237

.data 
	greeting: .asciiz "-->Kyle Dilbeck's Homework 9 output<-- \n Please enter a number to factorial:"
	display1: .asciiz "The factorial of "
	display2: .asciiz " is:"

.text 
###################VARIABLE REFERENCE#################
# input :: x :: $s2 
#stack :: factorial function
#        $s0 :: function x
#        $ra :: function result
 
main:
	#greeting
	li $v0, 4
	la $a0, greeting
	syscall 
	#get input and store in $s0
	li $v0, 5 
	syscall
	move $s2, $v0
	#display1
	li $v0, 4
	la $a0, display1
	syscall
	li $v0, 1
	move $a0, $s2
	syscall
	li $v0, 4
	la $a0, display2
	syscall
	jal factorial
	#display results 
	move $s2, $v0
	li $v0, 1
	move $a0, $s0
	syscall 
exit:
	li $v0, 10
	syscall 
factorial:
    addi    $sp, $sp, -8
    # save $s0 and $ra
    sw      $s0, 4($sp)
    sw      $ra, 0($sp)
    #base case return 1 if x = 0; 
    bne     $a0, 0, else
    addi    $v0, $zero, 1  
    j fact_return#base case hit end/return factorial function $ra
else:#base case not hit, reset $a0
    move    $s0, $a0
    addi    $a0, $a0, -1 # x -= 1 recursive case 
    jal     factorial
    # when we get here, we already have Fact(x-1) store in $v0
    multu   $s0, $v0 # return x*Fact(x-1)
    mflo    $v0
fact_return:
    lw      $s0, 4($sp)#pop and send 
    lw      $ra, 0($sp)
    addi    $sp, $sp, 8
    jr      $ra
	