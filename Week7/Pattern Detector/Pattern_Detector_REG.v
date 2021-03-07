`timescale 1ns / 1ps

module Pattern_Detector_REG(CLK, indata, outdata);
input CLK;
input [2:0] indata; //3bits for s0~s5
output reg [2:0] outdata; //3bits for s0~s5

always @ (posedge CLK)
begin
	outdata <= indata; //State
end

endmodule
