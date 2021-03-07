`timescale 1ns / 1ps

module MT1(RST, CLK, signal, fortest);
input RST;
input CLK;
output [3:0] signal;
output [15:0] fortest;

wire nwbit;

Generator16 ge(RST, CLK, nwbit, fortest);
Pattern_Detector pd(CLK, nwbit, signal);

endmodule
