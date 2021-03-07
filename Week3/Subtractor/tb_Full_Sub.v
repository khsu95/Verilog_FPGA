`timescale 1ns / 1ps



module tb_Full_Sub;

	// Inputs
	reg a;
	reg b;
	reg bin;

	// Outputs
	wire diff;
	wire bout;

	// Instantiate the Unit Under Test (UUT)
	Full_Adder uut (
		.a(a), 
		.b(b), 
		.bin(bin), 
		.diff(diff), 
		.bout(bout)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		bin = 0;

		// Wait 100 ns for global reset to finish
		#100; a=0;b=0;bin=1;
		#100; a=0;b=1;bin=0;
		#100; a=0;b=1;bin=1;
		#100; a=1;b=0;bin=0;
		#100; a=1;b=0;bin=1;
		#100; a=1;b=1;bin=0;
		#100; a=1;b=1;bin=1;
        
		// Add stimulus here

	end
      
endmodule

