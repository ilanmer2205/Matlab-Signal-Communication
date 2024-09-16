clc;
clear all;
close all;

%**ASK modulation**

N= 20;
x= randi([0, 1], 1, N); %Data signal as a binary input.
Tb= 0.0001;
DC= 8;
A= 6;
A1= A+ DC;
A2= A- DC;
nb= 100; %digital signal per bit
digit=[];

%Data signal (represented as a rectangular wave).

for n= 1:1:N
    if x(n)==1;
        sig= A1*ones(1,nb);
    else x(n)==0;
        sig= -1*A2*ones(1,nb);
    end
    digit= [digit sig];
end

t1=Tb/nb:Tb/nb:nb*N*(Tb/nb);
subplot(2,1,1);
plot(t1, digit);
axis ([0 Tb*N -2 10]); %divide Tb*N to get a closer look (also the Y_ASK signal)
title('Data signal');
ylabel('Amplitude(volts)');
xlabel('time(sec)');
grid on;

Ac1= A1;
Ac2= A2; %EQUAL ZERO FOR OOK;
br= 1/Tb; %bit rate
Fc= br*10; %carrier frequency, should be bigger than br;
Pc1= 0; %carrier phase for '1'
Pc2= pi; %carrier phase for '0'
t2= Tb/nb:Tb/nb:nb*(Tb/nb); %signal time. 't2' represents a cycle of the carrier frequency, as each cycle has nb bits.

Y_ASK=[];
for(i=1:1:N)
    if(x(i)==1)
        y = Ac1*cos(2*pi*Fc*t2+Pc1);
    else (x(i)==0)
        y = Ac2*cos(2*pi*Fc*t2+Pc2);
    end
        Y_ASK=[Y_ASK y];
end
    
subplot (2,1,2);
plot(t1, Y_ASK);
title('ASK ,modulated signal');
axis ([0 Tb*N -10 10]);
ylabel('Amplitude(volts)');
xlabel('time(sec)');
grid on;

