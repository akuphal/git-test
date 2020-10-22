### MIPS32 sample program (using QtSpim)
###
### Configuration:
###     Make sure that in preferences -> MIPS, choose/click "Simple Machine"
###     (Two options are selected: "Accept Pseudo Instructions", "Enable Mapped IO")
###     Also, unchecked "Load Exception Handler" to simplify the output in the GUI
###
### Note:
###     This example shows some problems in load operations. 

### --------------------------
### This is the data segment
### --------------------------
    .data

my_string: .asciiz  "Hello, World!"

### ----------------------------------------------------
### This is the user text segment (instructions go here)
### ----------------------------------------------------
    .text
    .globl  main

main:
    li $t1, 0 # temp var counter for loop 
    li $t2, 10 # exit condition 
Loop: 
    beq $t2, $t1, Exit #at 10 we go to Exit, defined below 
    addi $t1, $t1, 1 #increment counter 
    syscall #calls service 33, playing music 
    j Loop #jumps back to the top of loop 
 
Exit: #ends the program 
    li $v0,10 #loads the service that exits 
    syscall 

.end main
### End of file
