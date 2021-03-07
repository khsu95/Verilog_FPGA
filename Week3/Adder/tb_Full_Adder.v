`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:20:32 09/17/2020
// Design Name:   Full_Adder
// Module Name:   G:/FPGA/Pr3/tb_Full_Adder.v
// Project Name:  Pr3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Full_Adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_Full_Adder;

	// Inputs
	reg a;
	reg b;
	reg cin;

	// Outputs
	wire cout;
	wire sum;

	// Instantiate the Unit Under Test (UUT)
	Full_Adder uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.cout(cout), 
		.sum(sum)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100; a=0;b=0;cin=1;
		#100; a=0;b=1;cin=0;
		#100; a=0;b=1;cin=1;
		#100; a=1;b=0;cin=0;
		#100; a=1;b=0;cin=1;
		#100; a=1;b=1;cin=0;
		#100; a=1;b=1;cin=1;
        
		// Add stimulus here

	end
      
endmodule

