`timescale 1ns / 1ps



module tb_week11hw1;

	// Inputs
	reg clk_ref;
	reg rst;
	reg X;
	reg Y;
	reg Cin;

	// Outputs
	wire Cout;
	wire Sum;

	// Instantiate the Unit Under Test (UUT)
	week11hw1 uut (
		.clk_ref(clk_ref), 
		.rst(rst), 
		.X(X), 
		.Y(Y), 
		.Cin(Cin), 
		.Cout(Cout), 
		.Sum(Sum)
	);
	always #4 clk_ref = ~clk_ref; 	//125Mhz 클럭 발생
	
	initial begin
		// Initialize Inputs
		clk_ref = 0;	rst = 0;			//초기 값
		X = 0;	Y = 0;	Cin = 0;		
#20	X = 0;	Y = 0;	Cin = 1;
#20	X = 0;	Y = 1;	Cin = 0;	
#20	X = 0;	Y = 1;	Cin = 1;
#20	X = 1;	Y = 0;	Cin = 0;
#20	X = 1;	Y = 0;	Cin = 1;
#20	X = 1;	Y = 1;	Cin = 0;
#20	X = 1;	Y = 1;	Cin = 1;		// X, Y, Cin 값을 입력함.
	end
      
endmodule

