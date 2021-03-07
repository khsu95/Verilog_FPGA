`timescale 1ns / 1ps

module Pattern_Detector(CLK, nwbit, signal);
input CLK;
input nwbit;
output [3:0] signal; //A~D -> 3~0

Pattern_DetectorA da(CLK, nwbit, signal[3]);
Pattern_DetectorB db(CLK, nwbit, signal[2]);
Pattern_DetectorC dc(CLK, nwbit, signal[1]);
Pattern_DetectorD dd(CLK, nwbit, signal[0]);

endmodule
