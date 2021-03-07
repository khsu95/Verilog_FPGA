`timescale 1ns / 1ps

module Sub(a, b, out);
input [7:0] a;
input [7:0] b;
output [7:0] out;

wire [7:0] bwire;

CLA4(a, b, cin, sum, 1'b0); //Carry unused;

assign bwire = (~b)+1; //2's Complement -> -

endmodule
