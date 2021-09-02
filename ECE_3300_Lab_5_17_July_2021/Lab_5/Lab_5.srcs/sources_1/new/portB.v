`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2021 01:48:24 PM
// Design Name: 
// Module Name: portA
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


module portB #(parameter MAX_COUNT = 100_000_000-1) (
            input [3:0] SW,
            input S,
            input mclk,
            output reg [6:0] a_to_g,
            output reg [7:0] AN
            );

            reg [19:0] blink_refresh;
            wire sseg_activate;




    always @ (posedge mclk)
        begin
                blink_refresh <= blink_refresh + 1'b1;
        end
        
        assign sseg_activate = blink_refresh[19:18];



    always @(*)
        begin
                case(sseg_activate)
                    0:
                        begin
                        AN = 8'b11111011;
                            case(SW)
                            4'd0: a_to_g = 7'b0000001;
                            4'd1: a_to_g = 7'b1001111;
                            4'd2: a_to_g = 7'b0010010;
                            4'd3: a_to_g = 7'b0000110;
                            4'd4: a_to_g = 7'b1001100;
                            4'd5: a_to_g = 7'b0100100;
                            4'd6: a_to_g = 7'b0100000;
                            4'd7: a_to_g = 7'b0001111;
                            4'd8: a_to_g = 7'b0000000;
                            4'd9: a_to_g = 7'b0000100;
                            endcase
                        end
                    1:
                        begin
                            AN = 8'b11110111;
                        case(S)
                            0: a_to_g = 7'b1001110;
                            1: a_to_g = 7'b0110010;
                        endcase
                        end
                endcase

        end

                

endmodule
