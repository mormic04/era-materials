#pragma qtrvsim show registers
#pragma qtrvsim show program
#pragma qtrvsim show memory
#pragma qtrvsim focus memory 0x400

.org 0x400
.data
# instance of a ‘struct calc‘. The tester provides its own ‘struct calc‘.
calc:
    .word 0 # operand1
    .word 0 # operand2
    .word 0 # ergebnis
    .byte 0 # operation


.org 0x200
.text
_start:
    la a0, calc
    jal check_calc
    ebreak
# ------------------------------------------------------------
# arguments:
# a0: address of a ‘calc struct‘ instance
# returns:
# a0: 1 if calculation is correct, 0 otherwise
check_calc:
    lw t0, 0(a0) # operand1
    lw t1, 4(a0) # operand2
    lw t2, 8(a0) # ergebnis
    lbu t6, 12(a0) # operation
# ------------------------------------------------------------
# Using a jump table, the following instructions jump to the
# jump_* label that corresponds to the value in t6.
# t6 = 0 -> jump to calc_add
# t6 = 1 -> jump to calc_sub
# t6 = 2 -> jump to calc_mul
# t6 = 3 -> jump to calc_div
# t6 = 4 -> jump to calc_not
# t6 = 5 -> jump to calc_and
# t6 = 6 -> jump to calc_or
# t6 = 7 -> jump to calc_xor
# t6 has another value -> program probably crashes
# Multiply by 4 because each jump table enty is a 32-bit address
    slli t6, t6, 2
    la t5, jumptable
    add t6, t6, t5
    lw t6, 0(t6)
    jalr zero, 0(t6)
# ------------------------------------------------------------
    calc_add:
    add a0, t0, t1
    j calc_result
    calc_sub:
    sub a0, t0, t1
    j calc_result
    calc_mul:
    mul a0, t0, t1
    j calc_result
    calc_div:
    div a0, t0, t1
    j calc_result
    calc_not:
    xori a0, t0, -1
    j calc_result
    calc_and:
    and a0, t0, t1
    j calc_result
    calc_or:
    or a0, t0, t1
    j calc_result
    calc_xor:
    xor a0, t0, t1
    j calc_result
    calc_result:
    beq a0, t2, success
    # fail
    addi a0, zero, 0
    jalr zero, 0(ra)
    success:
    addi a0, zero, 1
    jalr zero, 0(ra)

# ------------------------------------------------------------
.data
jumptable:
    .word calc_add
    .word calc_sub
    .word calc_mul
    .word calc_div
    .word calc_not
    .word calc_and
    .word calc_or
    .word calc_xor