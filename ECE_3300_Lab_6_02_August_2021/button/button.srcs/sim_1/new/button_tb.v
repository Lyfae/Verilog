`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2021 06:17:45 PM
// Design Name: 
// Module Name: button_tb
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

module button_tb(

    );
    reg clk_tb;
    reg buttonSignal_tb;
    reg currentOutput_tb;
    reg previousButtonState_tb;
    wire previousButtonStateOut_tb;
    wire currentOutputOut_tb;
    integer i;
    button butt(.clk(clk_tb), .buttonSignal(buttonSignal_tb), .previousButtonState(previousButtonState_tb), .currentOutput(currentOutput_tb), .previousButtonStateOut(previousButtonStateOut_tb), .currentOutputOut(currentOutputOut_tb));

    initial begin
        clk_tb = 1;
        buttonSignal_tb = 0;
        previousButtonState_tb = 0;
        currentOutput_tb = 0;
    end
    initial begin
        forever begin
            #10 clk_tb = ~clk_tb;
        end
    end
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            buttonSignal_tb = i[1];
            #10 currentOutput_tb = currentOutputOut_tb;
            previousButtonState_tb = previousButtonStateOut_tb;
        end
        #100 $finish;
    end
endmodule
