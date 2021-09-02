`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2021 06:31:10 PM
// Design Name: 
// Module Name: button_top_tb
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


module button_top_tb(

    );
    reg button_tb;
    reg clk_tb;
    wire toggle_tb;
    integer i;
    button_top butt(
    	.button (button_tb ),
        .clk_in (clk_tb ),
        .toggle (toggle_tb )
    );
    initial begin
        button_tb = 0;
        clk_tb = 1;
    end
        initial begin
        forever begin
            #10 clk_tb = ~clk_tb;
        end
    end
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            #10 button_tb = i[1];
        end
        #100 $finish;
    end

endmodule
