`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CPP
// Engineer: Russell, Philbert, Paul
// 
// Create Date: 06/17/2021 12:49:11 AM
// Design Name: FourBit2x1Mux
// Module Name: FourBit2x1Mux
// Project Name: FourBit2x1Mux
// Target Devices: Nexys A7
// Tool Versions: 
// Description: This is a four bit 2x1 Mux with structural modeling
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux2to1_4bit(

    output [3:0]F,
    input Select,
    input [3:0]A,B 
    );
    // Use four 2x1 muxes to implement the four bit 2x1 mux
    mux2to1 mux3(F[3], Select, A[3],B[3]);
    mux2to1 mux2(F[2], Select, A[2],B[2]);
    mux2to1 mux1(F[1], Select, A[1],B[1]);
    mux2to1 mux0(F[0], Select, A[0],B[0]);
endmodule
