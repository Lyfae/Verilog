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
// Description: This is a four bit 2x1 Mux using behavioral modeling
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FourBit2x1Mux(
    input s,
    input [3:0] a,
    input [3:0] b,
    output reg [3:0] c
    );
    always @ (s or a or b)
    // based on the select, assign the output to the corresponding input
    case (s)
        1'b0 : c[3:0] = a[3:0];
        1'b1 : c[3:0] = b[3:0];
    endcase
endmodule
