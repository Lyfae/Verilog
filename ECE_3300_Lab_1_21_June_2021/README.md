# Lab 1 - 2 to 1 Multiplexer -> 4_bit
Submitted by Group G - Paul Thai, Russell Hua and Philbert Chang

## Description
A Mux or a Multiplexer also known as a data selector is a device that selects between the several analog or digital signals and forwards the selected input to a single output line. In our lab, we have 2 4-bit inputs, a 1-bit selector, and 4-bit output that corresponds to 4 LED's. On the FPGA board, we programed it so that the first switch (0) will be the selector, the next four switches (1-4) will be the first input and the next four switches (5-8) will be the second input. If the selector is zero, then it will only read the lows and highs from the first input and if the selector is high, then it will only read the input from the second switches. 

## Test-Bench Description
### Trying Every 4-Bit
Tested every possible 4-bit combination with every possible selector combination.
* Input: Combination of 4-bits for each input with a combination of the selector.
* Output: LED that lights up if the inputs correspond with the correct selector. 

## Video Representation
* Here is a video demoing our lab... Click [Here](https://livecsupomona-my.sharepoint.com/:v:/g/personal/pthai_cpp_edu/EWk1FC1jBENOuZXcgavAp8oBOielZVg2mW7xDj2XClKf6g?e=eulvhq)