`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2021 03:44:39 PM
// Design Name: 
// Module Name: dmux
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


module dmux(
    input dsel, input [15:0] in, output reg [15:0] out0, output reg [15:0] out1
    );
    always @(dsel or in)
        begin
        case (dsel)
            0: out0 = in;
            1: out1 = in;
        endcase
    end
endmodule
