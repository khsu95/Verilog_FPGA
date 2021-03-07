`timescale 1ns / 1ps

module HW7_2(CLK, RST, B100, B500, BCf, BRt, SCf, Coin);
input CLK;
input RST;
input B100;       //Insert Coin 100;
input B500;       //Insert Coin 500;
input BCf;        //Coffee Out
input BRt;        //Botton for Returning Coin
output SCf;       //Signal meaning Coffee Out
output [3:0] Coin; //The Number of Coins to be Returned

parameter [3:0] Initial = 4'b0000,
					 S1 		= 4'b0001, //100
					 S2 		= 4'b0010, //200
					 S3 		= 4'b0011, //300
					 S4 		= 4'b0100, //400
					 S5 		= 4'b0101, //500
					 S6 		= 4'b0110, //600
					 S7 		= 4'b0111, //700
					 S8		= 4'b1000, //800
					 CF 		= 4'b1110, //Out Coffee
					 Return	= 4'b1111; //Return Coin

wire wB100, wB500, wBCf, wBRt;

//Debouncing and Single Pulse Logic
Debounc_SP b100(CLK, B100, RST, wB100);
Debounc_SP b500(CLK, B500, RST, wB500);
Debounc_SP bcf(CLK, BCf, RST, wBCf);
Debounc_SP brt(CLK, BRt, RST, wBRt);



reg [3:0] State, next; //4bit for 16 State
reg [3:0] coin;        //The number of Coins to be Returned

//Sequential Logic for State Change
//Async Reset
always @ (posedge CLK)
begin
	if(!RST)
		State <= 4'b0000;
	else
		State <= next;
end

//Combintional Logic for State Calculation
always @ (State or wB100 or wB500 or wBCf or wBRt)
begin
	next = 4'bx;
//	coin = 4'b0;
	case (State)
		Initial:
		begin
					coin = 0;
					if(wB100)
						next = S1;
					else if(wB500)
						next = S5;
					else
						next = Initial; //Error
		end
		
		S1:
		begin
					if(wB100)
						next = S2;
					else if(wB500)
						next = S6;
					else if(wBRt)
					begin
						coin = 1;
						next = Return;
					end
					//No Change Occured
					else
						next = S1;
		end
		
		S2:
		begin
					if(wB100)
						next = S3;
					else if(wB500)
						next = S7;
					else if (wBRt)
					begin
						coin = 2;
						next = Return;
					end
					//No Change Occured
					else
						next = S2;
		end
		
		S3:
		begin
					if(wB100)
						next = S4;
					else if(wB500)
						next = S8;
					else if (wBRt)
					begin
						coin = 3;
						next = Return;
					end
					//No Change Occured
					else
						next = S3;					
		end
		
		S4:
		begin
					if(wB100)
						next = S5;
					else if(wB500)
					begin
						coin =9;
						next = Return;
					end
					
					else if(wBRt)
					begin
						coin = 4;
						next = Return;
					end
					//No Change Occured
					else
						next = S4;					
		end
		
		S5:
		begin
					if(wB100)
						next = S6;
					else if(wB500)
					begin
						coin = 10;
						next = Return;
					end
					else if(wBRt)
					begin
						coin = 5;
						next = Return;
					end
					//No Change Occured
					else
						next = S5;					
		end
		
		S6:
		begin
					if(wB100)
						next = S7;
					else if(wB500)
					begin
						coin = 11;
						next = Return;
					end
					
					else if(wBRt)
					begin
						coin = 6;
						next = Return;
					end
					//No Change Occured
					else
						next = S6;					
		end
		
		S7:
		begin
					if(wB100)
						next = S8;
					else if(wB500)
					begin
						coin = 12;
						next = Return;
					end
					
					else if(wBRt)
					begin
						coin = 7;
						next = Return;
					end
					//No Change Occured
					else
						next = S7;					
		end
		
		S8:
		begin
					if(wB100)
					begin
						coin = 9;
						next = Return;
					end
					else if(wB500)
					begin
						coin = 13;
						next = Return;
					end
					
					else if(wBCf)
						next = CF;
					//No Change Occured
					else
						next = S8;						
		end
		
		//Coffee Signal to be Outted
		CF:
		begin
					next = Initial;
		end
		
		//The number of Coins to be Outted
		Return:
		begin
					next = Initial;
		end
		
		default:
		begin
					next = Initial;
		end
	endcase
end//End of Comb Logic

//Output Logic
assign SCf = (State == CF) ? 1'b1 : 1'b0; //Coffee Signal
assign Coin = (State == Return) ? coin : 4'b0;

endmodule
