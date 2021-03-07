`timescale 1ns / 1ps

module FA_4bit(
	input [3:0] a,//Data bus of 4bit Adder
	input [3:0] b,
	input cin,
	output [3:0] sum,
	output cout
    );
	 
	 wire c1,c2,c3;
	 
	 Full_Adder f00 (.a(a[0]), .b(b[0]), .cin(cin), .cout(c1), .sum(sum[0])); //Calculate 1bit of 4bits Data
	 Full_Adder f01 (.a(a[1]), .b(b[1]), .cin(c1), .cout(c2), .sum(sum[1]));
	 Full_Adder f02 (.a(a[2]), .b(b[2]), .cin(c2), .cout(c3), .sum(sum[2]));
	 Full_Adder f03 (.a(a[3]), .b(b[3]), .cin(c3), .cout(cout), .sum(sum[3]));


endmodule
