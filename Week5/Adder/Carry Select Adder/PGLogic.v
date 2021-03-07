`timescale 1ns / 1ps

module PGLogic(a, b, p, g);

input [3:0] a;
input [3:0] b;
output [3:0] p;
output [3:0] g;

assign p=a^b; //Bit-by-Bit Operator
assign g=a&b; //Bit-by-Bit Operator


endmodule
