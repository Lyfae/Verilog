`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2021 01:43:36 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input reset,
    input [4:0] SW, 
    input enable, 
    input up_down,
    input load,
    input [3:0] in,
    input [2:0] select,
    output wire [6:0] a_to_g,
    output wire [7:0] an,
    output wire dp
);
          
wire temp1; 
clk_divider  GEN(
    .clk(clk),
    .reset(reset),
    .SW(SW), 
    .clk_div(temp1)
); 
          
wire [31:0] temp2;                 

BCD_32_bit  BCD(
    .clk(temp1),
    .reset(reset),
    .en(enable),
    .up_down(up_down),
    .load(load),
    .in(in),
    .select(select),
    .set(temp2)
);
                          
ssd display(
    .SW(temp2),
    .clk(clk),
    .reset(reset),
    .a_to_g(a_to_g),
    .an(an),
    .dp(dp)
);                 
          
endmodule