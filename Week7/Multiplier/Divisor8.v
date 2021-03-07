`timescale 1ns / 1ps

module Divisor8(clk, a, b, st, out);
input clk;
input [7:0] a;
input [7:0] b;
input st;
output reg [7:0] out;


reg [2:0] State;
reg [8:0] Dividend;
reg [4:0] Diviser;

always @ (posedge clk)
begin
	case(State)
		0: 
		begin
			if(st)
			begin
				Dividend <= {a, 0};
				Diviser <= {0, b};
				State <= State + 1;
			end
		end
		1:
		begin
			if(Dividend[8:5] > b) //Not Overflow
			begin
				Dividend <= {Dividend[7:0], 0};
				State <= State +1;
			end
			else
				State <= 0;
		end
		2:
		begin
			if(Dividend[8:4] < Diviser)
			begin
				Dividend <= {Dividend[7:0], 0};
				State <= State +1;
			end
			else
			begin
				Dividend[8:4] <= Dividend[8:4] + (~Diviser) +1; //2's Complement
				Dividend[0] <= 1;
			end
		end
		3:
		begin
			if(Dividend[8:4] < Diviser)
			begin
				Dividend <= {Dividend[7:0], 0};
				State <= State +1;
			end
			else
			begin
				Dividend[8:4] <= Dividend[8:4] + (~Diviser) +1; //2's Complement
				Dividend[0] <= 1;
			end
		end
		
		4:
		begin
			if(Dividend[8:4] < Diviser)
			begin
				Dividend <= {Dividend[7:0], 0};
				State <= State +1;
			end
			else
			begin
				Dividend[8:4] <= Dividend[8:4] + (~Diviser) +1; //2's Complement
				Dividend[0] <= 1;
			end
		end
		
		5:
		begin
			if(Dividend[8:4] < Diviser)
			begin
				out <= {4'b0000, Dividend[3:1], 0};
				State <= 0;
			end
			else
			begin
				out <= {4'b0000, Dividend[3:1], 1}; //2's Complement
				State <= 0;
			end
		end
	endcase
end
				



endmodule
