`timescale 1ns / 1ps

module tb_FA_32bit;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg cin;

	// Outputs
	wire [31:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	FA_32bit uut (
		.a(a), 
		.b(b), 
		.cin(cin), 
		.sum(sum), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 32'b0000000000010001;
		b = 32'b0000000000000010;
		cin = 1'b0;

		// Wait 100 ns for global reset to finish
		#100; a=32'b1011000000110001; b=32'b0000000011001100; cin=1'b0;
		#100; a=32'b0011000000000011; b=32'b0000110100000100; cin=1'b1;
		#100; a=32'b0000010010000011; b=32'b0000000110000100; cin=1'b1;
		#100; a=32'b0001100000000011; b=32'b0000001011100100; cin=1'b0;
		#100; a=32'b0000000101000011; b=32'b0010110000000100; cin=1'b0;
		#100; a=32'b0110000011000011; b=32'b0001011100110100; cin=1'b0;
		#100; a=32'b0000000110000011; b=32'b0000000011110100; cin=1'b0;
		#100; a=32'b1011001110000011; b=32'b0001101000000100; cin=1'b0;
        
		// Add stimulus here

	end
      
endmodule

