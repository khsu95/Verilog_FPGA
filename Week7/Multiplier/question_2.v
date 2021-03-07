`timescale 1ns / 1ps

module MT2(CLK, St, Mplier, Mcand, Product, Done);
input CLK;
input St;
input [15:0] Mplier;
input [15:0] Mcand;
output reg [31:0] Product;
output Done;

reg [2:0] State;
reg [15:0] A;
reg [15:0] ABS_M;
reg [15:0] B;
reg [15:0] addout;
reg [1:0] sign;

reg [3:0] Count;
reg K;

	initial
	begin
		 State=0;
		 A = 0;
		 ABS_M = 0;
		 B = 0;
		 addout = 0;
		 sign=0;
		 K=0;
	end

	always @ (posedge CLK)
	begin
		 case(State)
		 0:
                begin 
                
                    if(St == 1'b1)
                    begin
                            //Mplier is Minus
                            if(Mplier[15]) 
                            begin
                                B <= (~Mplier)+1'b1; //2's Complement
                                sign[0] <= 1; //Mplier is Minus
                            end
                            else
                            begin
                                B <= Mplier;
                            end

                            //Mcand is Minus
                            if(Mcand[15])
                            begin
                                ABS_M <= (~Mcand)+1'b1; //2's Comlement
                                sign[1] <= 1; //Mcand is Minus 
                            end
                            else
                            begin
                                ABS_M <= Mcand;
                            end
                            A <= 16'h0000;
                            State <= 1;
                    end

			        else
					begin
					     State <= 0;
                    end
                end //End of State 0
		 1, 2: 
					begin

						 if(!K)
						 begin
							  //Shift and Add
							  if(B[0] == 1'b1)
							  begin
									addout = A + ABS_M; //Absolute Multiplicnad added
									A <= {1'b0, addout[15:1]}; //Zero Padded
									B <= {addout[0], B[15:1]}; //Shifted
									State <= 1;
							  end
							  //Just Shift
							  else
							  begin
									A <= {1'b0, A[15:1]}; //Zero Padded
									B <= {A[0], B[15:1]}; //Shifted
									State <= 2;
							  end
						 end
                    end
         3:
                     //Complete
			         begin
                         //Two Signs are Different
                         if(sign[1]^sign[0]) 
                         begin
                             Product <= ~{0, A, B[15:1]}+1; //2's Complement
                         end
                         //Two Signs are Same
                         else 
                         begin
                             Product <= {0, A, B[15:1]}; //B[0] Bit is for Sign. So it isn't useful
                         end 
                         State <= 4;
					 end
         4:
                     begin
                         Product <= 32'h0000_0000;
                         if(!St)
								 begin
									sign <= 0;
									State <= 0;
								end
                     end
					
		default:
					begin
						State <= 0;
					end
		 endcase
	 end
 
    //Counter
    always @ (posedge CLK)
    begin
			if(State)
			begin
			  if(Count==4'b1110)
              begin
					K <= 1;
               State <= 3;
              end
			  else
					K <= 0;
			  Count <= Count +1;
		  end
		  else
			  Count <= 0;
    end
    
    assign Done = (State == 3) ? 1'b1 : 1'b0;
endmodule
