.data
array: .space  40
input:  .asciiz "\nInput a element"
semicolon: .asciiz  ":"
Element: .asciiz " \nElement"

.text
main:

li $t0,0
li $t1,1
li $t2,0

TakeInputInArray:
beq $t0, 40, makeRegisterZero
#print the input statement
 li $v0,4
 la $a0,input
 syscall

#user input value take in reg t1
 li $v0,1
 move $a0,$t1
 syscall

 li $v0,4
 la $a0,semicolon
 syscall

#user input value store in reg t2
 li $v0,5
 syscall
 move $t2,$v0
 


#store the value  in array
 sw  $t2,array($t0)
 #increament the index
 add $t0,$t0,4
 #increament the loop
 add $t1,$t1,1
 b TakeInputInArray

makeRegisterZero:

 
    li $t0,0
    li $t1,1
    li $t2,0


PrintArray:
beq $t0, 40, end
lw $t2,array($t0)

 li $v0,4
 la $a0,Element
 syscall

 li $v0,1
 move $a0,$t1
 syscall

 li $v0,4
 la $a0,semicolon
 syscall
 
 li $v0,1
 move $a0,$t2
 syscall

 add $t0,$t0,4
 add $t1,$t1,1
 b PrintArray


end:
li $v0,10
syscall