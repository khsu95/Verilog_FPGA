`timescale 1ns / 1ps

module FAS_32bit(
	input [31:0] a,
	input [31:0] b,
	input bcin,
	output [31:0] sum,
	output [31:0] diff,
	output cout,
	output bout
    );
	 
	 FA_32bit fa32(.a(a[31:0]),.b(b[31:0]),.cin(bcin),.cout(cout),.sum(sum[31:0]));
	 FS_32bit fs32(.a(a[31:0]),.b(b[31:0]),.bin(bcin),.bout(bout),.diff(diff[31:0]));


endmodule
