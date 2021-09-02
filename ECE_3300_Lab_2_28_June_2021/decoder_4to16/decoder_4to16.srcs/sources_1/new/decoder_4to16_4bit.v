`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2021 01:08:31 PM
// Design Name: 
// Module Name: decoder_4to16_4bit
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


module decoder_4to16_4bit(

            input A,B,C,D,
            input En,
            output wire [15:0] SUM
        
            );
            wire [3:0] control;

            
            
            decoder d1(A,B,control[0],SUM[3:0]);
            decoder d2(A,B,control[1],SUM[7:4]);
            decoder d3(A,B,control[2],SUM[11:8]);
            decoder d4(A,B,control[3],SUM[15:12]);

            decoder d5(C,D,En,control[3:0]);
endmodule
