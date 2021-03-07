`timescale 1ns / 1ps

module CSA_module(a, b, cin, sum, cout);
input [3:0] a;
input [3:0] b;
input cin;
output [3:0] sum;
output cout;

wire [3:0] swire0, swire1;
wire cwire0, cwire1;

top adder_0 (a, b, 1'b0, swire0, cwire0);//Carry 0
top adder_1 (a, b, 1'b1, swire1, cwire1);//Carry 1

assign sum = cin ? swire1 : swire0; //4bit Mux for Sum
assign cout = cin ? cwire1: cwire0; //1bit Mux for Carry Out

endmodule
