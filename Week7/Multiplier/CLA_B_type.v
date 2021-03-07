`timescale 1ns / 1ps

module CLA_B_type(g0, p0, c0, g1, p1, c1, g01, p01, c01);
input g0;
input p0;
output reg c0;
input g1;
input p1;
output reg c1;
output reg g01;
output reg p01;
input c01;


always @ (p0 or p1)
begin
	p01 = p0 & p1;
end

always @ (g0 or g1 or p1)
begin
	g01 = g1 | (p1 & g0);
end

always @ (g0 or p0 or c01)
begin
	c0 = g0 | (p0 & c01);
	c1 = c01;
end

endmodule
