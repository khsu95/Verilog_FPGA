`timescale 1ns / 1ps

module Module_C_Skip_Adder(a, b, cin, sum, cout);
input [3:0] a;
input [3:0] b;
input cin;
output [3:0] sum;
output cout;

wire cwire0_1, cwire1_2, cwire2_3, cwire3_4;
wire bp;

fa stage0 (a[0], b[0], cin, cwire0_1, sum[0]);
fa stage1 (a[1], b[1], cwire0_1, cwire1_2, sum[1]);
fa stage2 (a[2], b[2], cwire1_2, cwire2_3, sum[2]);
fa stage3 (a[3], b[3], cwire2_3, cwire3_4, sum[3]);

assign bp = (a[0]^b[0])&(a[1]^b[1])&(a[2]^b[2])&(a[3]^b[3]); //P0 & P1 & P2 & P3

assign cout = bp ? cin : cwire3_4; //Bypass. BP=1 -> cout=cin

endmodule
