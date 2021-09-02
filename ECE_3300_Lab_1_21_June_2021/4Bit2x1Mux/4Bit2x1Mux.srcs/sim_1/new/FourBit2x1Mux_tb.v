`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CPP
// Engineer: Russell, Philbert, Paul
// 
// Create Date: 06/17/2021 12:49:11 AM
// Design Name: FourBit2x1Mux
// Module Name: FourBit2x1Mux_tb
// Project Name: FourBit2x1Mux
// Target Devices: Nexys A7
// Tool Versions: 
// Description: This is a four bit 2x1 Mux using behavioral modeling
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FourBit2x1Mux_tb(

    );
    reg s_tb;
    reg [3:0] a_tb;
    reg [3:0] b_tb;
    wire [3:0] c_tb;
    FourBit2x1Mux X (.s(s_tb), .a(a_tb), .b(b_tb), .c(c_tb));
    initial
        begin
            a_tb = 4'b0000;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0001;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0010;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0011;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0100;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0101;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0110;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0111;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b1000;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b1001;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b1010;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b1011;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b1100;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b1101;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b1110;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b1111;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0001;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0010;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0011;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0100;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0101;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0110;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0111;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1000;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1001;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1010;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1011;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1100;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1101;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1110;
            s_tb = 1'b0;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1111;
            s_tb = 1'b0;

        #10
            a_tb = 4'b0000;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0001;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0010;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0011;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0100;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0101;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0110;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0111;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b1000;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b1001;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b1010;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b1011;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b1100;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b1101;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b1110;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b1111;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0001;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0010;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0011;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0100;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0101;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0110;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b0111;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1000;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1001;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1010;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1011;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1100;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1101;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1110;
            s_tb = 1'b1;
        #10
            a_tb = 4'b0000;
            b_tb = 4'b1111;
            s_tb = 1'b1;
        #100
            $finish;
        end
endmodule
