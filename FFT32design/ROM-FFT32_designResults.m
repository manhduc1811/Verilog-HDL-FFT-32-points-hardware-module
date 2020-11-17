%Creat DB:
clc;
clear all;
close all;

Nfft         =  32;
t            =  (0:1:Nfft/2-1);
TWFa         =  exp(-i*2*pi*t/Nfft);
			 
TWFa_re      =  real(TWFa);
TWFa_im      =  imag(TWFa);
			 
fiPo_TWFa_re = fi(TWFa_re,1,24,8);
fiPo_TWFa_im = fi(TWFa_im,1,24,8);

fprintf("Real value: \n");
fiPo_TWFa_re.data
fiPo_TWFa_im.data

fprintf("Int value: \n");
fiPo_TWFa_re.int
fiPo_TWFa_im.int

fprintf(" Corresponding fixed point value: \n");
fiPo_TWFa_re.bin
fiPo_TWFa_im.bin

%-------------------------------------------------------------
%to generate ROM-2 data:
clc;
N = 2;
fprintf("case(s_count)\n");
for t = 0:(N-1)
	count 	= 	N+t;
	x		=	fiPo_TWFa_re(1 + t*16/N);
	y		=	fiPo_TWFa_im(1 + t*16/N);
	formatr = 	"2'd%d: begin \n w_r = 24'b %s;\n";
	formati = 	" w_i = 24'b %s;\n end\n";
	fprintf(formatr,count,x.bin);
	fprintf(formati,y.bin);
end
x0	=	fiPo_TWFa_re(1);
y0	=	fiPo_TWFa_im(1);
fprintf("default: begin \n w_r = 24'b %s;\n",x0.bin);
fprintf(" w_i = 24'b %s;\n end\n",y0.bin);
fprintf("endcase\n");
%--> 
case(s_count)
2'd2: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
2'd3: begin 
 w_r = 24'b 000000000000000000000000;
 w_i = 24'b 111111111111111100000000;
 end
default: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
endcase
%-------------------------------------------------------------
%to generate ROM-4 data:
clc;
N = 4;
fprintf("case(s_count)\n");
for t = 0:(N-1)
	count 	= 	N+t;
	x		=	fiPo_TWFa_re(1 + t*16/N);
	y		=	fiPo_TWFa_im(1 + t*16/N);
	formatr = 	"3'd%d: begin \n w_r = 24'b %s;\n";
	formati = 	" w_i = 24'b %s;\n end\n";
	fprintf(formatr,count,x.bin);
	fprintf(formati,y.bin);
end
x0	=	fiPo_TWFa_re(1);
y0	=	fiPo_TWFa_im(1);
fprintf("default: begin \n w_r = 24'b %s;\n",x0.bin);
fprintf(" w_i = 24'b %s;\n end\n",y0.bin);
fprintf("endcase\n");
%--> 
case(s_count)
3'd4: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
3'd5: begin 
 w_r = 24'b 000000000000000010110101;
 w_i = 24'b 111111111111111101001011;
 end
3'd6: begin 
 w_r = 24'b 000000000000000000000000;
 w_i = 24'b 111111111111111100000000;
 end
3'd7: begin 
 w_r = 24'b 111111111111111101001011;
 w_i = 24'b 111111111111111101001011;
 end
default: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
endcase
%------------------------------------------------------------
%to generate ROM-8 data:
clc;
N = 8;
fprintf("case(s_count)\n");
for t = 0:(N-1)
	count 	= 	N+t;
	x		=	fiPo_TWFa_re(1 + t*16/N);
	y		=	fiPo_TWFa_im(1 + t*16/N);
	formatr = 	"4'd%d: begin \n w_r = 24'b %s;\n";
	formati = 	" w_i = 24'b %s;\n end\n";
	fprintf(formatr,count,x.bin);
	fprintf(formati,y.bin);
end
x0	=	fiPo_TWFa_re(1);
y0	=	fiPo_TWFa_im(1);
fprintf("default: begin \n w_r = 24'b %s;\n",x0.bin);
fprintf(" w_i = 24'b %s;\n end\n",y0.bin);
fprintf("endcase\n");
%--> 
case(s_count)
4'd8: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
4'd9: begin 
 w_r = 24'b 000000000000000011101101;
 w_i = 24'b 111111111111111110011110;
 end
4'd10: begin 
 w_r = 24'b 000000000000000010110101;
 w_i = 24'b 111111111111111101001011;
 end
