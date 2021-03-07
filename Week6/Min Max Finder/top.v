`timescale 1ns / 1ps

module top(clk, rst, en, data, out);
	input clk;
	input rst;
	input en;
	input [15:0] data;
	output [31:0] out;
	
	wire [15:0] wmin, wmax;

	stage1_2 f0(clk, rst, en, data, wmin, wmax); //clk, rst, en, data, next_state, o_state, o_cnt, o_min, o_max
	lastStage f2(wmin, wmax, out);//(min, max, data)

endmodule
