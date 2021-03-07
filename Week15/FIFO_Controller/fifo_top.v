`timescale 1ns / 1ps

module fifo_top(
    input clk_125M,
    input rst,
    input push,
    input pop,
    input [3:0] data_in,
    output [6:0] segment1,
    output [6:0] segment2,
    output [1:0] segment_en,
    output empty,
    output full
    );
	 
	 wire clk_100M, clk_1M, clk_1K, clk_100;
	 wire debounce_push, debounced_pop;
	 wire rstn;
	 
	 assign rstn = ~rst;
	 assign segment_en = 2'b00;
	 
	 //Clock 
	 clk_gen_100M c0 (clk_125M, clk_100M, rst);
	 freq_div_100 f0 (clk_100M, rst, clk_1M);
	 freq_div_100 f1 (clk_1M, rst, clk_1K);
	 freq_div_100 f2 (clk_1K, rst, clk_100);
	 
	 //IO
	 button_filter b0 (clk_100, push, debounce_push);
	 button_filter b1 (clk_100, pop, debounced_pop);
	 
	 localparam IDLE    = 3'd0,
					WRITE_1 = 3'd1,
					WRITE_2 = 3'd2,
					READ_1  = 3'd3,
					READ_2  = 3'd4,
					DONE    = 3'd5;
					
	reg [2:0] nst, cst;
	reg [3:0] fifo_in_reg;
	wire [3:0] fifo_out;
	reg push_reg, pop_reg;
	
	//Controller
	always @ (posedge clk_100 or negedge rstn)
	begin
		if(~rstn)
		begin
			cst <= IDLE;
		end
		else
		begin
			cst <= nst;
		end
	end
	
	always @ (*)
	begin
		nst =IDLE;
		push_reg = 1'b0;
		pop_reg = 1'b0;
		fifo_in_reg = 4'd0;
		case(cst)
			IDLE:
			begin
				nst =IDLE;
				if(debounce_push & ~debounced_pop)
				begin
					nst =WRITE_1;
				end
				else if(~debounce_push & debounced_pop)
				begin
					nst = READ_1;
				end
			end
			//Write Ready
			WRITE_1:
			begin
				nst = WRITE_1;
				if(~debounce_push)
				begin
					nst = WRITE_2;
				end
			end
			//Write!
			WRITE_2:
			begin
				nst = WRITE_2;
				if(~debounce_push & ~push)
				begin
					nst = DONE;
					push_reg = 1'b1;
					fifo_in_reg = data_in;
				end
			end
			//Read Ready
			READ_1:
			begin
				nst = READ_1;
				if(~debounced_pop)
				begin
					nst = READ_2;
				end
			end
			//Read!
			READ_2:
			begin
				nst = READ_2;
				if(~debounced_pop & ~pop)
				begin
					nst = DONE;
					pop_reg = 1'b1;
				end
			end
			DONE:
			begin
				nst = IDLE;
			end
		endcase
	end
	
	//FIFO 16X4
	fifo_16_4 u0 (clk_100, rstn, push_reg, pop_reg, fifo_in_reg, fifo_out, empty, full);
	//HEX2SSD
	hex2ssd h0 (data_in, segment1);
	hex2ssd h1 (fifo_out, segment2);


endmodule
