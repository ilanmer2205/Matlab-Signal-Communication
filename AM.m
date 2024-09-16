clc;
clear all;
close all;


fs=1000;
dt=1/fs;
t=0: dt: 1-dt;
fm=10;
fc=100;
Am= 1;
Ac=2;
m=0.5;
m2=1;
m3=1.5;

c= Ac*cos(2*pi*fc*t);
x= Am*cos(2*pi*fm*t);
x1= 1+m*x;
Y_AM= x1.*c;

x2= 1+m2*x;
Y_AM2= x2.*c;

x3= 1+m3*x;
Y_AM3= x3.*c;



subplot(3,1,1)
plot(t, x);
grid on
hold on
plot(t, c);
xlabel('time(s)')
ylabel('amplitude')
title('carrier signal and data signal')

subplot(3,1,2);
plot(t, Y_AM);
grid on
hold on
plot(t, x1*Ac);
xlabel('time(s)')
ylabel('amplitude')
title('modulated signal and data signal*Ac')
grid on


f= -fs/2:1:fs/2-1;
Y1= fftshift(fft(Y_AM))/fs;
C= fftshift(fft(c)/fs);
subplot(3,1,3);
plot(f, abs(Y1));
xlabel('freqency(HZ)')
ylabel('amplitude')
title('modulated AM signal and Fc signal')
grid on
hold on

figure
subplot(3,1,1)
plot(t, Y_AM);
grid on
hold on
plot(t, x1*Ac);

xlabel('time(s)')
ylabel('amplitude')
title('carrier signal and data signal')

subplot(3,1,2);
plot(t, Y_AM2);
grid on
hold on
plot(t, x2*Ac);
xlabel('time(s)')
ylabel('amplitude')
title('modulated signal and data signal*Ac')


subplot(3,1,3);
plot(t, Y_AM3);
grid on
hold on
plot(t, x3*Ac);
xlabel('time(s)')
ylabel('amplitude')
title('modulated signal and data signal*Ac')
grid on


