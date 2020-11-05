#Kyle Dilbeck 
#in class practice problems

.data 
message1: .asciiz "f = "
.text

main:  
# f =  $s0  
# g = 1 -> g = $t0 
# h = 2 -> h = $t1  
# j = 4 -> j = $t2
# i = 3 -> i = t$t5
# f = (g + h) - (i + j)
li $t0, 1
li $t1, 2
li $t2, 4 
li $t5, 3
# $t3 = (i + j)    
add $t3, $t2, $t5
# $t4 =  (g + h)    
add $t4, $t0, $t1
# f = $t4 - $t3    
sub $s0, $t4, $t3
# print out "f = " and $s0 
li $v0, 4
la $a0, message1
syscall
li $v0, 1
move $a0, $s0
syscall

# ** terminate program ** 
li $v0, 10     
syscall 
# ***End the Main Program***

