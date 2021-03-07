`timescale 1ns / 1ps

module HW7_1(CLK, IN, OUT, LIGHT);
input CLK;
input IN;
input OUT;
output [1:0] LIGHT;

parameter [1:0] YFULL = 2'b01,
					 NFULL = 2'b10; //Ont -Hot
					 
parameter [2:0] Initial  = 3'b000,
					 Entering = 3'b001,
					 Out      = 3'b010,
					 Isfull   = 3'b011,
					 Fulled   = 3'b100,
					 Paying_I = 3'b101,
					 Paying_O = 3'b110;

reg [2:0] state, next; //3bit 7state

reg [1:0] goCount;
reg [6:0] count; //7bit to count 127

//Sequential Block
always @ (posedge CLK)
	state <= next;
	
//Counter
always @ (posedge CLK)
begin
	if(goCount == 2'b01) count <= count - 1;//Minus
	else if(goCount == 2'b10) count <= count + 1;//Plus
	else if(goCount == 2'b11) count <= 0;//Initial
end

always @ (state or IN or OUT)
begin
	next = 3'bx;
	goCount = 2'b00;
	case (state)
		Initial:
		begin
					if(OUT) next = Out; //Out First
					else if(IN)  next = Entering;
					else next = Initial;
		end
		
		Entering:
		begin
					next = Isfull;
		end
		
		Out:
		begin
					if(!count) //Check Empty
					begin
						goCount = 2'b01;//Minus
						next = Paying_O;
					end
					else
						next = Initial; //Error
		end
		
		//Check Full
		Isfull:
		begin
					if(count == 126)
					begin
						next = Fulled; //In Signal will be Blocked
					end
					else
					begin
						next = Paying_I;
						goCount = 2'b10; //Plus
					end
		end
		
		//Blocking In Signal, Escape when Out
		Fulled:
		begin
					if(OUT)
					begin
						next = Paying_O;
						goCount = 2'b01;
					end
					else
						next = Fulled;
		end
		
		//Blocking In Signal
		Paying_I:
		begin
					if(!IN)	next = Initial;
					else 	   next = Paying_I;
		end
		
		//Blocking Out Signal
		Paying_O:
		begin
					if(!OUT)	next = Initial;
					else     next = Paying_O;
		end
		default : 
		begin
			next = Initial;
			goCount = 2'b11;
		end
	endcase
end //End of Combinational Logic

//Output Logic
assign LIGHT = (state==Fulled) ? YFULL : NFULL; //Full Signal
endmodule
