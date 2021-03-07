`timescale 1ns / 1ps

module Pattern_DetectorA(clk, nwbit, decA);
	input clk;
	input nwbit;
	output decA;
	
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
				if(nwbit) next = S1; 
				else next = Init;
			end
			
			//Detect 1
			S1:
			begin
				if(nwbit) next = S1;
				else next = S2;
			end
			
			//Detect 10
			S2:
			begin
				if(nwbit) next = S3;
				else next = Init;
			end
			
			//Detect 101
			S3:
			begin
				if(nwbit) next = S1;
				else next = S2;
			end
			
			default: next = Init;
		endcase
	end //End of Combinational Logic
	
	//Output Logic
	assign decA = (state==S3) ? 1'b1 : 1'b0;
endmodule
