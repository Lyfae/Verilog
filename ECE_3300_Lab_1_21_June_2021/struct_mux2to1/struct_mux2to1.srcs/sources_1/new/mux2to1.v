`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2021 02:35:48 PM
// Design Name: 
// Module Name: mux2to1
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


module mux2to1(F,Select,i0,i1);
    input Select, i0, i1;
    output F;
    
    wire w1, w2, w3; 
    
    not not_sel(w1,Select);
    and top_and(w2,w1,i0);
    and bot_and(w3,Select,i1);
    or mid_or(F,w2,w3);
    
endmodule
