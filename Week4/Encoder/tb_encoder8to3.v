`timescale 1ns / 1ps
module tb_encoder8to3;

	// Inputs
	reg [6:0] in;
	reg en;

	// Outputs
	wire [2:0] out;

	// Instantiate the Unit Under Test (UUT)
	encoder8to3 uut (
		.in(in), 
		.en(en), 
		.out(out)
	);
	initial begin
		// Initialize Inputs
		in = 0;en = 0;

		// Wait 100 ns for global reset to finish
		//Enable case
		#50; en=1; in=7'b0000000;
		#50; en=1; in=7'b0000001;
		#50; en=1; in=7'b0000011;
		#50; en=1; in=7'b0000111;
		#50; en=1; in=7'b0001111;
		#50; en=1; in=7'b0011111;
		#50; en=1; in=7'b0111111;
		#50; en=1; in=7'b1111111;
		//Disable case
		#50; en=0; in=7'b0000000;
		#50; en=0; in=7'b0000001;
		#50; en=0; in=7'b0000011;
		#50; en=0; in=7'b0000111;
		#50; en=0; in=7'b0001111;
		#50; en=0; in=7'b0011111;
		#50; en=0; in=7'b0111111;
		#50; en=0; in=7'b1111111;
		//Exception case
		#50; en=1; in=7'b0011000;
		#50; en=1; in=7'b1111000;
		#50; en=1; in=7'b0000111;
		#50; en=1; in=7'b0010110;
        
		// Add stimulus here
	end
      
endmodule

