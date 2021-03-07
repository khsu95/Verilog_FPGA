`timescale 1ns / 1ps

module segment7(
	input [7:0] bcd,
	output reg[6:0] unit_display, //1s Display
	output reg[6:0] ten_display //10s Display
    );
	 
	 always @ (bcd)
	 begin
		case(bcd[7:4]) //1s Display
			4'd0: unit_display = 7'b011_1111;
			4'd1: unit_display = 7'b000_0110;
			4'd2: unit_display = 7'b101_1011;
			4'd3: unit_display = 7'b100_1111;
			4'd4: unit_display = 7'b110_0110;
			4'd5: unit_display = 7'b110_1101;
			4'd6: unit_display = 7'b111_1101;
			4'd7: unit_display = 7'b000_0111;
			4'd8: unit_display = 7'b111_1111;
			4'd9: unit_display = 7'b110_1111;
			
			default : unit_display = 7'b000_0000;
		endcase
		case(bcd[3:0]) //10s Display
			4'd0: ten_display = 7'b011_1111;
			4'd1: ten_display = 7'b000_0110;
			4'd2: ten_display = 7'b101_1011;
			4'd3: ten_display = 7'b100_1111;
			4'd4: ten_display = 7'b110_0110;
			4'd5: ten_display = 7'b110_1101;
			4'd6: ten_display = 7'b111_1101;
			4'd7: ten_display = 7'b000_0111;
			4'd8: ten_display = 7'b111_1111;
			4'd9: ten_display = 7'b110_1111;
			
			default : ten_display = 7'b000_0000;
		endcase
	end
			


endmodule
