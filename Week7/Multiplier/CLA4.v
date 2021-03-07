`timescale 1ns / 1ps

module CLA4(a, b, cin, sum, cout);
input [3:0] a;
input [3:0] b;
input cin;
output [3:0] sum;
output cout;

wire [3:0] pwire, gwire, cwire;

PGLogic pg (a, b, pwire, gwire);
Carry_Logic cl (pwire, gwire, cin, cwire);

assign sum[0] = cin^pwire[0];
assign sum[1] = cwire[0]^pwire[1];
assign sum[2] = cwire[1]^pwire[2];
assign sum[3] = cwire[2]^pwire[3];
assign cout = cwire[3];


endmodule
