`timescale 1ns / 1ps

module Half_Adder(
	input a,
	input b,
	output sum,
	output cout
    );
	 
	 assign sum=a ^ b;
	 assign cout=a & b;


endmodule
