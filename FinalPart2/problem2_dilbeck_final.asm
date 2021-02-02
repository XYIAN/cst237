#Kyle Dilbeck
#final exam part2 problem 1
#even or odd program

.data
	greet1: .asciiz "\nWelcome to final part2 problem 2 - Kyle Dilbeck"
	greet2: .asciiz "\nPlease Enter 10 array numbers:"
	greet4: .asciiz "\nPlease enter a number here:"
	greet3: .asciiz "\n\nWould you like to continue?(Y=0/N=1)"
	rangeRes: .asciiz "\nThe range of the array is:"
	avgRes: .asciiz "\nThe average of the array is:"
	line: .asciiz "\n"
	userArray: .space 40
.text
main:
#greeting1 
li $v0, 4
la $a0, greet1
syscall
while:
#greeting2 
li $v0, 4
la $a0, greet2
syscall	
#loop for array input intake	
addi $t0, $zero, 0 #index start at 0
populateArray:
#first enrty 
	li $v0, 4
	la $a0, greet4
	syscall
	#take num input 
	li $v0, 5 
	syscall
	sb $v0, userArray($t0) #move input num into register s0
	loop:
#increase index
	addi $t0, $t0, 4
#indexed entry
	li $v0, 4
	la $a0, greet4
	syscall
#take num input 
	li $v0, 5 
	syscall
	sb $v0, userArray($t0)
	bne $t0, 40, loop
j range

			
continue:
#greeting3 
li $v0, 4
la $a0, greet3
syscall
li $v0, 5 
syscall
move $t2, $v0 #move continue num into register t2
beq $t2, $zero, while
endwhile:
#########
exit:
li $v0, 10 
syscall
#########
range:
    #int max=INT_MIN; 
    #int min= INT_MAX;  
    #for(int i = 0 ; i < 10 ; i++){
    #    //find max 

    #    if(max < inputArr[i]){
    #        max = inputArr[i];
    #    } 
    #}
    #for(int j = 0 ; j < 10 ; j++){
    #    //find min
    #    if(min > inputArr[j]){
    #        min = inputArr[j]; 
    #    }
    #     
    #}    //sub max from min
    #//cout << "MAX IS:"<<max  <<endl << "MIN IS:"<< min << endl; 
    #return (max-min); 
    #print result
li $v0, 4
la $a0, rangeRes
syscall 
    
j average	
########
average:
addi $s2, $zero, 0 #index for array
addi $s3, $zero, 0 #sum val sum=0
avgLoop:
lb $s4,userArray($s2)  # Load the number from array 
addu $s3, $s3, $s4 # Compute the sum
addi $s2, $s2, 4 #increase index
bne $s2, 40, avgLoop
#print result
li $v0, 4
la $a0, avgRes
syscall
li $v0, 1       
li $s3, 5       # $integer to print
syscall  
li $v0, 4
la $a0, line
syscall	       
j continue
    