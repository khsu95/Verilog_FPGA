`timescale 1ns / 1ps

module Generator16_Seq(RST, CLK, Nwbit, seq16);
input RST;
input CLK;
input Nwbit; //From Combinational Logic
output reg [15:0] seq16; //To Pattern Detector, and To Combinational Logic

initial seq16 <= 16'b0001_0010_0011_0100;

always @ (negedge RST or posedge CLK)
begin

	if(!RST)
	begin
		seq16 <= 16'b0001_0010_0011_0100;
	end

	else
	begin
		seq16[15] <= seq16[14];
		seq16[14] <= seq16[13];
		seq16[13] <= seq16[12];
		seq16[12] <= seq16[11];
		seq16[11] <= seq16[10];
		seq16[10] <= seq16[9];
		seq16[9] <= seq16[8];
		seq16[8] <= seq16[7];
		seq16[7] <= seq16[6];
		seq16[6] <= seq16[5];
		seq16[5] <= seq16[4];
		seq16[4] <= seq16[3];
		seq16[3] <= seq16[2];
		seq16[2] <= seq16[1];
		seq16[1] <= seq16[0];
		seq16[0] <= Nwbit;
	end
end
endmodule
