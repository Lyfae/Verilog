`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2021 02:12:29 PM
// Design Name: 
// Module Name: testT
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


module portA_tb #(parameter MAX_COUNT_tb = 3-1) ();
    reg [11:0] SW_tb; // SW[3:0] is port a, SW[4] is port as, SW[8:5] is port b, SW[9] is port bs
    reg mclk_tb;
    wire [6:0] a_to_g_tb;
    wire [7:0] AN_tb;
    wire signed [8:0] out_tb;

    integer i;
    integer j;
    integer k;
    portA #(.MAX_COUNT(MAX_COUNT_tb), .MAX_INNER_COUNT(MAX_COUNT_tb-1)) test(.SW(SW_tb), .mclk(mclk_tb), .a_to_g(a_to_g_tb), .AN(AN_tb));
    initial begin
        SW_tb = 4'b0;
        mclk_tb = 0;
        SW_tb[4] = 0;
        SW_tb[9] = 0;
    end
    initial begin
        forever begin
            #10 mclk_tb = ~mclk_tb;
        end
    end
    initial begin
        for (k = 0; k < 4; k = k + 1) begin
            #50 SW_tb[11:10] = k;
            for (i = 0; i < 32; i = i + 1) begin
                #20 SW_tb[4:0] = i;
                #50 for (j = 0; j < 32; j = j + 1) begin
                    #20 SW_tb[9:5] = j;
                    if (AN_tb == (8'b11111110) || AN_tb == 8'b11111011 || AN == 8'b11011111 || AN == 8'b10111111) begin
                        case (a_to_g_tb) begin
                            7'b0000001: out_tb = 4'd0;
                            7'b1001111: out_tb = 4'd1;
                            7'b0010010: out_tb = 4'd2;
                            7'b0000110: out_tb = 4'd3;
                            7'b1001100: out_tb = 4'd4;
                            7'b0100100: out_tb = 4'd5;
                            7'b0100000: out_tb = 4'd6;
                            7'b0001111: out_tb = 4'd7;
                            7'b0000000: out_tb = 4'd8;
                            7'b0000100: out_tb = 4'd9;
                        end
                    end
                    else if (AN == 8'b11111101 || AN == 8'b11110111 || AN == 8'b01111111) begin
                        case (a_to_g_tb)
                            0: 7'b0110010 = out_tb;
                            1: 7'b1001110 = out_tb;
                        endcase
                    end
                end
            end
        end
        #100 $finish;
    end
endmodule
