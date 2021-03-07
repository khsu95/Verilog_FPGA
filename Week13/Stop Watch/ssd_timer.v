`timescale 1ns / 1ps


module ssd_timer(
	input clk_high,
	input clk_low,
	input rst,
	input k,
	output [1:0] seg_en,
	output [6:0] segcd,
	output [6:0] segab
    );

	reg [3:0] cnt;
	reg [14:0] timer;
	
	wire [3:0] d_d, d_c, d_b, d_a;
	wire [14:0] mod_1000;
	wire [8:0] mod_100;
	wire [6:0] mod_10;
	wire [3:0] d_cd, d_ab;
	
	assign d_d =timer /1000;
	assign mod_1000 = timer - (d_d * 1000);
	
	assign d_c = mod_1000 /100;
	assign mod_100 = mod_1000 - (d_c * 100);
	
	assign d_b = mod_100 /10;
	assign mod_10 = mod_100 - (d_b * 10);
	
	assign d_a = mod_10;
	
	assign d_cd = clk_high ? d_d : d_c;
	assign d_ab = clk_high ? d_b : d_a;
	
	assign seg_en = clk_high ? 2'b11 : 2'b00;
	
	always @ (posedge clk_low or posedge rst)
	begin
	
		if(rst)
		begin
			cnt <= 4'd0;
			timer <= 15'd0;
		end
		
		else
			begin
				if(k == 0)
					begin
						if(cnt >= 4'd9)
							begin
								cnt <= 4'd0;
									if(timer > 9999)
										begin
											timer <= 15'd0;
										end
				
									else
										begin
											timer <= timer + 1'b1;
										end
							end
						else
							begin
								cnt <= cnt+ 1'b1;
							end
					end
			
				else if(k ==1)
			
					begin
						if(timer == 1500)
							begin
								timer <= 15'd1500;
							end
						else
							begin
								if(cnt >= 4'd9)
									begin
										cnt <= 4'd0;
											if(timer > 9999)
												begin
													timer <= 15'd0;
												end
											else
												begin
													timer <= timer + 1'b1;
												end
									end
								else
									begin
										cnt <= cnt+ 1'b1;
									end
							end
					end
			end
	end
	
	bcd2seg u0 (.bcd(d_cd), .seg(segcd));
	bcd2seg u1 (.bcd(d_ab), .seg(segab));
	
endmodule
