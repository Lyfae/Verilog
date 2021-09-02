`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2021 03:57:18 PM
// Design Name: 
// Module Name: dmux_tb
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


module dmux_tb();
    reg dsel_tb;
    reg [15:0] a_tb;
    wire [15:0] out0_tb;
    wire [15:0] out1_tb;


    dmux X(.dsel(dsel_tb), .in(a_tb), .out0(out0_tb), .out1(out1_tb));
    
    initial begin
        dsel_tb = 0;
        a_tb = 16'b1111111111111111;
    #10
        dsel_tb = 1;
        a_tb = 16'b1111111000111111;
    #100
        $finish;
    end
endmodule
