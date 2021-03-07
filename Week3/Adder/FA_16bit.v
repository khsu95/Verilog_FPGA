`timescale 1ns / 1ps

module FA_16bit(
	input [15:0] a, //Data bus of 16bit Adder
	input [15:0] b,
	input  cin,
	output [15:0] sum,
	output cout
    );
	 
	 wire c1; //wire from f40 to f41
	 wire c2; //wire from f41 to f42
	 wire c3; //wire from f42 to f43
	 
	 FA_4bit f40(.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(c1),.sum(sum[3:0])); //Calculate 4bits of 16bits Data
	 FA_4bit f41(.a(a[7:4]),.b(b[7:4]),.cin(c1),.cout(c2),.sum(sum[7:4]));
	 FA_4bit f42(.a(a[11:8]),.b(b[11:8]),.cin(c2),.cout(c3),.sum(sum[11:8]));
	 FA_4bit f43(.a(a[15:12]),.b(b[15:12]),.cin(c3),.cout(cout),.sum(sum[15:12]));


endmodule
