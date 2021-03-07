`timescale 1ns / 1ps

module debc(clk, noisy_input, debounced_output);
    input clk;
    input noisy_input;
    output debounced_output;


	reg [3:0] cnt;
	
	always @ (posedge clk)
	begin
		if(noisy_input) //unstable signal
		begin
			if(cnt>=4'b1010) //prevent cnt from setting to 0
				cnt <= 4'b1010;
			else
				cnt <= cnt + 4'd1;
		end
		else
			cnt<=0;
	end
	
	assign debounced_output = (cnt==4'b1010) ? 1'b1 : 1'b0; //10 cycle
endmodule
