`timescale 1ns / 1ps

module tb_top;

	// Inputs
	reg clk;
	reg rst;
	reg en;
	reg [3:0] read;
	reg write;
	reg [7:0] datain;

	// Outputs
	wire [7:0] dataout;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.clk(clk), 
		.rst(rst), 
		.en(en), 
		.read(read), 
		.write(write), 
		.datain(datain), 
		.dataout(dataout)
	);
		
	initial 
	begin
		clk=1'b0;
		forever #5 clk=~clk;
	end
	
	
	initial begin
		// Initialize Inputs
		rst = 1;		en = 1;		read = 0;		write = 0;		datain = 0;		#10;

		// Wait 100 ns for global reset to finish
		//Write
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b1000_0000;		#10; //0
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b0100_0000;		#10; //1
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b0010_0000;		#10; //2
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b0001_0000;		#10; //3
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b0000_1000;		#10; //4
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b0000_0100;		#10; //5
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b0000_0010;		#10; //6
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b0000_0001;		#10; //7
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b1100_0000;		#10; //8
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b1010_0000;		#10; //9
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b1001_0000;		#10; //10
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b1000_1000;		#10; //11
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b1000_0100;		#10; //12
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b1000_0010;		#10; //13
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b1000_0001;		#10; //14
		rst = 0;		en = 1;		read = 0;		write = 1;		datain = 8'b1110_0000;		#10; //15
		
		
		//Read
		rst = 0;		en = 1;		read = 11;		write = 0;		datain = 0;		#10; //8'b1000_1000;
		rst = 0;		en = 1;		read = 15;		write = 0;		datain = 0;		#10; //8'b1110_0000
		rst = 0;		en = 1;		read = 3;		write = 0;		datain = 0;		#10; //8'b0001_0000
		rst = 0;		en = 1;		read = 6;		write = 0;		datain = 0;		#10; //8'b0000_0010
		rst = 0;		en = 1;		read = 9;		write = 0;		datain = 0;		#10; //8'b1010_0000
		rst = 0;		en = 1;		read = 11;		write = 0;		datain = 1212;		#10; //8'b1000_1000
		rst = 0;		en = 1;		read = 6;		write = 0;		datain = 1313;		#10; //8'b0000_0010
		rst = 0;		en = 1;		read = 4;		write = 0;		datain = 1414;		#10; //8'b0000_1000
		rst = 0;		en = 1;		read = 8;		write = 0;		datain = 1515;		#10; //8'b1100_0000
		rst = 0;		en = 1;		read = 10;		write = 0;		datain = 1616;		#10; //8'b1001_0000
		$finish;
        
		// Add stimulus here

	end
      
endmodule

