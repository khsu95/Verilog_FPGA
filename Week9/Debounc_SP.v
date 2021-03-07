`timescale 1ns / 1ps

module Debounc_SP(CLK, IN, RST, OUT);
input CLK;
input IN;
input RST;
output OUT;

reg Fstage, Sstage, SP;

//First Need Reset LOW
//3 Clock Needed 
always @ (posedge CLK)
begin
	if(!RST)//Async Reset
	begin
		Fstage <= 1'b0;
		Sstage <= 1'b0;
		SP <= 1'b0;
	end
	
	//Debouncing by Delaying
	else
	begin
		SP <= Sstage;
		Sstage <= Fstage;
		Fstage <= IN;
	end
end

//Output Logic
//Generate Single Pulse
//When 2 F/F State is Differ (Being 2 F/F State same is mean Button still Pressed)
assign OUT = ((!SP)&&Sstage) ? 1'b1 : 1'b0; //Single Pulse 

endmodule
