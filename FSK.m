clc;
clear all;
close all;


%**FSK modulation**

N= 20;
x= randi([0, 1], 1, N); %Data signal as a binary input.
Tb= 0.0001;
A= 1;

nb= 100; %digital signal per bit
digit=[];

%Data signal (represented as a rectangular wave).

for n= 1:1:N
    if x(n)==1;
        sig= A*ones(1,nb);
    else x(n)==0;
        sig= 0*A*ones(1,nb);
    end
    digit= [digit sig];
end

t1=Tb/nb:Tb/nb:nb*N*(Tb/nb);
subplot(2,1,1);
plot(t1, digit);
title('Data signal');
ylabel('Amplitude(volts)');
xlabel('time(sec)');
grid on;


t2= Tb/nb: Tb/nb: nb*Tb/nb;
rb =1/Tb;
fc1 =rb*10;
fc2 =rb*5;
Ac =A; 

Y_FSK= [];
for i= 1:1:N
    if x(i)==1
        y= Ac*cos(2*pi*fc1*t2);
    else
        y= Ac*cos(2*pi*fc2*t2);
    end
    Y_FSK= [Y_FSK y];
end

subplot (2,1,2);
plot(t1, Y_FSK);
title('FSK ,modulated signal');
axis ([0 Tb*N -10 10]);
ylabel('Amplitude(volts)');
xlabel('time(sec)');
grid on;

