`timescale 1ns / 1ps


module tb_half_adder;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	Half_Adder uut (
		.a(a), 
		.b(b), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100; a=0;b=1;
		#100; a=1;b=0;
		#100; a=1;b=1;
        
		// Add stimulus here

	end
      
endmodule

