`timescale 1ns / 1ps

module tb_Signed_Array_Multiplier_32;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [63:0] mul;

	// Instantiate the Unit Under Test (UUT)
	Signed_Array_Multiplier_32 uut (
		.a(a), 
		.b(b), 
		.mul(mul)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100; a = 32'h00000FFF; b = 32'h0000FFFF; //4095*65535 = 268,365,825
		#100; a = 32'h00000FFF; b = 32'hFFFF0001; //4095*-65535 = -268,365,825
		#100; a = 32'hFFFFF001; b = 32'h0000FFFF; //-4095*65535 = -268,365,825
		#100; a = 32'h00000000; b = 32'h00000000; //0*0
		#100; a = 32'hFFFFF001; b = 32'hFFFF0001; //-4095*-65535 = 268,365,825
		#100; a = 32'h00000FFF; b = 32'h0000FFFF; //4095*65535 = 268,365,825
		$finish;
        
		// Add stimulus here

	end
      
endmodule

