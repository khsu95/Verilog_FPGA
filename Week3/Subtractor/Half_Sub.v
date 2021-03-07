`timescale 1ns / 1ps


module Half_Sub(
	input a,
	input b,
	output sub,
	output bor
    );
	 
	 assign sub=a^b;
	 assign bor=(~a)&b;


endmodule
