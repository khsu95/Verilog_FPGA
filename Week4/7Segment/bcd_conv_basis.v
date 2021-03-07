`timescale 1ns / 1ps


module bcd_conv_basis(shin,data,shout);
input shin;
output reg[3:0] data;
output reg shout;
	 
reg [3:0] buffer;

initial
begin
buffer=4'b0000;
end

always @ (*)
begin
	buffer=buffer<<1;
	buffer[0]=shin;

	if(buffer==4'b0101)
		buffer=buffer+4'b0011;
	shout=buffer[3];
	data=buffer;
end

endmodule
