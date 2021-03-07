`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:52:58 09/22/2020
// Design Name:   Full_Sub
// Module Name:   G:/FPGA/HW2_3/tb_fs1bit.v
// Project Name:  HW2_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Full_Sub
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_fs1bit;

	// Inputs
	reg a;
	reg b;
	reg bin;

	// Outputs
	wire diff;
	wire bout;

	// Instantiate the Unit Under Test (UUT)
	Full_Sub uut (
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
		#100;a=1;b=1; bin=0;
		#100;a=1;b=1; bin=1;
		#100;a=1;b=0; bin=1;
		#100;a=0;b=1; bin=1;
		#100;a=0;b=1; bin=0;
        
		// Add stimulus here

	end
      
endmodule

