`timescale 1ns / 1ps

module fifo_16_4(
    input clk,
    input rstn,
    input WE,
    input RE,
    input [3:0] data_in,
	 input [3:0] addrA,
	 input [3:0] addrB,
    output [3:0] data_out
    );
	 
	 reg [3:0] data [0:15]; //4bit 16columm
	 reg [3:0] read_ptr;
	 reg [3:0] write_ptr;
	 reg [3:0] data_out_reg;
	 
	 assign data_out = data_out_reg;

	 
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
			data_out_reg<= 4'd0;
		end
		else
		begin
			//Push-Write
			if(WE && ~RE)
			begin
				data[addrA] <= data_in;
			end
			//Pop-Read
			else if(~WE && RE)
			begin
				data_out_reg   <= data[addrB];
				data[addrB] <= 4'd0;
			end
			//Full or Empty
			else
			begin
				data_out_reg  <= data_out_reg;
			end
		end
	end
endmodule
