`timescale 1ns / 1ps

module FS_4bit(
	input [3:0] a,
	input [3:0] b,
	input bin,
	output [3:0] diff,
	output bout
    );
	 
	 wire c0,c1,c2;
	 
	 Full_Sub fs10(.a(a[0]),.b(b[0]),.bin(bin),.diff(diff[0]),.bout(c0)); //Full-subtractor will be used
	 Full_Sub fs11(.a(a[1]),.b(b[1]),.bin(c0),.diff(diff[1]),.bout(c1));
	 Full_Sub fs12(.a(a[2]),.b(b[2]),.bin(c1),.diff(diff[2]),.bout(c2));
	 Full_Sub fs13(.a(a[3]),.b(b[3]),.bin(c2),.diff(diff[3]),.bout(bout));


endmodule
