`timescale 1ns / 1ps


module tb_C_Skip_Adder_32;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg cin;

	// Outputs
	wire [31:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	C_Skip_Adder_32 uut (
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
		#30; a=32'h0000_0001; b=32'h0000_0020;
		#30; a=32'h0000_0001; b=32'h0000_0100;
		#30; a=32'h0000_0001; b=32'h0000_1000;
		#30; a=32'h0000_0001; b=32'h0001_0000;
		#30; a=32'h0000_0001; b=32'h0010_0000;
		
		#30; a=32'h0000_0001; b=32'h0000_0020;
		#30; a=32'h0001_0001; b=32'h0000_0100;
		#30; a=32'h0010_0001; b=32'h0000_1000;
		#30; a=32'h0100_0001; b=32'h0001_0000;
		#30; a=32'h1000_0001; b=32'h0010_0000;
        
		  
		#30; a=32'h0000_0FFF; b=32'h0000_0FFF;
		#30; a=32'h0000_0FFF; b=32'h0000_F000;
		#30; a=32'h0F10_0001; b=32'h00F0_0000;
		#30; a=32'hF100_0001; b=32'h0001_0000;
		#30; a=32'h1000_0001; b=32'hF010_0000; //OverFlow
		// Add stimulus here
		$finish;
	end
      
endmodule

