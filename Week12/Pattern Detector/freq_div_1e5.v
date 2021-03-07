`timescale 1ns / 1ps

module freq_div_1e5(clk_ref, rst, clk_div);
	input clk_ref;
	input rst;
	output clk_div;
	
	wire _1st, _2nd, _3rd;
	
	freq_div_100 __1st (clk_ref, rst, _1st); //div 100
	freq_div_100 __2nd (_1st, rst, _2nd);    //div 100*100
	freq_div_100 __3rd (_2nd, rst, _3rd); //div 100*100*100 =1M
	freq_div_100 __4th (_3rd, rst, clk_div); //div 1M*100

endmodule
