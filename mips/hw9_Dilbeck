#Kyle Dilbeck
#Homework 9 - cst237 
#hw9.asm -> facotrial calculator (no loop required)

.data
    greeting: .asciiz "\nWelcome to Kyle Dilbeck's Homework 9, factorial calculator\n ------->Please enter a number to factorial:"
    display1: .asciiz "\nThe factorial of "
    display2: .asciiz " is: "
.text
###################VARIABLE REFERENCE#################
# input :: x :: $s4 -must use s registers 
#stack :: factorial function stack
#        $s0 ::  x
#        $s2 ::  stored recurse
#        $ra ::  result
main:
    # greeting cout<< greeting << endl; 
    li        $v0, 4
    la        $a0, greeting
    syscall
    #take user input
    #cin >> input; 
    li $v0, 5
    syscall
    add $s4, $zero, $v0 
    #cout you entered x:
    li $v0, 4
    la $a0, display1
    syscall
    li $v0, 1 
    move $a0, $s4
    syscall
    #factorial(input); 
    #move      $a0, $s4
    jal      factorial       # jump factorial and save position to $ra
    move      $s2, $v0        # $s0 = $v0 move into s register as required
    #display result
    li        $v0, 4
    la        $a0, display2
    syscall
    li        $v0, 1        
    move      $a0, $s2
    syscall 
    # return 0 / exit 
    li        $v0, 10      
    syscall
#int factorial(int input){
factorial:
    # adjust stack pointer to store return address and argument, base case in parent stack
    addi    $sp, $sp, -8
    sw      $s0, 4($sp)
    sw      $ra, 0($sp)
    bne     $a0, 0, recurse
    addi    $v0, $zero, 1    # return 1
    j return

recurse:
    move    $s0, $a0 #save a0 in s0 register to use a0
    addi    $a0, $a0, -1 # x -= 1 recursive case 
    jal     factorial
    # when we get here, we already have Fact(x-1) store in $v0
    multu   $s0, $v0 # return x*Fact(x-1)
    mflo    $v0
return:
    #access stack for stored return values 
    lw      $s0, 4($sp)
    lw      $ra, 0($sp)
    addi    $sp, $sp, 8
    jr      $ra