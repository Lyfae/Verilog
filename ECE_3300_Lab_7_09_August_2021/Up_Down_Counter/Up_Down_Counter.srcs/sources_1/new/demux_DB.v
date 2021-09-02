`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2021 12:08:07 PM
// Design Name: 
// Module Name: demux_DB
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

//databus for the multiplexer
module demux_DB(
    input [3:0] in,
    input [2:0] select,
    output wire [31:0] out
);

generate
for (genvar i = 0; i < 4; i = i + 1)
  begin: DEMUXS
    demux_3_to_8 setter(
        .in(in[i]),
        .select(select),
        .out(out[8*i + 7 : 8 * i])
    );
  end
endgenerate

endmodule

