`timescale 1ns / 1ps

module controller(clk, rst, en, read, write, address, r_w);
	input clk;
	input rst;
	input en;
	input [3:0] read; //4bit address
	input write; //High -> write
	output reg [15:0] address; //16bit address, one-hot encoded
	output reg r_w;
	
	reg [3:0] cnt; //16 element
	
	always @ (posedge clk)
	begin
		//Reset
		if(rst)	cnt<=0;
		
		//Write
		else if(write)
		begin
			cnt <= cnt+1; //Increase cnt
			address <= (1<<cnt); //one-hot encoding
		end
		
		//Read
		else
		begin
			address <= (1<<read); //one-hot encoding
		end
		r_w <= write;
	end
endmodule
