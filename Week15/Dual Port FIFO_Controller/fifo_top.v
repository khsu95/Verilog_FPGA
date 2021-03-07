`timescale 1ns / 1ps

module fifo_top(
    input clk_125M,
    input rst,
    input push,
    input pop,
    input [3:0] data_in,
    output [6:0] segment1,
    output [6:0] segment2,
    output [1:0] segment_en,
    output LED_empty,
    output LED_full
    );
	 
	 wire clk_100M, clk_1M, clk_1K, clk_100;
	 //Wire for Button
	 wire debounce_push, debounced_pop, rstn;
	 //Wire for Control Signal
	 wire WE, RE, wFull, wEmpty;
	 //Wire for Seven-Segment
	 wire [6:0] segA, segB, segC, segD;
	 //Wire for Address Bus
	 wire [3:0] addrA, addrB;
	 //Wire for Data
	 wire [3:0] dataOut;
	 
	 //Turn on Seven-Segments alternatively
	 assign {segment1, segment_en[0]} = clk_100 ? {segA, 1'b1} : {segB, 1'b0};
	 assign {segment2, segment_en[1]} = clk_100 ? {segC, 1'b1} : {segD, 1'b0};
	 
	 assign LED_empty = wEmpty;
	 assign LED_full = wFull;
	 assign rstn = ~rst;


	 //Clock
	 clk_gen_100M c0 (clk_125M, clk_100M, rst);
	 freq_div_100 f0 (clk_100M, rst, clk_1M);
	 freq_div_100 f1 (clk_1M, rst, clk_1K);
	 freq_div_100 f2 (clk_1K, rst, clk_100);
	 
	 //IO
	 button_filter b0 (clk_100, push, debounce_push);
	 button_filter b1 (clk_100, pop, debounced_pop);
	 
	 //Control Unit
	 controller CU (clk_100, rst, debounced_pop, debounce_push, WE, RE, wFull, wEmpty);
	 
	 //Addresseer
	 Address AU (clk_100, rst, WE, RE, addrA, addrB);
	 
	 //FIFO 16X4
	 fifo_16_4 u0 (clk_100, rstn, WE, RE, data_in, addrA, addrB, dataOut);
	 
	 //HEX2SSD
	 hex2ssd h0 (addrA, segA);
	 hex2ssd h1 (addrB, segB);
	 hex2ssd h2 (dataOut, segC);
	 hex2ssd h3 (data_in, segD);


endmodule
