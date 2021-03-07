`timescale 1ns / 1ps

module tb_FAS_32bit;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg bcin;

	// Outputs
	wire [31:0] sum;
	wire [31:0] diff;
	wire cout;
	wire bout;

	// Instantiate the Unit Under Test (UUT)
	FAS_32bit uut (
		.a(a), 
		.b(b), 
		.bcin(bcin), 
		.sum(sum), 
		.diff(diff), 
		.cout(cout), 
		.bout(bout)
	);

	initial begin
		// Initialize Inputs
		a = 0; b = 0; bcin = 0;

		// Wait 100 ns for global reset to finish
		//Hexa used istead of binary
		//32 is omiited
		#50; a= 'H25ca25ca; b='Hac25ac25; bcin=0;//Underflow
		#50; a= 'H2525fafa; b='Hfc25fc25; bcin=0;//Underflow,Overflow
		#50; a= 'H29ca29ca; b='Ha6c5a6c5; bcin=0;//Underflow
		#50; a= 'H21aa21aa; b='Hd355d355; bcin=0;//Underflow
		#50; a= 'H2225a25a; b='Haa9c59c5; bcin=0;//Underflow
		#50; a= 'H2f2a2f2a; b='H1c21c2aa; bcin=0;//
		#50; a= 'Hffffaffa; b='H51513a3a; bcin=0;//Overflow
		#50; a= 'Hff2aa2aa; b='H98198122; bcin=0;//Overflow
		#50; a= 'Hd5cad5ca; b='Hbebeeeee; bcin=0;//Overflow
		#50; a= 'Ha5a5dada; b='H1192c92c; bcin=0;//
		#50; a= 'H001001aa; b='H00190019; bcin=0;//Underflow
		#50; a= 'Haaaaaaaa; b='H99999999; bcin=0;//Overflow
        
		// Add stimulus here

	end
      
endmodule

