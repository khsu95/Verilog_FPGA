`timescale 1ns / 1ps

module clk_div(clk_ref, RST, clk60, clk45, clk15, clk7);
	input clk_ref;
	input RST;
	output clk60;
	output clk45;
	output clk15;
	output clk7;
	
	wire clk125 = clk_ref;
	wire clk60M, clk45M, clk15M, clk7M;
	
	clk_gen u0 (clk125, clk60M, clk45M, clk15M, clk7M, RST);
	
	freq_div_1M for60 (clk60M, RST, clk60); //Convert 60MHz to 60Hz
	freq_div_1M for45 (clk45M, RST, clk45); //Convert 45MHz to 45Hz
	freq_div_1M for15 (clk15M, RST, clk15); //Convert 15MHz to 15Hz
	freq_div_1M for7 (clk7M, RST, clk7);    //Convert 7MHz to 7Hz

endmodule
