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
slli a1, a1, 3 ; mul by 8
add a1, a1, a0
#swap bytes
lw t0, 0(a1)
lw t1, 8(a1)
sw t1, 0(a1)
sw t0, 8(a1)
lw t0, 4(a1)
lw t1, 12(a1)
sw t1, 4(a1)
sw t0, 12(a1)
# return
jalr zero, 0(ra)