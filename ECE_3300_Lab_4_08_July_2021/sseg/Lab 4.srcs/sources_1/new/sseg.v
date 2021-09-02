`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2021 08:34:46 PM
// Design Name: 
// Module Name: sseg
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


module sseg(
        input SW,
        input mclk,
        input reset, 
        output reg [6:0] a_to_g,
        output reg [7:0] AN,
        output DP
            );
        //make decimal zero
        assign DP = 1'b1;
        
        reg [19:0] blink_refresh;
        reg sseg_activate;
        
//        parameter max_count = 10_000_000-1;
        parameter max_count = 1000000-1;
        reg    count;
        reg     [26:0] counter_100;
        reg     [3:0] counter_10l;
        reg     [3:0] counter_10h;
        
        initial begin
            counter_100 = 0;
            counter_10l = 0;
            counter_10h = 0;
            blink_refresh = 0;
            sseg_activate = 0;
            count = 0;
        end
        
        //counter to divide the 100Mhz
        always @(posedge mclk, posedge reset)
            if(reset)
                counter_100 <=0;
            else if (counter_100 == max_count) begin
                counter_100 <=0;
                count = 1;
            end
            else begin
                counter_100 <= counter_100 + 1'b1;
                count = 0;
            end
        //counter to count evey number in 1hz
        always @(posedge mclk or posedge reset)
            if(reset) begin
                counter_10l <= 0;
                counter_10h <= 0;
                end
            else if (SW)
                if (count)
                //if it goes pass 9, reset
                    if(counter_10l==9)begin
                        counter_10l <=0;
                        if(counter_10h==9)
                            counter_10h <=0;
                        else
                            counter_10h <= counter_10h + 1'b1;
                        end
                    else
                        counter_10l <= counter_10l + 1'b1;
                 
    always @ (posedge mclk or  posedge reset)
        begin
            if (reset)
                blink_refresh <= 0;
            else
                blink_refresh = blink_refresh + 1'b1;
                sseg_activate = blink_refresh[19];
        end
        
        
        
    always @ (*)
        begin
            case (sseg_activate)
                0: begin
                    AN <= 8'b11111110;
                    case(counter_10l)
                        0: a_to_g = 7'b0000001;
                        1: a_to_g = 7'b1001111;
                        2: a_to_g = 7'b0010010;
                        3: a_to_g = 7'b0000110;
                        4: a_to_g = 7'b1001100;
                        5: a_to_g = 7'b0100100;
                        6: a_to_g = 7'b0100000; 
                        7: a_to_g = 7'b0001111;
                        8: a_to_g = 7'b0000000;
                        9: a_to_g = 7'b0000100;
                        default: a_to_g = 7'b0000001;
                    endcase
                end
                1: begin
                    AN <= 8'b01111111;
                    case(counter_10h)
                        0: a_to_g = 7'b0000001;
                        1: a_to_g = 7'b1001111;
                        2: a_to_g = 7'b0010010;
                        3: a_to_g = 7'b0000110;
                        4: a_to_g = 7'b1001100;
                        5: a_to_g = 7'b0100100;
                        6: a_to_g = 7'b0100000; 
                        7: a_to_g = 7'b0001111;
                        8: a_to_g = 7'b0000000;
                        9: a_to_g = 7'b0000100;
                        default: a_to_g = 7'b0000001;
                    endcase
                end
            endcase
        end

endmodule
