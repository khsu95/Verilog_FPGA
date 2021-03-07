`timescale 1ns / 1ps

module fa(x, y, cin, cout, sum);
	input x;
	input y;
	input cin;
	output cout;
	output sum;
	
	assign sum=x^y^cin;
	assign cout=(x&y)|(x&cin)|(y&cin);

endmodule
