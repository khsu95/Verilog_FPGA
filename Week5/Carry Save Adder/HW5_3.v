`timescale 1ns / 1ps

module HW5_3(a, b, out);
input [3:0] a;
input [3:0] b;
output [3:0] out;

wire [7:0] wcsm; //wire from Carry Save Multipler to 8to3 Encoder
wire [2:0] wge; //wire from 8to3 Encoder to BCD Converter


Carry_Save_Multiplier4 csm(a, b, wcsm);
encoder8to3 gc(wcsm, wge);
BCD3 bc(wge,out);

endmodule
