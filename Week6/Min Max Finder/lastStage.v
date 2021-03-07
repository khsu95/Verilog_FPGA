`timescale 1ns / 1ps

module lastStage(min, max, data);
	input [15:0] min;
	input [15:0] max;
	output [31:0] data;
	
	//multiply
	assign data= min*max;	

endmodule
