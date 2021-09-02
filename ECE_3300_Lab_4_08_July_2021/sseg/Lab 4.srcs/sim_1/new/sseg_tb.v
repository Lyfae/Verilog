`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2021 08:51:31 PM
// Design Name: 
// Module Name: sseg_tb
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


module x7seg_tb();
    reg SW_tb, reset_tb, mclk_tb;
    wire [6:0] a_to_g_tb;
    wire [7:0] AN_tb;
    wire DP_tb;
    
    
    initial begin
        SW_tb = 0;
        reset_tb = 0;
        mclk_tb = 0;
    end
    
    initial begin
        forever begin
        #1 mclk_tb = ~mclk_tb;
        end
    end
    sseg TB(SW_tb, mclk_tb, reset_tb, a_to_g_tb, AN_tb, DP_tb);
    initial begin
        #10
        SW_tb = 1;
        #100
        SW_tb = 0;
        #100000000
        SW_tb = 1;
        #100000000
        $finish;
    end
endmodule
