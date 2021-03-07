`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:38:38 09/19/2020
// Design Name:   FA_4bit
// Module Name:   G:/FPGA/HW2_2/tb_FA_4bit.v
// Project Name:  HW2_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FA_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_FA_4bit;

	// Inputs
	reg [3:0] a;
	reg [3:0] b;
	reg cin;

	// Outputs
	wire [3:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	FA_4bit uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100; a=4'b0011; b=4'b0001; cin=0;
		#100; a=4'b0011; b=4'b0001; cin=1;
		#100; a=4'b0011; b=4'b1101; cin=0;
		#100; a=4'b0011; b=4'b1101; cin=1;
        
		// Add stimulus here

	end
      
endmodule

