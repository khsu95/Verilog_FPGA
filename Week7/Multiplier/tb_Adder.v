`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:57:17 10/25/2020
// Design Name:   CLA8
// Module Name:   G:/FPGA/MT3/tb_Adder.v
// Project Name:  MT3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CLA8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_Adder;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	CLA8 uut (
		.a(a), 
		.b(b), 
		.out(out)
	);

initial begin
		// Initialize Inputs
					a = 0;	b = 0;

		// Wait 100 ns for global reset to finish
		#100;		a = 4;   b = 2;
		#100;		a = 4;   b = 12;
		#100;		a = 4;   b = 102;
		#100;		a = 4;   b = 1002;
		
        
		// Add stimulus here

	end
      
endmodule

