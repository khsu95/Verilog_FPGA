`timescale 1ns / 1ps

module C_Skip_Adder_32(a, b, cin, sum, cout);
input [31:0] a;
input [31:0] b;
input cin;
output [31:0] sum;
output cout;

wire cwire0_4,cwire4_8,cwire8_12,cwire12_16,cwire16_20,cwire20_24,cwire24_28;

Module_C_Skip_Adder stage0 (a[3:0], b[3:0], cin, sum[3:0], cwire0_4);
Module_C_Skip_Adder stage1 (a[7:4], b[7:4], cwire0_4, sum[7:4], cwire4_8);
Module_C_Skip_Adder stage2 (a[11:8], b[11:8], cwire4_8, sum[11:8], cwire8_12);
Module_C_Skip_Adder stage3 (a[15:12], b[15:12], cwire8_12, sum[15:12], cwire12_16);
Module_C_Skip_Adder stage4 (a[19:16], b[19:16], cwire12_16, sum[19:16], cwire16_20);
Module_C_Skip_Adder stage5 (a[23:20], b[23:20], cwire16_20, sum[23:20], cwire20_24);
Module_C_Skip_Adder stage6 (a[27:24], b[27:24], cwire20_24, sum[27:24], cwire24_28);
Module_C_Skip_Adder stage7 (a[31:28], b[31:28], cwire24_28, sum[31:28], cout);

endmodule
