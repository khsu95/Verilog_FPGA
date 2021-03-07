`timescale 1ns / 1ps

module week11hw1(
	input clk_ref,
	input rst,
	input X,
	input Y,
	input Cin,
	output Cout,
	output Sum

    );

	assign Sum = (X ^ Y) ^ Cin;
	assign Cout = ((X ^ Y) & Cin) | (X & Y);	//full adder ±¸Çö.

endmodule
