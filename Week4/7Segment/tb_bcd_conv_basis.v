`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:57:45 09/27/2020
// Design Name:   bcd_conv_basis
// Module Name:   G:/FPGA/hw4_2/tb_bcd_conv_basis.v
// Project Name:  hw4_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bcd_conv_basis
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_bcd_conv_basis;

	// Inputs
	reg shin;
	reg CLK=0;
	initial CLK = 0;
	always #10 CLK = ~CLK;
	// Outputs
	wire [3:0] data;
	wire shout;

	// Instantiate the Unit Under Test (UUT)
	bcd_conv_basis uut (
		.shin(shin), 
		.data(data), 
		.shout(shout), 
		.CLK(CLK)
	);

	initial begin
		// Initialize Inputs
		// Wait 100 ns for global reset to finish
		shin=0;
		#25; shin=1;
		#25; shin=1;
		#25; shin=1;
		#25; shin=0;
		$finish;
        
		// Add stimulus here

	end
      
endmodule

