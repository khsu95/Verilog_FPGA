`timescale 1ns / 1ps

module encoder8to3(input [7:0] in, //7bit Thermometer code
						 output reg [2:0] out //3bit Gray Code
    );
	 
	 always @(*) //When related value is changed
	 begin
			casex(in) //Encoder Table //casex statement treats high-impedance and unknown (x) values as don't care values
			//Gray Coding
				8'b0000_0001	:	out = 3'b000;
				8'b0000_001X	:	out = 3'b001;
				8'b0000_01XX	:	out = 3'b011;
				8'b0000_1XXX	:	out = 3'b010;
				8'b0001_XXXX	:	out = 3'b110;
				8'b001X_XXXX	:	out = 3'b111;
				8'b01XX_XXXX	:	out = 3'b101;
				8'b1XXX_XXXX	:	out = 3'b100;
				default        :  out = 3'b000;
			endcase
		end
endmodule
