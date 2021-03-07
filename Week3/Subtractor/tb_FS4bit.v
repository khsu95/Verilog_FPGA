`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:50:25 09/22/2020
// Design Name:   FS_4bit
// Module Name:   G:/FPGA/HW2_3/tb_FS4bit.v
// Project Name:  HW2_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FS_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_FS4bit;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg bin;

	// Outputs
	wire [3:0] diff;
	wire bout;

	// Instantiate the Unit Under Test (UUT)
	FS_4bit uut (
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
		#100; a=4'hc;b=4'h9;bin=0;
		#100; a=4'h9;b=4'hc;bin=0;
		#100; a=4'he;b=4'hc;bin=1;
		#100; a=4'he;b=4'h9;bin=1;
        
		// Add stimulus here

	end
      
endmodule

