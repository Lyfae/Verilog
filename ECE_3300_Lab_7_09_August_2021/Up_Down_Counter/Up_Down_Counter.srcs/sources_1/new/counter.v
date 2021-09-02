`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2021 12:23:43 PM
// Design Name: 
// Module Name: counter
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


module counter(
    input clk,
    input reset,
    input enable_in, 
    input up_down,
    input load,
    input in0,
    input in1,
    input in2,
    input in3,
    output reg [3:0] set,
    output wire enable_out
);

wire [3:0] in;
assign in[0] = in0;
assign in[1] = in1;
assign in[2] = in2;
assign in[3] = in3;
            
always@(posedge clk or posedge reset or posedge load)begin 
    if (reset)begin
        if (up_down) 
            set <= 4'd9;
        else 
            set <= 4'd0;
      end
    else if (load)
        set <= in;
    else begin 
        if (enable_in)begin 
            if (up_down== 1'b1)begin 
                if (set > 0) 
                    set <= set - 1;
                else 
                    set <= 4'd9; 
            end 
            else begin 
                if(set <9)
                    set <= set+ 1;
                else 
                    set <= 4'd0;  
            end 
        end
    end 
end     
// checks if the current counter value will result in carry to the next counter
assign enable_out = ((set[3] & set[0] & (~set[2]) & (~set[1]) & (~up_down)) | ( (~set[3]) & (~set[0]) & (~set[2]) & (~set[1]) & (up_down))) & enable_in ;
                  
endmodule