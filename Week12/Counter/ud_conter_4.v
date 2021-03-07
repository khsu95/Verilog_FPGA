`timescale 1ns / 1ps

module ud_conter_4(clk, rst, en, up, down, cnt);
    input clk;
    input rst;
    input en;
    input up;
    input down;
    output reg [3:0] cnt;
	 
	 always @ (posedge clk)
	 begin
		if(rst)
		begin
			cnt <= 4'd0; //'d means Decimal not Binary
		end
		else
		begin
			if(en) 
			begin
				if(up) //Up button was pressed
				begin
					cnt <= cnt +4'd1;
				end
				else if(down) //Down button was Pressed
				begin
					cnt <= cnt - 4'd1;
				end
				else //Default Case
				begin
					cnt <= cnt;
				end
			end
			else //Disable Signal
			begin
				cnt <= 4'd0;
			end
		end
	end
endmodule
