`timescale 1ns / 1ps

module tb_week11hw2;

	// Inputs
	reg clk_ref;
	reg rst;

	// Outputs
	wire clK_50M;
	wire clK_20M;
	wire clK_10M;
	wire clK_5M;

	// Instantiate the Unit Under Test (UUT)
	week11hw2 uut (
		.clk_ref(clk_ref), 
		.rst(rst), 
		.clK_50M(clK_50M), 
		.clK_20M(clK_20M), 
		.clK_10M(clK_10M), 
		.clK_5M(clK_5M)
	);

	always #4 clk_ref = ~clk_ref;	//125Mhz 클럭 발생 (주기 = 8ns)
	
	initial begin
		// Initialize Inputs
		clk_ref = 0;	rst = 0;		//초기값


	end
      
endmodule

