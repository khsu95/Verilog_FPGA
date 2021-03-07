`timescale 1ns / 1ps

module Base_Unit_8bit_CSA(a, b, cin, sum, cout);

input [7:0] a;
input [7:0] b;
input cin;
output [7:0] sum;
output cout;

wire [3:0] for0, for1; //sum for carry 0, carry 1 respectively
wire cs, c0, c1; //carry out for adder00, adder0, adder1 respectively

top adder00(a[3:0], b[3:0], cin, sum[3:0], cs); //for 0~3bit adder and generating carry

top adder0(a[7:4], b[7:4], 1'b0, for0, c0); //for cin 0
top adder1(a[7:4], b[7:4], 1'b1, for1, c1); //for cin 1

assign sum[7:4] = cs ? for1 : for0;
assign cout =(cs&c1)|c0;


endmodule
