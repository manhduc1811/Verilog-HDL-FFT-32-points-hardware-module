clc;
clear;
clear all;
N     =  32;
n     =  (0:1:N-1);
fs    =  48000;
f1    =  2000;
t     =  (0:1:N-1)*1/fs;
x     =   1.5*sin(2*pi*(f1/fs)*n);
xINT  =   floor(2^8*x);
subplot(3,1,1);
stem(t,x);
y     =   fft(x);
yAbs  =   abs(y);
f     =   (0:1:N-1)*N/fs;
subplot(3,1,2);
stem(f,y);
subplot(3,1,3);
stem(f,imag(y));

xINT
y