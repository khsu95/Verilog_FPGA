`timescale 1ns / 1ps

module fifo_16_4(
    input clk,
    input rstn,
    input push,
    input pop,
    input [3:0] data_in,
    output [3:0] data_out,
    output empty,
    output full
    );
	 
	 reg [3:0] data [0:15]; //4bit 16columm
	 reg [4:0] cnt;
	 reg [3:0] read_ptr;
	 reg [3:0] write_ptr;
	 reg [3:0] data_out_reg;
	 
	 assign data_out = data_out_reg;
	 assign full = (cnt == 5'b10000) ? 1'b1 : 1'b0;
	 assign empty = (cnt == 5'b00000) ? 1'b1 : 1'b0;
	 
	 always @ (posedge clk or negedge rstn)
	 begin
		//Reset
		if(rstn == 1'b0)
		begin
			data [ 0]   <= 4'd0;
			data [ 1]   <= 4'd0;
			data [ 2]   <= 4'd0;
			data [ 3]   <= 4'd0;
			data [ 4]   <= 4'd0;
			data [ 5]   <= 4'd0;
			data [ 6]   <= 4'd0;
			data [ 7]   <= 4'd0;
			data [ 8]   <= 4'd0;
			data [ 9]   <= 4'd0;
			data [10]   <= 4'd0;
			data [11]   <= 4'd0;
			data [12]   <= 4'd0;
			data [13]   <= 4'd0;
			data [14]   <= 4'd0;
			data [15]   <= 4'd0;
			read_ptr    <= 4'd0;
			write_ptr   <= 4'd0;
			data_out_reg<= 4'd0;
			cnt   		<= 4'd0;
		end
		else
		begin
			//Write
			if(push && ~full && ~pop)
			begin
				write_ptr 		 <= write_ptr + 1'b1;
				data[write_ptr] <= data_in;
				cnt 				 <= cnt + 1'b1;
			end
			//Read
			else if(pop && ~empty && ~push)
			begin
				read_ptr			<= read_ptr + 1'b1;
				data_out_reg   <= data[read_ptr];
				data[read_ptr] <= 4'd0;
				cnt  				<= cnt - 1'b1;
			end
			//Else
			else if(empty)
			begin
				cnt <= 5'd0;
			end
			else
			begin
				data_out_reg  <= data_out_reg;
			end
		end
	end
endmodule
