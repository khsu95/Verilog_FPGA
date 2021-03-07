`timescale 1ns / 1ps

module top(clk, rst, en, read, write, datain, dataout);
	input clk;
	input rst;
	input en;
	input [3:0] read;
	input write;
	input [7:0] datain;
	output [7:0] dataout;
	
	//Wire Between Control and Data Module
	wire [15:0] add_path; 
	wire rw;
	
	controller cont (clk, rst, en, read, write, add_path, rw); //Control Module
	data dat (add_path, rw, datain, dataout); //Data Module


endmodule
