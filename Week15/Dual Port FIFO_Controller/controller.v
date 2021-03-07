`timescale 1ns / 1ps

module controller(clk, rst, SRead, SWrite, WE, RE, wFull, wEmpty);
	input clk;
	input rst;
	input SRead;
	input SWrite;
	output reg WE;
	output reg RE;
	output  wFull;
	output  wEmpty;
	 
	assign rstn = ~rst;
	 
	localparam  IDLE    = 3'd0,
	   			WRITE_1 = 3'd1,
					WRITE_2 = 3'd2,
					READ_1  = 3'd3,
					READ_2  = 3'd4,
					DONE    = 3'd5;
					
	reg [2:0] nst, cst;
	reg [4:0] cnt;
	
	//Controller
	always @ (posedge clk or negedge rstn)
	begin
		if(~rstn)
		begin
			cst <= IDLE;
			cnt <= 4'd0;
		end
		else
		begin
			//Write - Increase element
			if(WE&&~RE) cnt <= cnt +1'b1;
			//Read - Decrease element
			else if(~WE&&RE) cnt <= cnt -1'b1;
			cst <= nst;
		end
	end
	
	always @ (*)
	begin
		nst =IDLE;
		WE = 1'b0;
		RE = 1'b0;
		case(cst)
			//IDLE
			IDLE:
			begin
				nst =IDLE;
				if(SWrite & ~SRead)
				begin
					nst =WRITE_1;
				end
				else if(~SWrite & SRead)
				begin
					nst = READ_1;
				end
			end
			//Write Ready
			WRITE_1:
			begin
				nst = WRITE_1;
				if(~SWrite)
				begin
					nst = WRITE_2;
				end
			end
			//Write Action
			WRITE_2:
			begin
				nst = WRITE_2;
				if(~SWrite)
				begin
					if(!wFull)
					begin
						nst = DONE;
						WE = 1'b1;
					end
				end
			end
			//Read Ready
			READ_1:
			begin
				nst = READ_1;
				if(~SRead)
				begin
					nst = READ_2;
				end
			end
			//Read Action
			READ_2:
			begin
				nst = READ_2;
				if(~SRead)
				begin
					if(!wEmpty)
					begin
						nst = DONE;
						RE = 1'b1;
					end
				end
			end
			//Done, Back to Home
			DONE:
			begin
				nst = IDLE;
			end
		endcase
	end

//Full, Empty Signal Generated
assign wFull = (cnt == 5'b10000) ? 1'b1 :1'b0;
assign wEmpty = (cnt == 5'b00000) ? 1'b1 :1'b0;


endmodule
