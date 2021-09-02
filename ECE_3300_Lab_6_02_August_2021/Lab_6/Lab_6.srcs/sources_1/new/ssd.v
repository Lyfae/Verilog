`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2021 03:02:44 PM
// Design Name: 
// Module Name: ssd
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

`define an_off 4'b1111
`define dp_off 1'b1
`define initial_d 4'b1111


module ssd #(parameter clkDivisions = 19)(
            input [15:0] SW, 
            input clk,
            input reset,
            output reg [6:0] a_to_g,
            output reg [3:0] an, 
            output wire [3:0] an1,
            output wire dp
            );

//turn the other 4 displays off
assign an1 = `an_off; 
//turn off the decimal point
assign dp = `dp_off; 

//hold values
reg [3:0] digit;
//select
wire [1:0] s;
//enable 
wire [3:0] aen;

//counter 
reg [19:0] clkdiv;
//last two bits of the counter
assign s = clkdiv[clkDivisions:clkDivisions-1];
//initially enable these 4 buts
assign aen = `initial_d; 

// 7 seg decoder
always @(digit) begin
    case (digit)
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
          'hA: a_to_g = 7'b0001000;  
          'hB: a_to_g = 7'b1100000;  
          'hC: a_to_g = 7'b0110001;  
          'hD: a_to_g = 7'b1000010;  
          'hE: a_to_g = 7'b0110000;  
          'hF: a_to_g = 7'b0111000;  
        default: a_to_g = 7'bZZZZZZZ;
    endcase

end

//clock divider
always @(posedge clk or posedge reset) begin
    if (reset)
        clkdiv <= 0; 
    else
        clkdiv <= clkdiv+1; 
end

//digit select - :ancode
always @(aen, s) begin
    an = 4'b1111;
    if (aen[s]==1) 
        an[s] = 0;
    
end

//4 to 1 mux
always @(s,SW) begin
    case (s)
        0: digit = SW[3:0]; 
        1: digit = SW[7:4]; 
        2: digit = SW[11:8];
        3: digit = SW[15:12]; 
        default:digit = 4'bZZZZ; 
    endcase
end



endmodule
