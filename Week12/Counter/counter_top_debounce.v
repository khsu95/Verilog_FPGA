`timescale 1ns / 1ps

module counter_top_debounce(clk_ref, RST, en, up, down, cnt);
    input clk_ref;
    input RST;
    input en;
    input up;
    input down;
    output [3:0] cnt;
	 
	 wire clk_125M = clk_ref;
	 wire clk_100M, clk_1M, clk_10k, clk_100;
	 wire s_up, s_down;
	 wire d_up, d_down;
	 
	 clk_gen_100M u0 (clk_125M, clk_100M, RST);
	 //freq_div_100 <clk_ref, reset, clk_div>
	 freq_div_100 u1 (clk_100M, RST, clk_1M); //100M to 1M
	 freq_div_100 u2 (clk_1M, RST, clk_10K); //1M to 10K
	 freq_div_100 u3 (clk_10K, RST, clk_100); //10K to 100
	 
	 sync s1 (clk_100, up, s_up); //for Up botton
	 sync s2 (clk_100, down, s_down); //for Down botton 
	 
	 debc d1 (clk_100, s_up, d_up); //Debounce the Synchronized Up botton Signal
	 debc d2 (clk_100, s_down, d_down); //Debounce the Synchronized Down botton Signal
	 
	 ud_conter_4 c0 (clk_100, RST, en, d_up, d_down, cnt);
	 

endmodule
