`timescale 1ns / 1ps

module Carry_Save_Multiplier4(a, b, out);
input [3:0] a;
input [3:0] b;
output [7:0] out;

wire a2b1, a3b1, a4b1, a1b2, a2b2, a3b2, a4b2, a1b3, a2b3, a3b3, a4b3, a1b4, a2b4, a3b4, a4b4;
wire c11, c21, c31, c12, c22, c32, c13, c23, c33, c14, c24, c34, c15, c25;
wire s21, s31, s22, s32, s23, s33; 
  
//Stage1
ha s1_0(a2b1, a1b2, out[1], c11);
ha s1_1(a3b1, a2b2, s21, c21);
ha s1_2(a4b1, a3b2, s31, c31);

//Stage2
//Carry Save Adder
fa s2_0(s21, a1b3, c11, out[2], c12);
fa s2_1(s31, a2b3, c21, s22, c22);
fa s2_2(a4b2, a3b3, c31, s32, c32);

//Stage3
//Carry Save Adder
fa s3_0(s22, a1b4, c12, out[3], c14);
fa s3_1(s32, a2b4, c22, s23, c24);
fa s3_2(a4b3, a3b4, c32, s33, c34);

//Stage4
//Ripple Carry Adder
ha s4_0(s23, c14, out[4], c15); //Half Adder
fa s4_1(c24, s33, c15, out[5], c16);
fa s4_2(c34, a4b4, c16, out[6], out[7]);

//Partial Multiply
//Stage1
assign out[0] = a[0] & b[0];
assign a2b1 = a[1] & b[0];
assign a3b1 = a[2] & b[0];
assign a4b1 = a[3] & b[0];

//Stage2
assign a1b2 = a[0] & b[1];
assign a2b2 = a[1] & b[1];
assign a3b2 = a[2] & b[1];
assign a4b2 = a[3] & b[1];

//Stage3
assign a1b3 = a[0] & b[2];
assign a2b3 = a[1] & b[2];
assign a3b3 = a[2] & b[2];
assign a4b3 = a[3] & b[2];

//Stage4
assign a1b4 = a[0] & b[3];
assign a2b4 = a[1] & b[3];
assign a3b4 = a[2] & b[3];
assign a4b4 = a[3] & b[3];


endmodule
