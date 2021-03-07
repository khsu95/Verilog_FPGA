`timescale 1ns / 1ps

module top(clk, ini, msb, seq);
input clk;
input ini;
output reg msb;
output reg [3:0] seq;

reg lsb;

always @ (posedge clk)
begin
    if(ini)//initializing
	 begin
        seq <= #1 4'b1111; //seed
		  msb <= 0;
		  lsb <=1^1; //first xor -> 3rd,4th xor
	 end
    else
    begin
	     msb <= seq[0]; //Output
		  if({lsb,seq[3:1]})
				seq <= #1 {lsb, seq[3:1]}; //Re-Pack, Sequence printed
		  else
				seq <= #1 {1, seq[3:1]}; //Re-Pack, Sequence printed
		  lsb <= seq[0] ^ seq[1]; //Feed back
    end
end

endmodule
