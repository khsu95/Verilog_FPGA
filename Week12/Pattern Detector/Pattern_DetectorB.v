`timescale 1ns / 1ps

module Pattern_DetectorB(clk, nwbit, decB);
	input clk;
	input nwbit;
	output decB;
	
	parameter [1:0] Init = 2'b00,
						   S1 = 2'b01,
							S2 = 2'b11,
							S3 = 2'b10;
	
	reg [1:0] next, state; //next state
	
	//Sequential Block
	always @ (posedge clk)
		state <= next;
		
	//Combinational Block
	always @ (state or nwbit)
	begin
		next = 2'bx;
		case (state)
			//Initial State
			Init:
			begin
				if(nwbit) next = Init; 
				else next = S1;
			end
			
			//Detect 0
			S1:
			begin
				if(nwbit) next = S2;
				else next = S1;
			end
			
			//Detect 01
			S2:
			begin
				if(nwbit) next = Init;
				else next = S3;
			end
			
			//Detect 010
			S3:
			begin
				if(nwbit) next = S2;
				else next = S1;
			end
			
			default: next = Init;
		endcase
	end //End of Combinational Logic
	
	//Output Logic
	assign decB = (state==S3) ? 1'b1 : 1'b0;
endmodule