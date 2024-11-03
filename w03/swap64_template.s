#pragma qtrvsim show registers
#pragma qtrvsim show program
#pragma qtrvsim show memory
#pragma qtrvsim focus memory 0x400

.org 0x400
.data

example: .word 1,2,3,4

.org 0x200
.text
# load startaddr of example
la a0, example
# select which element n to be swapped with n+1
addi a1, zero, 0

#your code starts here

#addr = startaddr + a1 * 8


#swap bytes








# return
