clc;
clear all;
close all;


N=20;
x=randi([0, 1], 1, N); %Data signal as a binary input.
Tb=0.0001;
DC=-2;
A1=1;
A2= A1+DC;

%Data signal (represented as a rectangular wave). '1'=1 volt, '0'=-1 volt.

nb= 100; %digital signal per bit
digit=[];

for n= 1:1:N
    if x(n)==1;
        sig= A1*ones(1,nb);
    else x(n)==0;
        sig= A2*ones(1,nb);
    end
    digit= [digit sig];
end

t1=Tb/nb:Tb/nb:nb*N*(Tb/nb);
subplot(3,1,1);
plot(t1, digit);
title('Data signal');
ylabel('Amplitude(volts)');
xlabel('time(sec)');
grid on;


NZR= 2*x-1;
data= reshape(NZR,2,N/2);

fc= 10.^3;
Tb=1/fc;
t= 0:(Tb/99):Tb;

Y_QPSK= []; %signal shape of the modulated signal
Ac=1;
In_phase= [];
Quadrature= [];

for(r=1:N/2)
    In= data(1,r)*Ac*cos(2*pi*fc*t); %inphase component;
    Qd= data(2,r)*Ac*sin(2*pi*fc*t); %quadrature component
    In_phase= [In_phase In]; %inphase signal vector
    Quadrature= [Quadrature Qd]; %quadrature signal vector
    Y_QPSK= [Y_QPSK In+Qd]; %modulated signal
end


M=4; %MOD is 4 for QPSK
const = [];
for(n=1:N/2)
    if data(1,n) == -1 && data(2,n) == -1 %point 00
       c= exp(-1*i*(2*pi*0)/M)
    elseif data(1,n) == -1 && data(2,n) == 1 %point 01
        c= exp(-1*i*(2*pi*1)/M)
    elseif data(1,n) == 1 && data(2,n) == -1 %point 10
        c= exp(-1*i*(2*pi*2)/M)
    elseif data(1,n) == 1 && data(2,n) == 1 %point 11
        c= exp(-1*i*(2*pi*3)/M)
    end
    const=[const c];
end


subplot(3,1,2);
stairs(NZR);
grid minor
xlim([0,N]);
ylim([0,1.1]); 
title ('message signal');
subplot(3,1,3);
plot(Y_QPSK); 
ylim([-2,2]); 
grid minor 
title ('QPSK modulated signal')
scatterplot(const, [],[], 'r');
grid minor

