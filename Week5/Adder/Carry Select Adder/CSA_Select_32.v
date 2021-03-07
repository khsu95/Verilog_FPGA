`timescale 1ns / 1ps

module CSA_Select_32(a, b, cin, sum, cout);
input [31:0] a;
input [31:0] b;
input cin;
output [31:0] sum;
output cout;

wire cwire8_12, cwire12_16, cwire16_20, cwire20_24, cwire24_28, cwire28_32;

Base_Unit_8bit_CSA input_stage(a[7:0], b[7:0], cin, sum[7:0], cwire8_12);//[7:0] Added

CSA_module stage3 (a[11:8], b[11:8], cwire8_12, sum[11:8], cwire12_16);//[11:8] Added
CSA_module stage4 (a[15:12], b[15:12], cwire12_16, sum[15:12], cwire16_20);//[15:12] Added
CSA_module stage5 (a[19:16], b[19:16], cwire16_20, sum[19:16], cwire20_24);//[19:16] Added
CSA_module stage6 (a[23:20], b[23:20], cwire20_24, sum[23:20], cwire24_28);//[23:20] Added
CSA_module stage7 (a[27:24], b[27:24], cwire24_28, sum[27:24], cwire28_32);//[27:24] Added
CSA_module stage8 (a[31:28], b[31:28], cwire28_32, sum[31:28], cout);//[32:28] Added

endmodule
