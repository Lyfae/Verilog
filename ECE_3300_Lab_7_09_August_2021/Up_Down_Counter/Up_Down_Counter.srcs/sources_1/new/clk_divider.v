`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2021 11:57:39 AM
// Design Name: 
// Module Name: clk_divider
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

module clk_divider(
    input clk,
    input reset,
    input [4:0] SW, 
    output reg clk_div
);

reg [31:0] count; 
                  
always@(posedge clk or posedge reset)
begin 
    if (reset)
        count <= 0;
    else 
        count <= count + 1; 
end

integer i;
always@(posedge clk or posedge reset)
begin 
    if (reset)
        clk_div <= 1'b0;
    else
    begin
        for (i = 0; i < 32; i = i + 1)
            if (SW == i)
                clk_div <= count[i];
    end
end 

endmodule