`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2021 12:00:55 PM
// Design Name: 
// Module Name: demux_3_to_8
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


module demux_3_to_8(
    input in,
    input [2:0] select,
    output wire [7:0] out
);
assign out[0] = in & ~select[0] & ~select[1] & ~select[2];
assign out[1] = in & select[0] & ~select[1] & ~select[2];
assign out[2] = in & ~select[0] & select[1] & ~select[2];
assign out[3] = in & select[0] & select[1] & ~select[2];
assign out[4] = in & ~select[0] & ~select[1] & select[2];
assign out[5] = in & select[0] & ~select[1] & select[2];
assign out[6] = in & ~select[0] & select[1] & select[2];
assign out[7] = in & select[0] & select[1] & select[2];

endmodule

