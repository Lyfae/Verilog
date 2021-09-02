`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/30/2021 01:26:29 PM
// Design Name: 
// Module Name: dataIn
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


module dataShiftIn #(parameter clkDivisions = 21)(
            input clk,
            input reset,
            input [3:0] data_In, //4 bit from switch to the LEDS
            input load,          //load
            input toggle,        //manual and automatic
            output reg [3:0] out 
            );

localparam MANUAL = 0;
localparam AUTO = 1;
localparam LOADON = 1;
localparam LOADOFF = 0;

reg [3:0] temp;

//counter 
reg [21:0] clkdiv;
//wire
wire s;
//timer
assign s = clkdiv[clkDivisions];

//clock divider
always @(posedge clk or posedge reset) begin
    if (reset) begin
        clkdiv <= 0;
        temp = 0;
    end
    else
        clkdiv <= clkdiv+1;
end
//automatic
always @(posedge toggle, posedge s)
    if (toggle == AUTO) begin
        temp = temp + 1;
    end
// manual
always@(toggle, data_In)
    // currently, clock still runs in manual mode
    if (toggle == MANUAL) begin
        temp = data_In;
    end
always @(load, temp) begin
    if (load == LOADON) begin
        out = temp;
    end
    else begin
        out = 4'bZZZZ;
    end
end
endmodule