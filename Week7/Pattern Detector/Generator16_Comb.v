`timescale 1ns / 1ps

module Generator16_Comb(in, out);
input [15:0] in; //16, 14, 13, 11 Bits Respectively
output out;

assign out = in[10]^(in[12]^(in[13]^in[15])); //New Bit Generate

endmodule
