`timescale 1ns / 1ps

module ha(x, y, sum, cout);
	input x;
	input y;
	output sum;
	output cout;
	
	assign sum=x^y;
	assign cout=x&y;

endmodule
