`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2021 06:17:26 PM
// Design Name: 
// Module Name: button
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


// This module contains functionality to toggle an output every button press. The current state of the output and the button is used/initialized outside of the module and are updated after this module triggers. For extra robustness, provide it a slower clock so the bouncing effect of the button is reduced.
module button(
    input clk,
    input buttonSignal,
    input previousButtonState,
    input currentOutput,
    output reg previousButtonStateOut,
    output reg currentOutputOut
    );
    always @ (posedge clk) begin
        previousButtonStateOut <= buttonSignal;
        if (~previousButtonState && buttonSignal)
            currentOutputOut <= ~currentOutput;
        else
            currentOutputOut <= currentOutput;
    end
endmodule
