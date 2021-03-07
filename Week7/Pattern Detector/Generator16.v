`timescale 1ns / 1ps

module Generator16(RST, CLK, Seq, fortest);
input RST;
input CLK;
output Seq;
output [15:0] fortest;

wire wseq_nwbit;
wire [15:0] wseq_seq16;

Generator16_Seq seq (RST, CLK, wseq_nwbit, wseq_seq16); //Generator16_Seq(RST, CLK, Nwbit, seq16);
Generator16_Comb Comb (wseq_seq16, wseq_nwbit); //Generator16_Comb(in, out);

assign Seq = wseq_seq16[15];
assign fortest = wseq_seq16;

endmodule
