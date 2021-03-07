`timescale 1ns / 1ps

module data(address, rw, datain, dataout);
	input [15:0] address; //16bit one-hot coded Address
	input rw;
	input [7:0] datain; //8bit data
	output reg [7:0] dataout; //8bit data
	
	reg [7:0] mem [15:0]; //RAM
	
	always @ (address or rw) //address and rw Trigger Block
	begin
		//High -> Write
		if(rw) 
		begin
			case (address)
				16'b0000_0000_0000_0001 : mem[0]=datain;
				16'b0000_0000_0000_0010 : mem[1]=datain;
				16'b0000_0000_0000_0100 : mem[2]=datain;
				16'b0000_0000_0000_1000 : mem[3]=datain;
				16'b0000_0000_0001_0000 : mem[4]=datain;
				16'b0000_0000_0010_0000 : mem[5]=datain;
				16'b0000_0000_0100_0000 : mem[6]=datain;
				16'b0000_0000_1000_0000 : mem[7]=datain;
				16'b0000_0001_0000_0000 : mem[8]=datain;
				16'b0000_0010_0000_0000 : mem[9]=datain;
				16'b0000_0100_0000_0000 : mem[10]=datain;
				16'b0000_1000_0000_0000 : mem[11]=datain;
				16'b0001_0000_0000_0000 : mem[12]=datain;
				16'b0010_0000_0000_0000 : mem[13]=datain;
				16'b0100_0000_0000_0000 : mem[14]=datain;
				16'b1000_0000_0000_0000 : mem[15]=datain;
				//default : 
			endcase
		end
		
		//Read
		else
		begin
			case (address)
				16'b0000_0000_0000_0001 : dataout=mem[0];
				16'b0000_0000_0000_0010 : dataout=mem[1];
				16'b0000_0000_0000_0100 : dataout=mem[2];
				16'b0000_0000_0000_1000 : dataout=mem[3];
				16'b0000_0000_0001_0000 : dataout=mem[4];
				16'b0000_0000_0010_0000 : dataout=mem[5];
				16'b0000_0000_0100_0000 : dataout=mem[6];
				16'b0000_0000_1000_0000 : dataout=mem[7];
				16'b0000_0001_0000_0000 : dataout=mem[8];
				16'b0000_0010_0000_0000 : dataout=mem[9];
				16'b0000_0100_0000_0000 : dataout=mem[10];
				16'b0000_1000_0000_0000 : dataout=mem[11];
				16'b0001_0000_0000_0000 : dataout=mem[12];
				16'b0010_0000_0000_0000 : dataout=mem[13];
				16'b0100_0000_0000_0000 : dataout=mem[14];
				16'b1000_0000_0000_0000 : dataout=mem[15];
				//default : 
			endcase
		end
	end
endmodule
