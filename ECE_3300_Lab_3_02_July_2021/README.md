# Lab 3 - 16 bit Full Adder
Submitted by Group G - Paul Thai, Russell Hua and Philbert Chang

## Description
A full adder is a circuit that adds two binary values along with a carry in. The result is the sum of the two and a carry out. The objective is to create a 16 bit full adder and implement it on the board. Due to limitations to the FPGA development board, the input needs to use a demultiplexor, one for the first value to add and the second value to add. The demultiplexor will select which output the input goes to by using a button. Finally one more button will be used to set the carry in value. The output will be represented on the LEDs: 16 above the board for the sum, and two rgb LEDs - one for the carry in, and another for the carry out.
## Test-Bench Description
### Tests
FA Merge: For this file, a few tests of adding with carry in were used by using the select input to set the values to add. Initially, the full adder output is invalid since only one of the two values to add are undefined. After they are both set, the output is correct.
dmux: For this file, the test cases was using the select bit to choose what the output should be and the result was correct
full adder 16: For this file, the test cases were adding with carry and checking the output and the carry out. The behavior of the module was as expected.

## Video Representation
Here is a video demoing our lab... Click Here: https://youtu.be/ESgLgpG-QsU
