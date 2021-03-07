`timescale 1ns / 1ps



module tb_HW7_1;

	// Inputs
	reg CLK;
	reg IN;
	reg OUT;

	// Outputs
	wire [1:0] LIGHT;

	// Instantiate the Unit Under Test (UUT)
	HW7_1 uut (
		.CLK(CLK), 
		.IN(IN), 
		.OUT(OUT), 
		.LIGHT(LIGHT)
	);
	
integer i;

always #5 CLK = ~CLK;
	initial begin
		// Initialize Inputs
		CLK = 0;	IN = 0;	OUT = 0;

		// Wait 100 ns for global reset to finish
		i=0;
		
		//127CAR ENTERS IN PARK 
		while(i<254)
		begin
			if(i%2)
			begin
				#40;
				IN =1; OUT =0;
				$display("%d car", i/2);
			end
			else
			begin
				#40;
				IN =0; OUT =0;
			end
			i = i+1;
		end
		
		//FULL
		#50;		IN=1;
		#30;		IN=0;
					$display("%d car", i/2);
					i=i+2;
		#20;		IN=1;
		#40;		IN=0;
					$display("%d car", i/2);
					i=i+2;
		#30;		IN=1;
		#70;		IN=0;
					$display("%d car", i/2);
					i=i+2;
		#50;		IN=1;
		//OUT OF PARK
		#10;		IN=0;			OUT=1;
		#40;		    			OUT=0;
		$display("%d car", i/2);
		i=i-2;
		#70;		    			OUT=1;
		#30;		   			OUT=0;
		$display("%d car", i/2);
		i=i-2;
		#90;		   			OUT=1;
		#40;		   			OUT=0;
		$display("%d car", i/2);
		i=i-2;
		//10 CAR ENTER IN PARK
		//AGAIN FULL
		while(i<264)
		begin
			if(i%2)
			begin
				$display("%d car", i/2);
				#40;
				IN =1; OUT =0;
			end
			else
			begin
				#40;
				IN =0; OUT =0;
			end
			i = i+1;
		end
		$finish;
        
		// Add stimulus here

	end
      
endmodule

