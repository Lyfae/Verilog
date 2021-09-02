`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/01/2021 07:29:45 PM
// Design Name: 
// Module Name: FA_merge_tb
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


module FA_merge_tb();

    reg [15:0] In_tb;
    reg Sel_tb;
    reg CIn_tb;
    
    wire [15:0] SumOut_tb;
    wire COut_tb;
    wire CIn_Status_tb;
    FA_merge it_works(.In(In_tb), .Sel(Sel_tb), .CIn(CIn_tb), .SumOut(SumOut_tb), .COut_16(COut_tb), .CIn_Status(CIn_Status_tb));

    initial begin
        
        Sel_tb = 0;
        In_tb = 16'd0;
        #10
        Sel_tb = 1;
        In_tb = 16'd1;
        CIn_tb = 1;
        // CIN is 1
        #10

        #10
        Sel_tb = 0;
        In_tb = 16'd10;
        #10
        Sel_tb = 1;
        In_tb = 16'd1;
        CIn_tb = 0;
        // CIN is 1

        #10
        Sel_tb = 0;
        In_tb = 16'd6000;
        #10
        Sel_tb = 1;
        CIn_tb = 1;
        In_tb = 16'd1;
        // CIN is 0

        #10
        Sel_tb = 0;
        In_tb = 16'd0;
        #10
        Sel_tb = 1;
        In_tb = 16'd1;
        CIn_tb = 0;
        Sel_tb = 0;
        // CIN is 0
        #100 
            $finish;

    end

endmodule
