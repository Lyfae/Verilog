`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2021 07:00:12 PM
// Design Name: 
// Module Name: FA_TB_16
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


module FA_TB_16();
    reg [15:0] A_tb;
    reg [15:0] B_tb;
    reg Cin_tb;
    wire Cout_tb;
    wire [15:0] out_tb; 

    full_adder_16 fa_tb (.CInput(Cin_tb), .InputA_n(A_tb), .InputB_n(B_tb), .SumOutput_n(out_tb), .COutput_n(Cout_tb));

    initial begin
        A_tb = 16'd0;
        B_tb = 16'd0;
        Cin_tb = 0;
        # 10
        A_tb = 16'd6;
        B_tb = 16'd9;
        Cin_tb = 0;
        # 10
        A_tb = 16'd1;
        B_tb = 16'd1;
        Cin_tb = 0;
        # 10
        A_tb = 16'd0;
        B_tb = 16'd1;
        Cin_tb = 0;
        # 10
        A_tb = 16'd6000;
        B_tb = 16'd1;
        Cin_tb = 0;
        # 10
        A_tb = 16'd10;
        B_tb = 16'd3;
        Cin_tb = 1;
        # 10
        A_tb = 16'd65515;
        B_tb = 16'd263;
        Cin_tb = 1;
        # 100
            $finish;
    end

endmodule
