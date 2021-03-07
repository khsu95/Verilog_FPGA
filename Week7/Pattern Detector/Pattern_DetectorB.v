`timescale 1ns / 1ps

module Pattern_DetectorB(CLK, nwbit, signalB);
input CLK;
input nwbit;
output reg signalB;

wire [2:0] wwnow;
reg [2:0] wnxt;

Pattern_Detector_REG re(CLK, wnxt, wwnow);

//Combinational Logic
always @ (*)
begin
	case (wwnow)
	//S0
	3'b000 : 
	begin
				wnxt = nwbit ? 3'b000 : 3'b001; //S0 OR S1
				signalB = nwbit ? 1'b0 : 1'b0;
	end
	//S1
	3'b001 : 
	begin
				wnxt = nwbit ? 3'b011 : 3'b001; //S2 OR S1
				signalB = nwbit ? 1'b0 : 1'b0;
	end
	//S2
	3'b011 : 
	begin
				wnxt = nwbit ? 3'b010 : 3'b001; //S3 OR S1
				signalB = nwbit ? 1'b0 : 1'b0;
	end
	//S3
	3'b010 : 
	begin
				wnxt = nwbit ? 3'b110 : 3'b001; //S4 OR S1
				signalB = nwbit ? 1'b1 : 1'b0;
	end
	//S4
	3'b110 : 
	begin
				wnxt = nwbit ? 3'b000 : 3'b001; //S0 OR S1
				signalB = nwbit ? 1'b0 : 1'b0;
	end
	default : 
	begin
				wnxt = 3'b000;
				signalB = 1'b0;
	end
	endcase
end
endmodule
