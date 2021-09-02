`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2021 02:23:40 PM
// Design Name: 
// Module Name: decoder_tb
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


module decoder4to16bit_tb();

    reg [3:0] a_tb;
    reg en_tb;

    wire [15:0] out;
    
    decoder_4to16_4bit X (.A(a_tb[0]), .B(a_tb[1]), .C(a_tb[2]), .D(a_tb[3]), .En(en_tb), .SUM(out));
    initial
        begin
            a_tb = 4'd0;
            en_tb = 1;
        #10
            a_tb = 4'd1;
            en_tb = 1;
        #10
            a_tb = 4'd2;
            en_tb = 1;
        #10
            a_tb = 4'd3;
            en_tb = 1;
        #10
            a_tb = 4'd4;
            en_tb = 1;
        #10
            a_tb = 4'd5;
            en_tb = 1;
        #10
            a_tb = 4'd6;
            en_tb = 1;
        #10
            a_tb = 4'd7;
            en_tb = 1;
        #10
            a_tb = 4'd8;
            en_tb = 1;
        #10
            a_tb = 4'd9;
            en_tb = 1;
        #10
            a_tb = 4'd10;
            en_tb = 1;
        #10
            a_tb = 4'd11;
            en_tb = 1;
        #10
            a_tb = 4'd12;
            en_tb = 1;
        #10
            a_tb = 4'd13;
            en_tb = 1;
        #10
            a_tb = 4'd14;
            en_tb = 1;
        #10
            a_tb = 4'd15;
            en_tb = 1;

        #10
            a_tb = 4'd0;
            en_tb = 0;
        #10
            a_tb = 4'd1;
            en_tb = 0;
        #10
            a_tb = 4'd2;
            en_tb = 0;
        #10
            a_tb = 4'd3;
            en_tb = 0;
        #10
            a_tb = 4'd4;
            en_tb = 0;
        #10
            a_tb = 4'd5;
            en_tb = 0;
        #10
            a_tb = 4'd6;
            en_tb = 0;
        #10
            a_tb = 4'd7;
            en_tb = 0;
        #10
            a_tb = 4'd8;
            en_tb = 0;
        #10
            a_tb = 4'd9;
            en_tb = 0;
        #10
            a_tb = 4'd10;
            en_tb = 0;
        #10
            a_tb = 4'd11;
            en_tb = 0;
        #10
            a_tb = 4'd12;
            en_tb = 0;
        #10
            a_tb = 4'd13;
            en_tb = 0;
        #10
            a_tb = 4'd14;
            en_tb = 0;
        #10
            a_tb = 4'd15;
            en_tb = 0;
        #100
            $finish;
        end
endmodule
