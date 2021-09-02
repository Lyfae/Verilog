`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/29/2021 07:39:55 PM
// Design Name: 
// Module Name: barrel
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


module barrel(

            input [15:0] I, 
            input [3:0] S, 
            input [3:0] S_IN, //serial in
            output wire [15:0] z
            );

    wire [15:0] v;
    wire [15:0] p;
    wire [15:0] a;

//shift left
mux2to1 M_SL_0  (.sel(S[0]),    .x0(I[0]),   .x1(S_IN[0]),    .y(v[0]));
mux2to1 M_SL_1  (.sel(S[0]),    .x0(I[1]),   .x1(S_IN[1]),    .y(v[1]));
mux2to1 M_SL_2  (.sel(S[0]),    .x0(I[2]),   .x1(S_IN[2]),    .y(v[2]));
mux2to1 M_SL_3  (.sel(S[0]),    .x0(I[3]),   .x1(S_IN[3]),    .y(v[3]));
mux2to1 M_SL_4  (.sel(S[0]),    .x0(I[4]),   .x1(I[0]),       .y(v[4]));
mux2to1 M_SL_5  (.sel(S[0]),    .x0(I[5]),   .x1(I[1]),       .y(v[5]));
mux2to1 M_SL_6  (.sel(S[0]),    .x0(I[6]),   .x1(I[2]),       .y(v[6]));
mux2to1 M_SL_7  (.sel(S[0]),    .x0(I[7]),   .x1(I[3]),       .y(v[7]));
mux2to1 M_SL_8  (.sel(S[0]),    .x0(I[8]),   .x1(I[4]),       .y(v[8]));
mux2to1 M_SL_9  (.sel(S[0]),    .x0(I[9]),   .x1(I[5]),       .y(v[9]));
mux2to1 M_SL_10 (.sel(S[0]),    .x0(I[10]),  .x1(I[6]),       .y(v[10]));
mux2to1 M_SL_11 (.sel(S[0]),    .x0(I[11]),  .x1(I[7]),       .y(v[11]));
mux2to1 M_SL_12 (.sel(S[0]),    .x0(I[12]),  .x1(I[8]),       .y(v[12]));
mux2to1 M_SL_13 (.sel(S[0]),    .x0(I[13]),  .x1(I[9]),       .y(v[13]));
mux2to1 M_SL_14 (.sel(S[0]),    .x0(I[14]),  .x1(I[10]),      .y(v[14]));
mux2to1 M_SL_15 (.sel(S[0]),    .x0(I[15]),  .x1(I[11]),      .y(v[15]));


//shift right
mux2to1 M_SR_0  (.sel(S[1]),    .x0(v[0]),   .x1(v[4]),       .y(p[0]));
mux2to1 M_SR_1  (.sel(S[1]),    .x0(v[1]),   .x1(v[5]),       .y(p[1]));
mux2to1 M_SR_2  (.sel(S[1]),    .x0(v[2]),   .x1(v[6]),       .y(p[2]));
mux2to1 M_SR_3  (.sel(S[1]),    .x0(v[3]),   .x1(v[7]),       .y(p[3]));
mux2to1 M_SR_4  (.sel(S[1]),    .x0(v[4]),   .x1(v[8]),       .y(p[4]));
mux2to1 M_SR_5  (.sel(S[1]),    .x0(v[5]),   .x1(v[9]),       .y(p[5]));
mux2to1 M_SR_6  (.sel(S[1]),    .x0(v[6]),   .x1(v[10]),      .y(p[6]));
mux2to1 M_SR_7  (.sel(S[1]),    .x0(v[7]),   .x1(v[11]),      .y(p[7]));
mux2to1 M_SR_8  (.sel(S[1]),    .x0(v[8]),   .x1(v[12]),      .y(p[8]));
mux2to1 M_SR_9  (.sel(S[1]),    .x0(v[9]),   .x1(v[13]),      .y(p[9]));
mux2to1 M_SR_10 (.sel(S[1]),    .x0(v[10]),  .x1(v[14]),      .y(p[10]));
mux2to1 M_SR_11 (.sel(S[1]),    .x0(v[11]),  .x1(v[15]),      .y(p[11]));
mux2to1 M_SR_12 (.sel(S[1]),    .x0(v[12]),  .x1(S_IN[0]),    .y(p[12]));
mux2to1 M_SR_13 (.sel(S[1]),    .x0(v[13]),  .x1(S_IN[1]),    .y(p[13]));
mux2to1 M_SR_14 (.sel(S[1]),    .x0(v[14]),  .x1(S_IN[2]),    .y(p[14]));
mux2to1 M_SR_15 (.sel(S[1]),    .x0(v[15]),  .x1(S_IN[3]),    .y(p[15]));

//Rotate left
mux2to1 M_RL_0  (.sel(S[2]),    .x0(p[0]),   .x1(p[12]),      .y(a[0]));
mux2to1 M_RL_1  (.sel(S[2]),    .x0(p[1]),   .x1(p[13]),      .y(a[1]));
mux2to1 M_RL_2  (.sel(S[2]),    .x0(p[2]),   .x1(p[14]),      .y(a[2]));
mux2to1 M_RL_3  (.sel(S[2]),    .x0(p[3]),   .x1(p[15]),      .y(a[3]));
mux2to1 M_RL_4  (.sel(S[2]),    .x0(p[4]),   .x1(p[0]),       .y(a[4]));
mux2to1 M_RL_5  (.sel(S[2]),    .x0(p[5]),   .x1(p[1]),       .y(a[5]));
mux2to1 M_RL_6  (.sel(S[2]),    .x0(p[6]),   .x1(p[2]),       .y(a[6]));
mux2to1 M_RL_7  (.sel(S[2]),    .x0(p[7]),   .x1(p[3]),       .y(a[7]));
mux2to1 M_RL_8  (.sel(S[2]),    .x0(p[8]),   .x1(p[4]),       .y(a[8]));
mux2to1 M_RL_9  (.sel(S[2]),    .x0(p[9]),   .x1(p[5]),       .y(a[9]));
mux2to1 M_RL_10 (.sel(S[2]),    .x0(p[10]),  .x1(p[6]),       .y(a[10]));
mux2to1 M_RL_11 (.sel(S[2]),    .x0(p[11]),  .x1(p[7]),       .y(a[11]));
mux2to1 M_RL_12 (.sel(S[2]),    .x0(p[12]),  .x1(p[8]),       .y(a[12]));
mux2to1 M_RL_13 (.sel(S[2]),    .x0(p[13]),  .x1(p[9]),       .y(a[13]));
mux2to1 M_RL_14 (.sel(S[2]),    .x0(p[14]),  .x1(p[10]),      .y(a[14]));
mux2to1 M_RL_15 (.sel(S[2]),    .x0(p[15]),  .x1(p[11]),      .y(a[15]));

//Rotate Right
mux2to1 M_RR_0  (.sel(S[3]),    .x0(a[0]),   .x1(a[4]),       .y(z[0]));
mux2to1 M_RR_1  (.sel(S[3]),    .x0(a[1]),   .x1(a[5]),       .y(z[1]));
mux2to1 M_RR_2  (.sel(S[3]),    .x0(a[2]),   .x1(a[6]),       .y(z[2]));
mux2to1 M_RR_3  (.sel(S[3]),    .x0(a[3]),   .x1(a[7]),       .y(z[3]));
mux2to1 M_RR_4  (.sel(S[3]),    .x0(a[4]),   .x1(a[8]),       .y(z[4]));
mux2to1 M_RR_5  (.sel(S[3]),    .x0(a[5]),   .x1(a[9]),       .y(z[5]));
mux2to1 M_RR_6  (.sel(S[3]),    .x0(a[6]),   .x1(a[10]),      .y(z[6]));
mux2to1 M_RR_7  (.sel(S[3]),    .x0(a[7]),   .x1(a[11]),      .y(z[7]));
mux2to1 M_RR_8  (.sel(S[3]),    .x0(a[8]),   .x1(a[12]),      .y(z[8]));
mux2to1 M_RR_9  (.sel(S[3]),    .x0(a[9]),   .x1(a[13]),      .y(z[9]));
mux2to1 M_RR_10 (.sel(S[3]),    .x0(a[10]),  .x1(a[14]),      .y(z[10]));
mux2to1 M_RR_11 (.sel(S[3]),    .x0(a[11]),  .x1(a[15]),      .y(z[11]));
mux2to1 M_RR_12 (.sel(S[3]),    .x0(a[12]),  .x1(a[0]),       .y(z[12]));
mux2to1 M_RR_13 (.sel(S[3]),    .x0(a[13]),  .x1(a[1]),       .y(z[13]));
mux2to1 M_RR_14 (.sel(S[3]),    .x0(a[14]),  .x1(a[2]),       .y(z[14]));
mux2to1 M_RR_15 (.sel(S[3]),    .x0(a[15]),  .x1(a[3]),       .y(z[15]));
  
  


endmodule


