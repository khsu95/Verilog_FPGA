`timescale 1ns / 1ps

module CLA_A_type(a, b, c, g, p, s);
input a;
input b;
input c;
output reg g;
output reg p;
output reg s;

always @(a or b)
begin
	g = a&b;
	p = a|b;
end

always @ (c)
begin
	s=a^b^c;
end

endmodule
