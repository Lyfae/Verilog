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


module portA #(parameter MAX_COUNT = (1666666)-1, MAX_INNER_COUNT = MAX_COUNT/32) (
            input [11:0] SW, // SW[3:0] is port a, SW[4] is port as, SW[8:5] is port b, SW[9] is port bs, swtich 10 and 11 are SW[14] and SW[15] repsectively (for arithemetic)
            input mclk,
            output reg [6:0] a_to_g,
            output reg [7:0] AN
            );
            reg [26:0] counter = 0;
            reg [26:0] innerCounter = 0;
            reg [2:0] displayFlag = 0;  

            reg signed [4:0] temp1 = 0;
            reg signed [4:0] temp2 = 0;
            reg signed [4:0] sign1 = 0;
            reg signed [4:0] sign2 = 0;

            reg check=0; 

            reg signed [8:0] out = 0; 

            reg [3:0] hold_low = 0;
            reg [3:0] hold_high =0; 


    always@(posedge mclk)
    // counts up to the start of refresh period of MAX_COUNT
        if (counter == MAX_COUNT) begin
            // true, start refreshing the displays, one by one with a delay of MAX_INNER_COUNT
            if (innerCounter == MAX_INNER_COUNT) begin
            /*
                if the left most display is only on, then the case statement 
                is ending with the last case before the refresh so the inner 
                counter should be reset to give time for the other cases
            */
              

                if (displayFlag < 7) begin
                    case (displayFlag)
                    0: begin
                        AN = 8'b11111110;
                        case(SW[3:0])
                            4'd0:begin a_to_g = 7'b0000001;
                                        temp1 = 4'd0; end
                            4'd1:begin a_to_g = 7'b1001111;
                                        temp1 = 4'd1; end
                            4'd2:begin a_to_g = 7'b0010010;
                                        temp1 = 4'd2; end
                            4'd3:begin a_to_g = 7'b0000110;
                                        temp1 = 4'd3; end
                            4'd4:begin a_to_g = 7'b1001100;
                                        temp1 = 4'd4; end
                            4'd5:begin a_to_g = 7'b0100100;
                                        temp1 = 4'd5; end
                            4'd6:begin a_to_g = 7'b0100000;
                                        temp1 = 4'd6; end
                            4'd7:begin a_to_g = 7'b0001111;
                                        temp1 = 4'd7; end
                            4'd8:begin a_to_g = 7'b0000000;
                                        temp1 = 4'd8; end
                            4'd9:begin a_to_g = 7'b0000100;
                                        temp1 = 4'd9; end
                            default: a_to_g = 7'b0000100;
                        endcase
                        end
                    1: begin  
                        AN = 8'b11111101;
                        case(SW[4])
                            0:begin a_to_g = 7'b1001110;
                                    sign1 <= -1; 
                                    end
                            1:begin a_to_g = 7'b0110010;
                                    sign1 <= 1; 
                                    end 
                        endcase
                        end
                    2: begin
                        AN = 8'b11111011;
                        case(SW[8:5])
                            4'd0:begin a_to_g = 7'b0000001;
                                        temp2 = 4'd0; end
                            4'd1:begin a_to_g = 7'b1001111;
                                        temp2 = 4'd1; end
                            4'd2:begin a_to_g = 7'b0010010;
                                        temp2 = 4'd2; end
                            4'd3:begin a_to_g = 7'b0000110;
                                        temp2 = 4'd3; end
                            4'd4:begin a_to_g = 7'b1001100;
                                        temp2 = 4'd4; end
                            4'd5:begin a_to_g = 7'b0100100;
                                        temp2 = 4'd5; end
                            4'd6:begin a_to_g = 7'b0100000;
                                        temp2 = 4'd6; end
                            4'd7:begin a_to_g = 7'b0001111;
                                        temp2 = 4'd7; end
                            4'd8:begin a_to_g = 7'b0000000;
                                        temp2 = 4'd8; end
                            4'd9:begin a_to_g = 7'b0000100;
                                        temp2 = 4'd9; end
                            default: a_to_g = 7'b0000100;
                        endcase
                        end
                    3: begin
                        AN = 8'b11110111;
                        case(SW[9])
                            0:begin a_to_g = 7'b1001110;
                                    sign2 <= -1; 
                                    end
                            1:begin a_to_g = 7'b0110010;
                                    sign2 <= 1; 
                                    end
                            endcase
                        end
                    4: begin
                        AN = 8'b11011111;
                        case(hold_low)
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
                            default: a_to_g = 7'b1111110;
                        endcase
                        end
                    5: begin
                        AN = 8'b10111111;
                        case(hold_high)
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
                            default: a_to_g = 7'b1111110;
                        endcase
                        end
                    6: begin
                            AN = 8'b01111111;
                            case (check)
                                0: a_to_g = 7'b0110010;
                                1: a_to_g = 7'b1001110;
                            endcase
                                
                            end
                        //end
                       
                    endcase

                    displayFlag = displayFlag + 1;
                    innerCounter = 0;
                end

                else begin //if greater than 4, reset everything 
                    displayFlag = 0;
                    innerCounter = 0;
                    counter = 0;
                    displayFlag = 0;
                    AN = 8'b11111111;
                end

            //Calculating 
            
            if (SW[11]==0 & SW[10]==0) begin        //addition
                out = (temp1*sign1) + (temp2*sign2); 
            end
            else if (SW[11]==0 & SW[10]==1) begin   //subtration
                out = (temp1*sign1) - (temp2*sign2);
            end
            else if (SW[11]==1 & SW[10]==0) begin   //multiplication
                out = (temp1*sign1) * (temp2*sign2);
            end


            if (out <= 0) begin 
                // set to positive and set check (sign)
                check = 1;
                hold_high = (out*-1) / 10;                   //set the high and lower bits
                hold_low = (out*-1) % 10;   
            end
            else if(out >= 0) begin
                check = 0;
                hold_high = out / 10;                   //set the high and lower bits
                hold_low = out % 10;   
            end
            

        

        end
            //if not max inner_counter, increment
                else begin
                    innerCounter = innerCounter + 1;
                end
        end //end of inner counter
            //if not max counter, increment
        else begin
                counter = counter + 1;
    end//end of counter


    
endmodule
