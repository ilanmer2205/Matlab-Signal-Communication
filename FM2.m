clc;
clear all;
close all;

fs=1000;
dt=1/fs;
t=0:dt:1-dt;
a=2; %delta_f=  ,kf=delta_f/fm;
fm=10;
fm2=20;
fc=100;
kf=10;
c= cos(2*pi*fc*t);
m= cos(2*pi*fm*t)+cos(2*pi*fm2*t);
m_b= tril(ones(length(m))); % making a low triangular matrix.
m_c=m.*m_b; %the rows represent diffrent points in time and each columm represents the diffrent values of m in time;
sum_m= sum(m_c, 2); %sum the rows of the vector, to make a 1 columm vector. Even though the values in time doesnt correspond to m, the rate of change does;
s= cos(2*pi*fc*t+(kf*2*pi*sum_m').*dt); %notice we transpose sum_m (making him a row vector) so we can sum both values;
subplot(2,1,1);
plot (t,s)
grid on
hold on
plot (t,m);
xlabel("tims(s)");
ylabel('amplitude');
title('message and modulated signal');

f= -fs/2:1:fs/2-1;
M=fftshift(fft(m)); 
S= fftshift(fft(s));
C=fftshift(fft(c)); % represents two dirac signals of carrier;
subplot(2,1,2);
plot(f,abs(M)/fs); %divide by fs to normalise amplitude;
title('frequenct domain representaion of the signals')
grid on
hold on
plot(f, abs(S)/fs);
grid on
hold on
xlabel('frequency (hz)')
ylabel('magnitude')