4'd11: begin 
 w_r = 24'b 000000000000000001100010;
 w_i = 24'b 111111111111111100010011;
 end
4'd12: begin 
 w_r = 24'b 000000000000000000000000;
 w_i = 24'b 111111111111111100000000;
 end
4'd13: begin 
 w_r = 24'b 111111111111111110011110;
 w_i = 24'b 111111111111111100010011;
 end
4'd14: begin 
 w_r = 24'b 111111111111111101001011;
 w_i = 24'b 111111111111111101001011;
 end
4'd15: begin 
 w_r = 24'b 111111111111111100010011;
 w_i = 24'b 111111111111111110011110;
 end
default: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 end
endcase
 %------------------------------------------------------------
%to generate ROM-16 data:
% Notice: count = 2*N+t
% Notice: "next_valid = 1'b1;"
% Notice: "next_valid = 1'b0;" for s_count=47
clc;
N = 16;
fprintf("case(count)\n");
for t = 0:(N-1)
	count 	= 	2*N+t;
	x		=	fiPo_TWFa_re(1 + t*16/N);
	y		=	fiPo_TWFa_im(1 + t*16/N);
	formatr = 	"6'd%d: begin \n w_r = 24'b %s;\n";
	formati = 	" w_i = 24'b %s;\n next_valid = 1'b1;\n end\n";
	fprintf(formatr,count,x.bin);
	fprintf(formati,y.bin);
end
x0	=	fiPo_TWFa_re(1);
y0	=	fiPo_TWFa_im(1);
fprintf("default: begin \n w_r = 24'b %s;\n",x0.bin);
fprintf(" w_i = 24'b %s;\n next_valid = 1'b1;\n end\n",y0.bin);
fprintf("endcase\n");
%--> 
case(count)
6'd32: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 next_valid = 1'b1;
 end
6'd33: begin 
 w_r = 24'b 000000000000000011111011;
 w_i = 24'b 111111111111111111001110;
 next_valid = 1'b1;
 end
6'd34: begin 
 w_r = 24'b 000000000000000011101101;
 w_i = 24'b 111111111111111110011110;
 next_valid = 1'b1;
 end
6'd35: begin 
 w_r = 24'b 000000000000000011010101;
 w_i = 24'b 111111111111111101110010;
 next_valid = 1'b1;
 end
6'd36: begin 
 w_r = 24'b 000000000000000010110101;
 w_i = 24'b 111111111111111101001011;
 next_valid = 1'b1;
 end
6'd37: begin 
 w_r = 24'b 000000000000000010001110;
 w_i = 24'b 111111111111111100101011;
 next_valid = 1'b1;
 end
6'd38: begin 
 w_r = 24'b 000000000000000001100010;
 w_i = 24'b 111111111111111100010011;
 next_valid = 1'b1;
 end
6'd39: begin 
 w_r = 24'b 000000000000000000110010;
 w_i = 24'b 111111111111111100000101;
 next_valid = 1'b1;
 end
6'd40: begin 
 w_r = 24'b 000000000000000000000000;
 w_i = 24'b 111111111111111100000000;
 next_valid = 1'b1;
 end
6'd41: begin 
 w_r = 24'b 111111111111111111001110;
 w_i = 24'b 111111111111111100000101;
 next_valid = 1'b1;
 end
6'd42: begin 
 w_r = 24'b 111111111111111110011110;
 w_i = 24'b 111111111111111100010011;
 next_valid = 1'b1;
 end
6'd43: begin 
 w_r = 24'b 111111111111111101110010;
 w_i = 24'b 111111111111111100101011;
 next_valid = 1'b1;
 end
6'd44: begin 
 w_r = 24'b 111111111111111101001011;
 w_i = 24'b 111111111111111101001011;
 next_valid = 1'b1;
 end
6'd45: begin 
 w_r = 24'b 111111111111111100101011;
 w_i = 24'b 111111111111111101110010;
 next_valid = 1'b1;
 end
6'd46: begin 
 w_r = 24'b 111111111111111100010011;
 w_i = 24'b 111111111111111110011110;
 next_valid = 1'b1;
 end
6'd47: begin 
 w_r = 24'b 111111111111111100000101;
 w_i = 24'b 111111111111111111001110;
 next_valid = 1'b0;
 end
default: begin 
 w_r = 24'b 000000000000000100000000;
 w_i = 24'b 000000000000000000000000;
 next_valid = 1'b1;
 end
endcase