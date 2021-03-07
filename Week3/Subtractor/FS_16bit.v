`timescale 1ns / 1ps

module FS_16bit(
	input [15:0] a,
	input [15:0] b,
	input bin,
	output [15:0] diff,
	output bout
    );
	 
	 
	 wire c0,c1,c2;
	 
	 //From Most right bit
	 FS_4bit f40(.a(a[3:0]),.b(b[3:0]),.bin(bin),.diff(diff[3:0]),.bout(c0)); //Mapping using var name
	 FS_4bit f41(.a(a[7:4]),.b(b[7:4]),.bin(c0),.diff(diff[7:4]),.bout(c1)); //Conect each sub using wire
	 FS_4bit f42(.a(a[11:8]),.b(b[11:8]),.bin(c1),.diff(diff[11:8]),.bout(c2));
	 FS_4bit f43(.a(a[15:12]),.b(b[15:12]),.bin(c2),.diff(diff[15:12]),.bout(bout));


endmodule
