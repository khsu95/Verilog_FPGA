`timescale 1ns / 1ps

module Pattern_Detector(clk, rst, button, decA, decB, decC);
	input clk;
	input rst;
	input button;
	output decA; //detect 101
	output decB; //detect 010
	output decC;

	wire clk_125M = clk;
	wire clkA, clkB, sync_out, nwbit; 
	
	//Clock Generate
	clk_gen u0 (clk_125M, clkA, rst); //25MHz Generate
	//Frequency Divider
	freq_div_1e5 u1 (clkA, rst, clkB); //25MHz -> 2.5Hz(4s)
	
	//Sync and Debouncer
	sync u2 (clkA, button, sync_out);
	debc u3 (clkA, sync_out, nwbit);

	
	//Sequence Detector
	Pattern_DetectorA da (clkB, nwbit, decA); //for 101
	Pattern_DetectorB db (clkB, nwbit, decB); //for 010
	
	assign decC = nwbit;
	

endmodule
