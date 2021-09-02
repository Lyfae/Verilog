`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2021 06:23:04 PM
// Design Name: 
// Module Name: button_top
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


module button_top(
    input button,
    input clk_in,
    output toggle
    );
    reg previousButtonStateTop, currentOutputTop;
    wire currentOutputOutTop, previousButtonStateOutTop;
    initial begin
        previousButtonStateTop = 0;
        currentOutputTop = 0;
    end
    button butt(.clk(clk_in), .buttonSignal(button), .previousButtonState(previousButtonStateTop), .currentOutput(currentOutputTop), .previousButtonStateOut(previousButtonStateOutTop), .currentOutputOut(toggle));
    always@(clk_in, previousButtonStateOutTop, toggle) begin
        previousButtonStateTop = previousButtonStateOutTop;
        currentOutputTop = toggle;
    end
endmodule
