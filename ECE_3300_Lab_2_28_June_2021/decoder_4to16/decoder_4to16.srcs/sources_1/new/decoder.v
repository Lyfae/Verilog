`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2021 12:45:39 PM
// Design Name: 
// Module Name: decoder
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


module decoder(
            //4 inputs 
            input A,
            input B,
            input EN,
            output [3:0] F
            );
            wire w1, w2;
            //not gates 
            not not_1(w1,A);
            not not_2(w2,B);
            //D0
            and and_0(F[0],w1,w2,EN);            
            //D1
            and and_1(F[1],A,w2,EN);
            //D2
            and and_2(F[2],B,w1,EN);
            //D3
            and and_3(F[3],A,B,EN);
            
              
endmodule
