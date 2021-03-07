`timescale 1ns / 1ps

module BCD3(a,b);
input [2:0] a;
output reg [3:0] b;

always @(*)
begin
	case (a) //Use ROM
	3'b000:b=4'b0000; //Left hand should be REG
	3'b001:b=4'b0001;
	3'b011:b=4'b0011;
	3'b010:b=4'b0010;
	3'b110:b=4'b0110;
	3'b111:b=4'b0111;
	3'b101:b=4'b0101;
	3'b100:b=4'b0100;
	default:b=4'b1111;
	endcase
end
	


endmodule
