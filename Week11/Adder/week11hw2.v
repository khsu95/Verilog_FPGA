`timescale 1ns / 1ps

module week11hw2(
    
	 input clk_ref,
	 input rst,
	 output clK_50M,
	 output clK_20M,
	 output clK_10M,
	 output clK_5M			//input,output ¼³Á¤
	 );

	 wire clk_125M = clk_ref;

clock_gen u0 (

	 .CLK_125M(clk_125M),      
    .CLK_50M(clK_50M),     
    .CLK_20M(clK_20M),     
    .CLK_10M(clK_10M),     
    .CLK_5M(clK_5M),     
    .RST(rst)       

);					//clock generator module ºÒ·¯¿È.



endmodule
