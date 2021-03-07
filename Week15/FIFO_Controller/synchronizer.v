`timescale 1ns / 1ps

module sync(clk, async_in, sync_out);
    input clk;
    input async_in;
    output reg sync_out;

	reg temp;
	
	always @ (posedge clk)
	begin
		temp <= async_in;
		sync_out <= temp;//Syncronized
	end

endmodule
