%clear;clc;close all;
clc;
for i = 1:1:32
    formatSpec ="int_r[%d] =  %d;\n";
    fprintf(formatSpec,i,xINT(i));
end