`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2021 07:16:23 PM
// Design Name: 
// Module Name: FA_merge
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

module button(
    input clk,
    output reg led
    );
    initial begin
        led = 1'b0;
    end
    always @ (posedge clk)
        if (clk)
            led <= ~led;
endmodule

module FA_merge(
            input [15:0] In,
            input Sel,
            input CIn,
            output [15:0] SumOut,
            output COut_16,
            output CIn_Status
            );
            
    wire [15:0] temp0;
    wire [15:0] temp1;
    wire bSel;
    wire bIn;
    
    button b (.clk(Sel), .led(bSel));
    button c (.clk(CIn), .led(bIn));

    dmux I(.dsel(bSel), .in(In), .out0(temp0), .out1(temp1));
    assign CIn_Status = bIn;    
    full_adder_16 J (.CInput(bIn), .InputA_n(temp0), .InputB_n(temp1), .SumOutput_n(SumOut), .COutput_n(COut_16));

endmodule
