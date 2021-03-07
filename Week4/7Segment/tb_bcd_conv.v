`timescale 1ns / 1ps

module tb_bcd_conv;

	// Inputs
	reg [7:0] bin;
	wire [3:0] dec1;
	wire [7:4] dec2;
	wire [11:8] dec3;
	
	// Instantiate the Unit Under Test (UUT)
	bcd_conv uut (
		.bin(bin), 
		.dec({dec1,dec2,dec3})
	);

	
	initial begin
		// Initialize Inputs

		// Wait 100 ns for global reset to finish
		bin=8'd51;
		#200 $finish;
        
		// Add stimulus here

	end
      
endmodule

