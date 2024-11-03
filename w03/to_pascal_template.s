#pragma qtrvsim show registers
#pragma qtrvsim show program
#pragma qtrvsim show memory
#pragma qtrvsim focus memory 0x400

.org 0x400
.data

example: .asciz "I <3 ERA!"

.org 0x200
.text
# load startaddr of example
la a0, example

# your code starts here

to_pascal:
# init a counter variable
# loop over the string byte for byte and move byte n to byte n+1
# count how many bytes you moved until reaching null-byte (terminating the c string)
# write count into the first byte @ startaddr
# return


