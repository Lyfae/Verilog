`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/30/2021 02:24:26 PM
// Design Name: 
// Module Name: dataShift_tb
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


module dataShift_tb(

    );
    reg clk_tb, reset_tb, load_tb, toggle_tb;
    reg [3:0] dataIn_tb;
    wire [3:0] out_tb;

    
   
    dataShiftIn #(.clkDivisions(1)) dut (.clk(clk_tb), .reset(reset_tb), .data_In(dataIn_tb), .load(load_tb), .toggle(toggle_tb), .out(out_tb));


    integer i;
    initial begin
        clk_tb = 0;
        reset_tb = 1;
        #10 reset_tb = 0;
    end

    
    initial begin
        forever
           #10 clk_tb = ~clk_tb;
    end

initial begin
    #10
    for (i = 64 - 1; i >= 0; i = i - 1) begin
        #20 toggle_tb = i[5];
        load_tb = i[4];
        dataIn_tb = i[3:0];
    end
    #100 $finish;
end
endmodule
