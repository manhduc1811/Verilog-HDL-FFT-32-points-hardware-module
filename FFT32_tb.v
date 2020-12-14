module tb_FFT32;
	parameter 					FFT_size		= 32;
	parameter 					IN_width		= 12;
	parameter 					OUT_width		= 16;
	parameter 					cycle			= 10.0;
	integer 					j;
    reg signed	[IN_width-1:0]  int_r           [0:FFT_size-1];
    reg signed	[IN_width-1:0]  int_i           [0:FFT_size-1];
	reg 						clk, rst_n, in_valid;
	wire 						out_valid;
	reg signed  [IN_width-1:0] 	din_r, din_i;
	wire signed [OUT_width-1:0] dout_r, dout_i;
////////////////////////////////////////////
	always #(cycle/2.0) 
		clk = ~clk;
////////////////////////////////////////////
	FFT32 uut_FFT32(
		.clk(clk),
		.rst_n(rst_n),
		.in_valid(in_valid),
		.din_r(din_r),
		.din_i(din_i),
		.out_valid(out_valid),
		.dout_r(dout_r),
		.dout_i(dout_i)
	);
////////////////////////////////////////////	
	initial begin
		int_r[0] =  0;
		int_r[1] =  260;
		int_r[2] =  34;
		int_r[3] =  618;
		int_r[4] =  221;
		int_r[5] =  622;
		int_r[6] =  512;
		int_r[7] =  366;
		int_r[8] =  665;
		int_r[9] =  106;
		int_r[10] =  477;
		int_r[11] =  4;
		int_r[12] =  -1;
		int_r[13] =  -5;
		int_r[14] =  -478;
		int_r[15] =  -107;
		int_r[16] =  -666;
		int_r[17] =  -367;
		int_r[18] =  -513;
		int_r[19] =  -623;
		int_r[20] =  -222;
		int_r[21] =  -619;
		int_r[22] =  -35;
		int_r[23] =  -261;
		int_r[24] =  -1;
		int_r[25] =  260;
		int_r[26] =  34;
		int_r[27] =  618;
		int_r[28] =  221;
		int_r[29] =  622;
		int_r[30] =  511;
		int_r[31] =  366;	
	end
	initial begin
		int_i[0] =    0;
		int_i[1] =    0;
		int_i[2] =    0;
		int_i[3] =    0;
		int_i[4] =    0;
		int_i[5] =    0;
		int_i[6] =    0;
		int_i[7] =    0;
		int_i[8] =    0;
		int_i[9] =    0;
		int_i[10] =   0;
		int_i[11] =   0;
		int_i[12] =   0;
		int_i[13] =   0;
		int_i[14] =   0;
		int_i[15] =   0;
		int_i[16] =   0;
		int_i[17] =   0;
		int_i[18] =   0;
		int_i[19] =   0;
		int_i[20] =   0;
		int_i[21] =   0;
		int_i[22] =   0;
		int_i[23] =   0;
		int_i[24] =   0;
		int_i[25] =   0;
		int_i[26] =   0;
		int_i[27] =   0;
		int_i[28] =   0;
		int_i[29] =   0;
		int_i[30] =   0;
		int_i[31] =   0;	
	end
////////////////////////////////////////////	
	initial begin
		clk 		= 0;
		rst_n 	    = 1;
		in_valid    = 0;
		@(negedge clk);
		@(negedge clk) rst_n   = 0;
		@(negedge clk) rst_n  = 1;
		@(negedge clk);
        ////////////////////////
		for(j = 0;j < FFT_size;j = j + 1) begin
			@(negedge clk);
			in_valid 	= 1;
			din_r 		= int_r[j];
			din_i 		= int_i[j];
		end
		@(negedge clk) in_valid = 0;
		////////////////////////
		////////////////////////	
		for(j=0;j<FFT_size;j=j+1) begin
			while(!out_valid) begin
				@(negedge clk); 
			end
		@(negedge clk);		
		end
		///////////////////////
		///////////////////////
		$stop;
	end
endmodule