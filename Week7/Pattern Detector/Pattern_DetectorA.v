`timescale 1ns / 1ps

module Pattern_DetectorA(CLK, nwbit, signalA);
input CLK;
input nwbit;
output reg signalA;

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
				wnxt = nwbit ? 3'b001 : 3'b000; //S1 OR S0
				signalA = nwbit ? 1'b0 : 1'b0;
	end
	//S1
	3'b001 : 
	begin
				wnxt = nwbit ? 3'b001 : 3'b011; //S1 OR S2
				signalA = nwbit ? 1'b0 : 1'b0;
	end
	//S2
	3'b011 : 
	begin
				wnxt = nwbit ? 3'b010 : 3'b000; //S3 OR S0
				signalA = nwbit ? 1'b0 : 1'b0;
	end
	//S3
	3'b010 : 
	begin
				wnxt = nwbit ? 3'b001 : 3'b110; //S1 OR S4
				signalA = nwbit ? 1'b0 : 1'b1;
	end
	//S4
	3'b110 : 
	begin
				wnxt = nwbit ? 3'b010 : 3'b000; //S3 OR S0
				signalA = nwbit ? 1'b0 : 1'b0;
	end
	default : 
	begin
				wnxt = 3'b000;
				signalA = 1'b0;
	end
	endcase
end
endmodule
