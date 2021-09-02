`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2021 03:55:51 PM
// Design Name: 
// Module Name: full_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module full_adder (
    input X, input Y, input Cin,
    output Sum, output Cout
);
    wire w0,w1,w2;

    xor xor0(w0,X,Y);
    xor xor1(Sum,w0,Cin);
    and and0(w1,X,Y);
    and and1(w2,w0,Cin);
    or   or0(Cout,w2,w1);
    
endmodule
