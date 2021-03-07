`timescale 1ns / 1ps

module timer(

	input clk,
	input rst,
	input k,
	output [1:0] seg_en,
	output [6:0] seg_ab,
	output [6:0] seg_cd
    );
	
	wire clk_125M = clk;
	wire clk_10M, clk_1M, clk_1K;
	
	clk_gen_10M u0 (.CLK_125M(clk_125M), .rst(rst), .CLK_10M(clk_10M));
	timer_clk_gen u1 (.clk_in(clk_10M), .rst(rst), .clk_out1(clk_1M), .clk_out2(clk_1K));
	ssd_timer u2 (.clk_high(clk_1M), .clk_low(clk_1K), .rst(rst), .k(k), .segcd(seg_cd), .segab(seg_ab), .seg_en(seg_en));

endmodule
