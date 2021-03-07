`timescale 1ns / 1ps

module Subtract(a, b, out);
input [7:0] a;
input [7:0] b;
output [7:0] out;

wire [7:0] comp;//2' Complement

CLA8(a, comp, out);

assign comp = (~b)+1;

endmodule
