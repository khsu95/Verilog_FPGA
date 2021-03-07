`timescale 1ns / 1ps

module stage1_2(clk, rst, en, data, o_min, o_max);
	input clk;
	input rst;
	input en;
	input [15:0] data;
	output reg [15:0] o_min;
	output reg [15:0] o_max;
	
	//Shared Data
	reg [15:0] dt_table [15:0]; //16*16 array
	reg [3:0] cnt; //~15 count
	reg state;
	
	//for Stage 2
	reg [15:0] min, max; 
	
	
	always @ (posedge clk)
	begin
		
		//Initial
		if(rst)//At first, rst must be High
		begin
			state <=0;
			cnt <=0;
			min <=16'hFFFF;//Set Maximum 
			max <=0;
		end
		
		//Process
		else
		begin
			//Stage 1
			if(!state)
			begin
				dt_table[cnt] <= data;
			end
			
			//Stage 2
			else
			begin
				//Find Max
				if(dt_table[cnt]>max)
					max<=dt_table[cnt];
				//Find Min
				if(dt_table[cnt]<min)
					min<=dt_table[cnt];
			end
	//State FF
			//count 15
			if(cnt==4'b1111)
			begin
				//Stage2 Completed
				if(state)
				begin
					o_min <= min;
					o_max <= max;
				end
				
				//State 1 or 2
				state <= ~state;
			end
		
			cnt <= cnt+1;//Counter
		end
	end
endmodule
