`timescale 1ns / 1ps



module tb_segment7;

	// Inputs
	reg [7:0] bcd;

	// Outputs
	wire [6:0] unit_display;
	wire [6:0] ten_display;

	// Instantiate the Unit Under Test (UUT)
	segment7 uut (
		.bcd(bcd), 
		.unit_display(unit_display), 
		.ten_display(ten_display)
	);

	initial begin
		// Initialize Inputs
		bcd = 0;

		// Wait 100 ns for global reset to finish
		#100; bcd=8'b00000100;
#100; bcd=8'b00010001;
#100; bcd=8'b00100010;
#100; bcd=8'b11110011;
#100; bcd=8'b00000001;
#100; bcd=8'b10010100;
#100; bcd=8'b10101011;
#100; bcd=8'b11010001;
#100; bcd=8'b11100100;
#100; bcd=8'b00010101;
#100; bcd=8'b10000010;
#100; bcd=8'b11000001;
#100; bcd=8'b10100001;
#100; bcd=8'b10010000;
#100; bcd=8'b11000000;
#100; bcd=8'b00010110;
        
		// Add stimulus here

	end
      
endmodule

