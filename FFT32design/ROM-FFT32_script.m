%Twiddle factor for FFT with length Nfft = 32
%https://www.omnicalculator.com/math/twos-complement
%
%Second solution
clc;
clear all;
close all;

Nfft                =  32;
t                   =  (0:1:Nfft/2-1);
TWFa                =  exp(-i*2*pi*t/Nfft);

TWFa_re             =  real(TWFa);
TWFa_im             =  imag(TWFa);

fiPo_TWFa_re        = fi(TWFa_re,1,24,8);
fiPo_TWFa_im        = fi(TWFa_im,1,24,8);

fprintf("Real value: \n");
fiPo_TWFa_re.data
fiPo_TWFa_im.data

fprintf("Int value: \n");
fiPo_TWFa_re.int
fiPo_TWFa_im.int

fprintf(" Corresponding fixed point value: \n");
fiPo_TWFa_re.bin
fiPo_TWFa_im.bin

