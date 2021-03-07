`timescale 1ns / 1ps

module Full_Sub(
	input a,
	input b,
	input bin,
	output diff,
	output bout
    );
	 
	 assign diff= bin^(a^b);
	 assign bout=((~a)&b)^(bin&(~(a^b))); 


endmodule
