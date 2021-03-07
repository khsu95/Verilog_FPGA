`timescale 1ns / 1ps

module bcd_conv(bin,dec);
input [7:0] bin;
output [11:0] dec;

integer i;
reg [7:0] data;
reg shin;

wire u2t, t2h;

bcd_conv_basis units(shin, dec[11:8], u2t);
bcd_conv_basis teens(u2t, dec[7:4], t2h);
bcd_conv_basis hunds(t2h, dec[3:0],);


always @ (*)
begin
	data=bin;
	$display(data);
	for(i=0;i<7;i=i+1)
	begin
	shin=bin[7];
	data=data<<1;
	#10;
	end
end

endmodule
