`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2021 04:19:03 PM
// Design Name: 
// Module Name: full_adder_16
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


module full_adder_16 #(parameter SIZE = 16)(
    input CInput, input [SIZE - 1:0] InputA_n, input [SIZE - 1:0] InputB_n, output [SIZE - 1:0] SumOutput_n, output COutput_n
    );


    wire [SIZE:0] w;
    assign w[0] = CInput;

    genvar i;
    
    for (i = 0; i<SIZE; i = i + 1)
    begin
        full_adder FA_IT (.X(InputA_n[i]), .Y(InputB_n[i]), .Cin(w[i]), .Sum(SumOutput_n[i]), .Cout(w[i+1]));
    end
    assign COutput_n = w[SIZE];
endmodule
