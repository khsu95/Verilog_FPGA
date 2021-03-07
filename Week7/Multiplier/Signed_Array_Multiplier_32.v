`timescale 1ns/ 1ps

module Signed_Array_Multiplier_32(a, b, mul);
input [7:0] a;
input[7:0] b;
output[15:0] mul;
//Declare Wire
//Wire Partial Product
wire [7:0] pwire_0, pwire_1, pwire_2, pwire_3, pwire_4, pwire_5, pwire_6, pwire_7;

//Stage-to-Stage wire
wire [7:0] swire_1, swire_2, swire_3, swire_4, swire_5, swire_6, swire_7;

//Carry Propagation wire
wire [7:0] cwire_1, cwire_2, cwire_3, cwire_4, cwire_5, cwire_6, cwire_7;

//Stage1 Partial Mul
ha f1(pwire_1[0], pwire_0[1], mul[1], cwire_1[0]);
fa f1_1 (pwire_1[1], pwire_0[2], cwire_1[0], swire_1[0], cwire_1[1]);
fa f1_2 (pwire_1[2], pwire_0[3], cwire_1[1], swire_1[1], cwire_1[2]);
fa f1_3 (pwire_1[3], pwire_0[4], cwire_1[2], swire_1[2], cwire_1[3]);
fa f1_4 (pwire_1[4], pwire_0[5], cwire_1[3], swire_1[3], cwire_1[4]);
fa f1_5 (pwire_1[5], pwire_0[6], cwire_1[4], swire_1[4], cwire_1[5]);
fa f1_6 (pwire_1[6], pwire_0[7], cwire_1[5], swire_1[5], cwire_1[6]);
ha f1_7 (pwire_1[7], cwire_1[6], swire_1[6], cwire_1[7]);

//Stage2 Partial Mul
ha f2(pwire_2[0], swire_1[0], mul[2], cwire_2[0]);
fa f2_1 (pwire_2[1], swire_1[1], cwire_2[0], swire_2[0], cwire_2[1]);
fa f2_2 (pwire_2[2], swire_1[2], cwire_2[1], swire_2[1], cwire_2[2]);
fa f2_3 (pwire_2[3], swire_1[3], cwire_2[2], swire_2[2], cwire_2[3]);
fa f2_4 (pwire_2[4], swire_1[4], cwire_2[3], swire_2[3], cwire_2[4]);
fa f2_5 (pwire_2[5], swire_1[5], cwire_2[4], swire_2[4], cwire_2[5]);
fa f2_6 (pwire_2[6], swire_1[6], cwire_2[5], swire_2[5], cwire_2[6]);
fa f2_7 (pwire_2[7], cwire_1[7], cwire_2[6], swire_2[6], cwire_2[7]); //Difference from Signed Array Multiplier 

//Stage3 Partial Mul
ha f3(pwire_3[0], swire_2[0], mul[3], cwire_3[0]);
fa f3_1 (pwire_3[1], swire_2[1], cwire_3[0], swire_3[0], cwire_3[1]);
fa f3_2 (pwire_3[2], swire_2[2], cwire_3[1], swire_3[1], cwire_3[2]);
fa f3_3 (pwire_3[3], swire_2[3], cwire_3[2], swire_3[2], cwire_3[3]);
fa f3_4 (pwire_3[4], swire_2[4], cwire_3[3], swire_3[3], cwire_3[4]);
fa f3_5 (pwire_3[5], swire_2[5], cwire_3[4], swire_3[4], cwire_3[5]);
fa f3_6 (pwire_3[6], swire_2[6], cwire_3[5], swire_3[5], cwire_3[6]);
fa f3_7 (pwire_3[7], cwire_2[7], cwire_3[6], swire_3[6], cwire_3[7]);

//Stage4 Partial Mul
ha f4(pwire_4[0], swire_3[0], mul[4], cwire_4[0]);
fa f4_1 (pwire_4[1], swire_3[1], cwire_4[0], swire_4[0], cwire_4[1]);
fa f4_2 (pwire_4[2], swire_3[2], cwire_4[1], swire_4[1], cwire_4[2]);
fa f4_3 (pwire_4[3], swire_3[3], cwire_4[2], swire_4[2], cwire_4[3]);
fa f4_4 (pwire_4[4], swire_3[4], cwire_4[3], swire_4[3], cwire_4[4]);
fa f4_5 (pwire_4[5], swire_3[5], cwire_4[4], swire_4[4], cwire_4[5]);
fa f4_6 (pwire_4[6], swire_3[6], cwire_4[5], swire_4[5], cwire_4[6]);
fa f4_7 (pwire_4[7], cwire_3[7], cwire_4[6], swire_4[6], cwire_4[7]);

//Stage5 Partial Mul
ha f5(pwire_5[0], swire_4[0], mul[5], cwire_5[0]);
fa f5_1 (pwire_5[1], swire_4[1], cwire_5[0], swire_5[0], cwire_5[1]);
fa f5_2 (pwire_5[2], swire_4[2], cwire_5[1], swire_5[1], cwire_5[2]);
fa f5_3 (pwire_5[3], swire_4[3], cwire_5[2], swire_5[2], cwire_5[3]);
fa f5_4 (pwire_5[4], swire_4[4], cwire_5[3], swire_5[3], cwire_5[4]);
fa f5_5 (pwire_5[5], swire_4[5], cwire_5[4], swire_5[4], cwire_5[5]);
fa f5_6 (pwire_5[6], swire_4[6], cwire_5[5], swire_5[5], cwire_5[6]);
fa f5_7 (pwire_5[7], cwire_4[7], cwire_5[6], swire_5[6], cwire_5[7]);

//Stage6 Partial Mul
ha f6(pwire_6[0], swire_5[0], mul[6], cwire_6[0]);
fa f6_1 (pwire_6[1], swire_5[1], cwire_6[0], swire_6[0], cwire_6[1]);
fa f6_2 (pwire_6[2], swire_5[2], cwire_6[1], swire_6[1], cwire_6[2]);
fa f6_3 (pwire_6[3], swire_5[3], cwire_6[2], swire_6[2], cwire_6[3]);
fa f6_4 (pwire_6[4], swire_5[4], cwire_6[3], swire_6[3], cwire_6[4]);
fa f6_5 (pwire_6[5], swire_5[5], cwire_6[4], swire_6[4], cwire_6[5]);
fa f6_6 (pwire_6[6], swire_5[6], cwire_6[5], swire_6[5], cwire_6[6]);
fa f6_7 (pwire_6[7], cwire_5[7], cwire_6[6], swire_6[6], cwire_6[7]);

//Stage7 Partial Mul
ha f7(pwire_7[0], swire_6[0], mul[7], cwire_7[0]);
fa f7_1 (pwire_7[1], swire_6[1], cwire_7[0], mul[08], cwire_7[1]);
fa f7_2 (pwire_7[2], swire_6[2], cwire_7[1], mul[09], cwire_7[2]);
fa f7_3 (pwire_7[3], swire_6[3], cwire_7[2], mul[10], cwire_7[3]);
fa f7_4 (pwire_7[4], swire_6[4], cwire_7[3], mul[11], cwire_7[4]);
fa f7_5 (pwire_7[5], swire_6[5], cwire_7[4], mul[12], cwire_7[5]);
fa f7_6 (pwire_7[6], swire_6[6], cwire_7[5], mul[13], cwire_7[6]);
fa f7_7 (pwire_7[7], cwire_6[7], cwire_7[6], mul[14], mul[15]);


assign mul[0] = a[0] & b[0];
//Partial Mult
assign pwire_0 = b[0] ? a : 0;
assign pwire_1 = b[1] ? a : 0;
assign pwire_2 = b[2] ? a : 0;
assign pwire_3 = b[3] ? a : 0;
assign pwire_4 = b[4] ? a : 0;
assign pwire_5 = b[5] ? a : 0;
assign pwire_6 = b[6] ? a : 0;
assign pwire_7 = b[7] ? a : 0;
endmodule