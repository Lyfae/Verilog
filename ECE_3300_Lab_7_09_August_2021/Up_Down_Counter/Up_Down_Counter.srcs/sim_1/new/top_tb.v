`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2021 09:25:00 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb(

    );
    reg clk_tb;
    reg reset_tb;
    reg [4:0] SW_tb;
    reg enable_tb;
    reg up_down_tb;
    reg load_tb;
    reg [3:0] in_tb;
    reg [2:0] select_tb;
    wire [6:0] a_to_g_tb;
    wire [7:0] an_tb;
    wire dp_tb;
    integer i;
    top test_top(
        .clk     (clk_tb     ),
        .reset   (reset_tb   ),
        .SW      (SW_tb      ),
        .enable  (enable_tb  ),
        .up_down (up_down_tb ),
        .load    (load_tb    ),
        .in      (in_tb      ),
        .select  (select_tb  ),
        .a_to_g  (a_to_g_tb  ),
        .an      (an_tb      ),
        .dp      (dp_tb      )
    );
    
    initial begin
        clk_tb = 0;
        reset_tb = 1;
        enable_tb = 0;
        up_down_tb = 0;
        load_tb = 0;
        SW_tb = 0;
        in_tb = 0;
        select_tb = 0;
    end
    initial begin
        forever begin
            #10 clk_tb = ~clk_tb;
        end
    end
    initial begin
        #10 reset_tb = 0;
        for (i = 0; i < 32768; i = i + 1) begin
            #10 SW_tb = i[4:0];
            enable_tb = i[5];
            up_down_tb = i[6];
            load_tb = i[7];
            in_tb = i[11:8];
            select_tb = i[14:12];
        end
        #100 $finish;
    end
endmodule
