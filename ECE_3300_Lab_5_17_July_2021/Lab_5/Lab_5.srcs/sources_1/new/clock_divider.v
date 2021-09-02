`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2021 08:27:46 PM
// Design Name: 
// Module Name: clock_divider
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

//`define const 50000000
`define dp_off   1'b1 
`define initial_digit 8'b11111111
module clock_divider(
                input [31:0] SW,
                input clk,
                input rst,
                output reg [6:0] a_to_g,
                output reg [7:0] an,
                output wire dp
                    );
                    
reg [31:0] count;
localparam const = 50000000;

always@(posedge clk or posedge rst)
    begin
        if(rst==1'b1)begin
            count <=32'b0;
            clk_div <=1'b0;
            end
        else begin
         if (count == const-1) begin
            count <=32'b0;
            clk_div <= ~clk_div;
           end
        else begin
            count <= count + 1;
            clk_div <= clk_div;
         end
     end
 end
    

endmodule
