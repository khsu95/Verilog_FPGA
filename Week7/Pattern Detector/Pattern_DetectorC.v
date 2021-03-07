`timescale 1ns / 1ps

module Pattern_DetectorC(CLK, nwbit, signalC);
input CLK;
input nwbit;
output reg signalC;

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
				signalC = nwbit ? 1'b0 : 1'b0;
	end
	//S1
	3'b001 : 
	begin
				wnxt = nwbit ? 3'b000 : 3'b011; //S0 OR S2
				signalC = nwbit ? 1'b0 : 1'b0;
	end
	//S2
	3'b011 : 
	begin
				wnxt = nwbit ? 3'b010 : 3'b011; //S3 OR S2
				signalC = nwbit ? 1'b0 : 1'b0;
	end
	//S3
	3'b010 : 
	begin
				wnxt = nwbit ? 3'b110 : 3'b001; //S4 OR S1
				signalC = nwbit ? 1'b1 : 1'b0;
	end
	//S4
	3'b110 : 
	begin
				wnxt = nwbit ? 3'b000 : 3'b001; //S0 OR S1
				signalC = nwbit ? 1'b0 : 1'b0;
	end
	default : 
	begin
				wnxt = 3'b000;
				signalC = 1'b0;
	end
	endcase
end
endmodule
