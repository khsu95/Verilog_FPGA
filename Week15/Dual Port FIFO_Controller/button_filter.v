`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:28:57 12/04/2020 
// Design Name: 
// Module Name:    button_filter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module button_filter(
    input clk,
    input noisy_input,
    output debounce_output
    );

	wire sync_input;
	
	sync u0 (clk, noisy_input, sync_input);
	debc u1 (clk, sync_input, debounce_output);
	
endmodule
