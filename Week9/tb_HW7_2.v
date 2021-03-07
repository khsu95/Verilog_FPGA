`timescale 1ns / 1ps

module tb_HW7_2;

	// Inputs
	reg CLK;
	reg RST;
	reg B100;
	reg B500;
	reg BCf;
	reg BRt;

	// Outputs
	wire SCf;
	wire [3:0] Coin;

	// Instantiate the Unit Under Test (UUT)
	HW7_2 uut (
		.CLK(CLK), 
		.RST(RST), 
		.B100(B100), 
		.B500(B500), 
		.BCf(BCf), 
		.BRt(BRt), 
		.SCf(SCf), 
		.Coin(Coin)
	);

always #5 CLK = ~CLK;

	initial begin
		// Initialize Inputs
		CLK = 0;
		RST = 0; //Reset
		B100 = 0;
		B500 = 0;
		BCf = 0;
		BRt = 0;

		//Reset
		RST = 1;
		
		//Case 0 : only 100 and Pop Coffee
		//0~500ns
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; BCf = 1;	#20; BCf = 0; //Pop Coffee
		#50;
		
		//Case 1 : first a 500 coin and 3 100 coins
		//500~1000ns
		#30; B500 = 1;	#20; B500 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; BCf = 1;	#20; BCf = 0; //Pop Coffee
		#250;
		
		//Case 2 : first 2 100 coins, second a 500 coin and finally a 100 coin
		//1000~1500ns
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B500 = 1;	#20; B500 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; BCf = 1;	#20; BCf = 0; //Pop Coffee
		#250;
		
		//Case 3 : Over Coin (9 100 coins)
		//Check the number of return coins
		//Check 900
		//1500~2000ns
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#50;
		
		//Case 4 : Over Coin (7 100 coins and a 500 coin)
		//Check the number of return coins
		//Check 1200
		//2000~2500ns
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;		
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B500 = 1;	#20; B500 = 0;
		#100;
		
		//Case 5 : Return Coin
		//Check the number of return coins
		//Check 200
		//2500~3000ns
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; BRt = 1;	#20; BRt = 0;
		#350;
		
		//Check 600
		//3000~3500ns
		#30; B100 = 1;	#20; B100 = 0;
		#30; B500 = 1;	#20; B500 = 0;
		#30; BRt = 1;	#20; BRt = 0;
		#350;
		
		//Check 700
		//3500~4000ns
		#30; B500 = 1;	#20; B500 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; B100 = 1;	#20; B100 = 0;
		#30; BRt = 1;	#20; BRt = 0;
		#300;

		$finish;
		// Add stimulus here

	end
      
endmodule

