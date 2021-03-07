`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:43:03 09/22/2020
// Design Name:   FS_16bit
// Module Name:   G:/FPGA/HW2_3/tb_FS16bit.v
// Project Name:  HW2_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FS_16bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_FS16bit;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg bin;

	// Outputs
	wire [15:0] diff;
	wire bout;

	// Instantiate the Unit Under Test (UUT)
	FS_16bit uut (
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
		#100; a=16'haaaa;b=16'h1111;
		#100; a=16'ha11a;b=16'hfdd1;
		#100; a=16'hc54a;b=16'h1cc1;
		#100; a=16'hadef;b=16'h1221;
        
		// Add stimulus here

	end
      
endmodule

