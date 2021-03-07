`timescale 1ns / 1ps

module Address(clk, rst, WE, RE, addrA, addrB);
input clk;
input rst;
input WE;
input RE;
output reg [3:0] addrA;
output reg [3:0] addrB;

//Rear -> Pointer for Write
reg [3:0] Rear;
//Front -> Pointer for Read
reg [3:0] Front;

always @ (posedge clk)
begin
	if(rst == 1'b1)
	begin
		Rear <= 4'b0;
		Front <= 4'b0;
		addrA <= 4'b0;
		addrB <= 4'b0;
	end
	
	else
	begin
		//Address Out
		addrA <= Rear;
		addrB <= Front;
		//In case Write. Increase Rear
		if(WE&~RE)
		begin
			Rear <= Rear + 1'd1;
		end
		//In case Read. Increase Front
		else if(~WE&RE)
		begin
			Front <= Front + 1'd1;
		end
		else
		begin
			Rear <= Rear;
			Front <= Front;
		end
	end
end
			

endmodule
