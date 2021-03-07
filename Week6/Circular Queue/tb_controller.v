`timescale 1ns / 1ps



module tb_controller;

	// Inputs
	reg clk;
	reg rst;
	reg [3:0] read;
	reg write;

	// Outputs
	wire [15:0] address;
	wire r_w;

	// Instantiate the Unit Under Test (UUT)
	controller uut (
		.clk(clk), 
		.rst(rst), 
		.read(read), 
		.write(write), 
		.address(address), 
		.r_w(r_w)
	);
	
	initial 
	begin
		clk=1'b0;
		forever #5 clk=~clk;
	end

	initial begin
		// Initialize Inputs
		rst = 1;		read = 0;		write = 0;

		// Wait 100 ns for global reset to finish
		#20 rst = 0;		read = 0;		write = 1;		
		#20 rst = 0;		read = 13;		write = 1;	
		#20 rst = 0;		read = 8;		write = 1;	
		#20 rst = 0;		read = 0;		write = 1;	
		#20 rst = 0;		read = 0;		write = 1;	
		#20 rst = 0;		read = 4;		write = 1;	

        
		// Add stimulus here

	end
      
endmodule

