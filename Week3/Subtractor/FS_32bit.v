`timescale 1ns / 1ps

module FS_32bit(
	input [31:0] a,
	input [31:0] b,
	input bin,
	output [31:0] diff,
	output bout
    );
	 
	 wire c0;
	 
	 FS_16bit f160(.a(a[15:0]),.b(b[15:0]),.bin,.diff(diff[15:0]),.bout(c0));
	 FS_16bit f161(.a(a[31:16]),.b(b[31:16]),.bin(c0),.diff(diff[31:16]),.bout(bout)); //var bout will detect Underflow

		
endmodule
