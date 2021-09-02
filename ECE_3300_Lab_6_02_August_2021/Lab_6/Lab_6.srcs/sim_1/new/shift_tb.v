`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2021 09:16:29 PM
// Design Name: 
// Module Name: shift_tb
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


module shift_tb();

reg [15:0] I_tb;
reg [3:0] S_tb;
reg [3:0] S_IN_tb;
 
wire [15:0] z_tb;

barrel dut(.I(I_tb), .S(S_tb), .S_IN(S_IN_tb), .z(z_tb));

initial begin
    $display($time, " << Starting the Simulation >>");
    //shift left
    I_tb= 16'd7; 
    S_tb=4'b0001; 
    S_IN_tb = 4'b1000;
    #10
    //shift left again
    I_tb= z_tb; 
    S_tb=4'b0001; 
    S_IN_tb = 4'b1000;
    #10
    //shift right
    I_tb= 16'd7; 
    S_tb=4'b0010; 
    S_IN_tb = 4'b1000;
    #10
    //rotate left
    I_tb= 16'b1110000000001111; 
    S_tb=4'b0100; 
    #10
    //rotate right
    I_tb= 16'b1110000000000000; 
    S_tb=4'b1000; 
    #100
    $finish;
end

initial begin  
    $monitor("Input: %b, Select: %b, Serial Input: %b, Output: %b", I_tb,S_tb,S_IN_tb,z_tb);
end

endmodule


