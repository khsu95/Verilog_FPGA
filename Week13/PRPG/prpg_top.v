`timescale 1ns / 1ps

module prpg_top(
	input	clk,
	input rst,
	output [1:0] seg_en,
	output [6:0] seg_ab,
	output [6:0] seg_cd,
	output 		 ser_out 
    );

	wire clk_125M = clk;
	wire clk_100M, clk_1M, clk_10k;
	wire clk_100, clk_1;
	wire [15:0] lfsr;
	wire seq;
	wire [3:0] hexa, hexb, hexc, hexd;
	wire [6:0] sega, segb, segc, segd;
	
	assign hexa = lfsr [3:0];
	assign hexb = lfsr [7:4];
	assign hexc = lfsr [11:8];
	assign hexd = lfsr [15:12];
	
	clk_gen_100M u0 (.clk_125M(clk_125M), .rst(rst), .clk_100M(clk_100M));
	freq_div_100 u1 (.clk_ref(clk_100M), .rst(rst), .clk_div(clk_1M));
	freq_div_100 u2 (.clk_ref(clk_1M), .rst(rst), .clk_div(clk_10k));
	freq_div_100 u3 (.clk_ref(clk_10k), .rst(rst), .clk_div(clk_100));
	freq_div_100 u4 (.clk_ref(clk_100), .rst(rst), .clk_div(clk_1));
	
	lfsr u5 (.clk(clk_1), .rst(rst), .out_par(lfsr), .out_ser(seq));
	hex2ssd u6 (.hex(hexa), .seg(sega));
	hex2ssd u7 (.hex(hexb), .seg(segb));
	hex2ssd u8 (.hex(hexc), .seg(segc));
	hex2ssd u9 (.hex(hexd), .seg(segd));
	
	assign seg_en = clk_1M ? 2'b11 : 2'b00;
	assign seg_ab = clk_1M ? segb : sega;
	assign seg_cd = clk_1M ? segd : segc;
	assign seq_out = seq;
	
endmodule
