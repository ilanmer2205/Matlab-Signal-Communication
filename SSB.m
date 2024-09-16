clc;
clear all;
close all;



fs=1000;
dt=1/fs;
t=0:dt:1-dt;
a=4;
fm=10;
fm2=5;
fm3=7;
fm4= 15;
fm5= 12;

fc=100;

c= cos(2*pi*fc*t);
x= a*cos(2*pi*fm*t)+ a*cos(2*pi*fm2*t)+a*cos(2*pi*fm3*t)+a*cos(2*pi*fm4*t)+a*cos(2*pi*fm5*t);
Y_DSB= x.*c;

Xh= imag(hilbert(x));

Y_lsb= Y_DSB+ Xh.*sin(2*pi*fc*t);
Y_usb= Y_DSB- Xh.*sin(2*pi*fc*t);

subplot(4,1,1)
plot(t, x);
grid on
hold on
plot(t, c);
xlabel('time(s)')
ylabel('amplitude')
title('carrier signal and data signal')

subplot(4,1,2);
plot(t, Y_lsb);
hold on
plot(t, x);
xlabel('time(s)')
ylabel('amplitude')
title('modulated signal')
grid on


f= -fs/2:1:fs/2-1;
Y1= fftshift(fft(Y_lsb))/fs;
C= fftshift(fft(c)/fs);
subplot(4,1,3);
plot(f, abs(Y1));
xlabel('freqency(HZ)')
ylabel('amplitude')
title('modulated LSB signal and Fc signal')
grid on
hold on

Y2= fftshift(fft(Y_usb))/fs;
subplot(4,1,4);
plot(f, abs(Y2));
xlabel('freqency(HZ)')
ylabel('amplitude')
title('modulated USB signal and Fc signal')
grid on
hold on
subplot(4,1,4);
