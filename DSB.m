clc;
clear all;
close all;



fs=1000;
dt=1/fs;
t=0:dt:1-dt;
a=4;
fm=10;
fc=100;
c= cos(2*pi*fc*t);
x= a*cos(2*pi*fm*t);
Y_DSB= x.*c;


subplot(3,1,1)
plot(t, x);
grid on
hold on
plot(t, c);
xlabel('time(s)')
ylabel('amplitude')
title('carrier signal and data signal')

subplot(3,1,2);
plot(t, Y_DSB);
grid on
hold on
plot(t, x);
xlabel('time(s)')
ylabel('amplitude')
title('modulated signal')



f= -fs/2:1:fs/2-1;
Y= fftshift(fft(Y_DSB))/fs;
C= fftshift(fft(c)/fs); %carrier
subplot(3,1,3);
plot(f, abs(Y));
xlabel('freqency(HZ)')
ylabel('amplitude')
title('modulated signal and fc signal')
grid on
