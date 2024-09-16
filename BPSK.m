clc;
clear all;
close all;

%**BPSK modulation**


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
%explnation:
%for a smoother wave each bit of '1' or '0' has the length of 'nb'. resulating 
%in 'digit' having N*nb bits.

%'t1' below progresses in units of 'Tb/nb', making the data rate represent the extrapolated bits as well.
% 't1' progresses until it reaches N*nb as explained in lines 26-27.
t1=Tb/nb:Tb/nb:nb*N*(Tb/nb);
subplot(3,1,1);
plot(t1, digit);
title('Data signal');
ylabel('Amplitude(volts)');
xlabel('time(sec)');
grid on;


%BPSK modulation:

Ac1=A1;
Ac2=A2;
br=1/Tb; %bit rate
Fc= 10*br; %carrier frequency, should be bigger than br;
Pc1=0; %carrier phase for '1'
Pc2=pi; %carrier phase for '0'
t2=Tb/nb:Tb/nb:nb*(Tb/nb); %signal time. 't2' represents a cycle of the carrier frequency, as each cycle has nb bits.

Y_BPSK=[];
for(i=1:1:N)
    if(x(i)==1)
        y = Ac1*cos(2*pi*Fc*t2+Pc1);
    else (x(i)==0)
        y = -Ac2*cos(2*pi*Fc*t2+Pc2);
    end
        Y_BPSK=[Y_BPSK y];
end
    
subplot (3,1,2);
plot(t1, Y_BPSK);
title('BPSK ,modulated signal');
ylabel('Amplitude(volts)');
xlabel('time(sec)');
grid on;

          