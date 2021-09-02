`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/31/2021 11:30:58 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb();

reg clk_tb;
reg reset_tb;
reg [15:0] SW_tb;
reg button_1_tb;
reg button_2_tb;
reg test_tb;

wire    [6:0] a_to_g_tb;
wire    [3:0] an_tb;
wire    [3:0] an1_tb;
wire    dp_tb;


top #(.clkDivisions1(1)) dut(
.clk(clk_tb),
.reset(reset_tb),
.SW(SW_tb),
.button_1(button_1_tb),
.button_2(button_2_tb),
.test(test_tb),
.a_to_g(a_to_g_tb),
.an(an_tb),
.an1(an1_tb),
.dp(dp_tb)
        );

integer  i;

initial begin
    clk_tb = 1;
    reset_tb = 1;
end

initial begin
    forever begin
        #10 clk_tb = ~clk_tb;
    end      
end

initial begin
    test_tb = 0;
    SW_tb = 4'd10; 
    #10
    reset_tb = 0; 
    test_tb = ~test_tb; 
    SW_tb = 4'd10; 
    #10
    test_tb = 1;
    SW_tb = 4'd10; 
    #10
    test_tb = ~test_tb; 
    SW_tb = 4'd10; 
    #100 $finish;
end
endmodule

// reg clk_tb;
// reg butn_tb;
// reg press_tb;

// wire pressedOut_tb;
// wire pulse_tb;

// integer i;
// pulse dut(.clk(clk_tb), .button(butn_tb), .pressed(press_tb), .pressedOut(pressedOut_tb), .pulse(pulse_tb));
// initial begin
//     clk_tb = 0;
//     butn_tb = 0;
//     press_tb = 0;
// end

// initial begin
//     forever begin
//         #10 clk_tb = ~clk_tb;
//     end      
// end

// initial begin
//     for (i = 0; i < 32; i = i + 1) begin
//         #10 butn_tb = i[2];
//         press_tb = pressedOut_tb;
//     end
// end