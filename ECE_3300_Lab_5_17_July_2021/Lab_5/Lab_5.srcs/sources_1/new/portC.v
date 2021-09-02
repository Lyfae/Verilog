`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2021 01:48:24 PM
// Design Name: 
// Module Name: portA
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


module portC #(parameter MAX_COUNT = 100_000_000-1) 
(
            input [11:0] SW, // [3:0] SW is port A, [4] SW is sign for port A, [5:8] SW is port B, [9] SW is port B sign, [11:10] SW is operation
            input mclk,
            input S, 
            output reg [6:0] a_to_g_c,
            output reg [7:0] AN

                                                    ); 
            reg [19:0] blink_refresh;
            wire sseg_activate;


    always @ (posedge mclk)
        begin
                blink_refresh <= blink_refresh + 1'b1;
        end
        
        assign sseg_activate = blink_refresh[19:18];

        
        portA dutA(SW, SW[4], mclk, a_to_g_c, AN);
        
        portB dutB(SW, SW[9], mclk, a_to_g_c, AN);
endmodule
