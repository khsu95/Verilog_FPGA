`timescale 1ns / 1ps

module Carry_Logic(p, g, cin, cout);

input [3:0] p;
input [3:0] g;
input cin;
output [3:0] cout;

assign cout[0]= (cin&p[0])|g[0];
assign cout[1]= (cin&p[0]&p[1])|(g[0]&p[1])|g[1];
assign cout[2]= (cin&p[0]&p[1]&p[2])|(g[0]&p[1]&p[2])|(g[1]&p[2])|g[2];
assign cout[3]= (cin&p[0]&p[1]&p[2]&p[3])|(g[0]&p[1]&p[2]&p[3])|(g[1]&p[2]&p[3])|(g[2]&p[3])|g[3];

endmodule
