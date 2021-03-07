`timescale 1ns / 1ps

module timer_clk_gen(
	input clk_in,
	input rst,
	output reg clk_out1,
	output reg clk_out2
    );


	reg [2:0] cnt1;
	reg [12:0] cnt2;
	
	always @ (posedge clk_in or posedge rst)
	begin
		if(rst)
		begin
			cnt1 <= 3'd0;
			cnt2 <= 13'd0;
			clk_out1 <= 1'd0;
			clk_out2 <= 1'd0;
		end
		else
		begin
			if(cnt1 >= 3'd4)
			begin
				cnt1 <= 3'd0;
				clk_out1 <= ~ clk_out1;
			end
			else
			begin
				cnt1 <= cnt1 + 1'b1;
			end
			if(cnt2 >= 13'd4999)
			begin
				cnt2 <= 13'd0;
				clk_out2 <= ~clk_out2;
			end
			else
			begin
				cnt2 <= cnt2 + 1'b1;
			end
		end
	end

endmodule
