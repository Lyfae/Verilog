`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2021 01:14:35 PM
// Design Name: 
// Module Name: BCD_32_bit
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


module BCD_32_bit(
    input clk,
    input reset,
    input en,
    input up_down,
    input load,
    input [3:0] in,
    input [2:0] select,
    output wire [31:0] set
);

wire [7:0] temp;
wire [31:0] temp_select;
               
assign temp[0] = en; 
               
genvar i;      

demux_DB data (
    .in(in),
    .select(select),
    .out(temp_select)
);
       
generate 
for (i = 0; i<8 ; i = i+1)
begin
    counter count(
        .clk(clk),
        .reset(reset),
        .enable_in(temp[i]), 
        .up_down(up_down),
        .load(load),
        .in0(temp_select[i]),
        .in1(temp_select[i + 8]),
        .in2(temp_select[i + 16]),
        .in3(temp_select[i + 24]),
        .set(set [4*(i+1)-1 : 4*i]),
        .enable_out(temp[i+1])
    ); 
end
endgenerate

endmodule

