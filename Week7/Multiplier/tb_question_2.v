`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:36:56 10/25/2020
// Design Name:   MT2
// Module Name:   G:/FPGA/MT2/tb_MT2.v
// Project Name:  MT2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MT2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_MT2;

	// Inputs
	reg CLK;
	reg St;
	reg [15:0] Mplier;
	reg [15:0] Mcand;

	// Outputs
	wire [31:0] Product;
	wire Done;

	// Instantiate the Unit Under Test (UUT)
	MT2 uut (
		.CLK(CLK), 
		.St(St), 
		.Mplier(Mplier), 
		.Mcand(Mcand), 
		.Product(Product), 
		.Done(Done)
	);

	always #5 CLK=~CLK;

	initial begin
		// Initialize Inputs
		CLK = 0;		St = 0;		Mplier = 0;		Mcand = 0;
		//++
		#20;		   St = 1;		Mplier = 16'h0FFF;		Mcand = 16'h0001;//4095 * 1 =4095
		#160;		   St = 0;
		#20;		   St = 1;		Mplier = 16'h0FAF;		Mcand = 16'hAA01; //4015 * -22015 = -88390225
		#160;		   St = 0;
		//-+
		#20;		   St = 1;		Mplier = 16'hF003;		Mcand = 16'h00F4; //-4096 * 244 = -998692
		#160;			St = 0;	
		#20;		   St = 1;		Mplier = 16'h8043;		Mcand = 16'h00F4; //-32701 * 244 = -7979044
		#160;			St = 0;		
		//+-
		#20;			St = 1;		Mplier = 16'h00F4;		Mcand = 16'h8043; //244* -32701 = -7979044
		#160;			St = 0;
		#20;		   St = 1;		Mplier = 16'h00F4;		Mcand = 16'hF003; //244* -4093 = -998692
		#160;			St = 0;
		//--
		#20;		   St = 1;		Mplier = 16'hF003;		Mcand = 16'hF004; //-4093 *-4092 = 16748556 
		#160;			St = 0;
		#20;		   St = 1;		Mplier = 16'h9003;		Mcand = 16'h8043; //-28669 * -32701 = 937504969
		#160;
		
		$finish;
        
		// Add stimulus here

	end
      
endmodule

