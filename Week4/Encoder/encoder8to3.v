`timescale 1ns / 1ps

module encoder8to3(
	input [6:0] in, //7bit Thermometer code
	input en,
	output reg [2:0] out //3bit Gray Code
    );
	 
	 always @(*) //When related value is changed
	 begin
		if(!en)
			out = 3'b000; //Disable Signal
		else
			case(in) //Encoder Table
				7'b0000000	:	out = 3'b000;
				7'b0000001	:	out = 3'b001;
				7'b0000011	:	out = 3'b011;
				7'b0000111	:	out = 3'b010;
				7'b0001111	:	out = 3'b110;
				7'b0011111	:	out = 3'b111;
				7'b0111111	:	out = 3'b101;
				7'b1111111	:	out = 3'b100;
			endcase
		end
endmodule
