`timescale 1ns / 1ps

module tb_top;

	// Inputs
	reg clk;
	reg ini;

	// Outputs
	wire msb;
	wire [3:0] seq;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.ini(ini), 
		.msb(msb), 
		.seq(seq)
	);
	reg [4:0] cou=0;
	reg [3:0] mat=4'b1111;

	initial begin
		clk = 0;ini = 1;
		forever 
		begin
			#5 clk=~clk;
			if(mat==seq)	cou=0;
			else cou=cou+1;
			if(ini) ini=#1 0;
		end
	end
      
endmodule

