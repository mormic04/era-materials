#pragma qtrvsim show registers
#pragma qtrvsim show program
#pragma qtrvsim show memory
#pragma qtrvsim focus memory 0x400

.org 0x400
.data

example: .byte 0x9 
		 .ascii "I <3 ERA!"

.org 0x200
.text
# load startaddr of example
la a0, example

# your code starts here

to_c_string:
# read first byte of start-addr, which gives us the str len
# loop over the string, move byte n to byte n-1 and decrement len counter until counter reaches 0
# write NULL-Byte at the end of the string
# return
