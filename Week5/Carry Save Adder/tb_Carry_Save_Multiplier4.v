`timescale 1ns / 1ps


module tb_Carry_Save_Multiplier4;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	Carry_Save_Multiplier4 uut (
		.a(a), 
		.b(b), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;b = 0;

		// Wait 100 ns for global reset to finish
		#30; a = 4'b0001; b = 4'b0000;
		#30; a = 4'b0010; b = 4'b1010;
		#30; a = 4'b0100; b = 4'b0101;
		#30; a = 4'b1000; b = 4'b0011;
		#30; a = 4'b0011; b = 4'b1000;
		#30; a = 4'b0101; b = 4'b0100;
		#30; a = 4'b1010; b = 4'b0010;
		#30; a = 4'b0000; b = 4'b0001;
		#30; a = 4'b0000; b = 4'b0001;
		$finish;
		// Add stimulus here

	end
      
endmodule

