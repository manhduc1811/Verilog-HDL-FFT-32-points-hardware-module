clc;
clear;
close all;
Nfft    = 32;
x       = (0:Nfft-1)';
y       = bitrevorder(x);

%x_bin   = dec2bin(x);
%y_bin   = dec2bin(y);
%T       = table(x,x_bin,y,y_bin);
%T

fprintf("        5'd%d : begin\n",x(1));    
fprintf("           result_r_ns[%d] = out_r[23:8];\n",y(Nfft));    
fprintf("           result_i_ns[%d] = out_i[23:8];\n",y(Nfft));
fprintf("        end\n");
for i = 2:1:Nfft-1
    fprintf("        5'd%d : begin\n",x(i));    
    fprintf("           result_r_ns[%d] = out_r[23:8];\n",Nfft - 2 - y(Nfft-i+1));    
    fprintf("           result_i_ns[%d] = out_i[23:8];\n",Nfft - 2 - y(Nfft-i+1));
    fprintf("        end\n");
end
fprintf("        5'd%d : begin\n",x(Nfft));    
fprintf("           result_r_ns[%d] = out_r[23:8];\n",Nfft - 2 - y(1));    
fprintf("           result_i_ns[%d] = out_i[23:8];\n",Nfft - 2 - y(1));
fprintf("           next_over = 1'b1; \n");    
fprintf("        end\n");