`timescale 1ns / 1ps

module freq_div_100(clk_ref, rst, clk_div);
    input clk_ref;
    input rst;
    output reg clk_div;

	reg [5:0] cnt;
	
	always @ (posedge clk_ref)
	begin
		if(rst) //async reset
		begin
			cnt <= 6'd0;
			clk_div <= 1'd0;
		end
		else
		begin
			if(cnt == 6'd49) //count 50 -> clk/2*50 -> divide 100 into clock
			begin
				cnt <= 6'd0;
				clk_div <= ~clk_div;
			end
			else
			begin
				cnt <= cnt + 1'b1;
			end
		end
	end

endmodule
