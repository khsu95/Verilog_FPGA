`timescale 1ns / 1ps

module CLA8(a, b, out);
input [7:0] a;
input [7:0] b;
output [7:0] out;

wire [1:0] wg01, wg02, wg03, wg04, wg05, wg06, wg07, wg08; //0 Stage Module //[g:p];
wire [1:0] wg11, wg12, wg13, wg14;//1 Stage Module
wire [1:0] wg21, wg22;//2 Stage Module
wire [1:0] wg31;//3 Stage Module

wire wc01, wc02, wc03, wc04, wc05, wc06, wc07, wc08;
wire wc11, wc12, wc13, wc14, wc21, wc22, wc31;

CLA_A_type a1(a[7], b[7], wc01, wg01[1], wg01[0], out[7]);
CLA_A_type a2(a[6], b[6], wc02, wg02[1], wg02[0], out[6]);
CLA_A_type a3(a[5], b[5], wc03, wg03[1], wg03[0], out[5]);
CLA_A_type a4(a[4], b[4], wc04, wg04[1], wg04[0], out[4]);
CLA_A_type a5(a[3], b[3], wc05, wg05[1], wg05[0], out[3]);
CLA_A_type a6(a[2], b[2], wc06, wg06[1], wg06[0], out[2]);
CLA_A_type a7(a[1], b[1], wc07, wg07[1], wg07[0], out[1]);
CLA_A_type a8(a[0], b[0], wc08, wg08[1], wg08[0], out[0]);

CLA_B_type b21(wg01[1], wg01[0], wc01, wg02[1], wg02[0], wc02, wg11[1], wg11[0], wc11);
CLA_B_type b22(wg03[1], wg03[0], wc03, wg04[1], wg04[0], wc04, wg12[1], wg12[0], wc12);
CLA_B_type b23(wg05[1], wg05[0], wc05, wg06[1], wg06[0], wc06, wg13[1], wg13[0], wc13);
CLA_B_type b24(wg07[1], wg07[0], wc07, wg08[1], wg08[0], wc08, wg14[1], wg14[0], wc14);

CLA_B_type b31(wg11[1], wg11[0], wc11, wg12[1], wg14[0], wc12, wg21[1], wg21[0], wc21);
CLA_B_type b32(wg13[1], wg13[0], wc13, wg12[1], wg14[0], wc14, wg22[1], wg22[0], wc22);

CLA_B_type b41(wg21[1], wg21[0], wc21, wg22[1], wg22[0], wc22, , , 1'b0);//out, out, in //No carry in

endmodule
