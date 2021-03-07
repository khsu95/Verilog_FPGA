`timescale 1ns / 1ps

module FA_32bit(
	input [31:0] a,
	input [31:0] b,
	input 	 cin,
	output [31:0] sum,
	output 		 cout
    );
	 
	 wire c1; //wire from f160 to f161
	 
	 FA_16bit f160(.a(a[15:0]),.b(b[15:0]),.cin(cin),.cout(c1),.sum(sum[15:0])); //16Bit adder imported
	 FA_16bit f161(.a(a[31:16]),.b(b[31:16]),.cin(c1),.cout(cout),.sum(sum[31:16]));
	 
	 


endmodule
