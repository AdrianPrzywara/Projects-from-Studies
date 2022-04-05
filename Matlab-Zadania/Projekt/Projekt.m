clear, clc, close all;

%% Deklaracja zmiennych

syms t;
R1=5;
R2=15;
L=0.5;
w=100;
fi=pi/2;
%% Deklaracja napięcia wejściowego
A=10; %Amplituda
U1(t)=A*exp(-w*t);

%% Wywołanie funkcji obliczającej napięcia i prąd w układzie
[U2(t),UR1(t),UL(t),I(t)] = obliczRLR(U1(t),R1,R2,L);

%% Prezentacja otrzymanych wyników

t=0:0.01:1;

figure(1);

subplot(5,1,1);
plot(t,U1(t));
title('Wykres napięcia wejściowego');

subplot(5,1,2);
plot(t,U2(t));
title('Wykres napięcia wyjściowego');

subplot(5,1,3);
plot(t,UR1(t));
title('Wykres napięcia na oporniku R1');

subplot(5,1,4);
plot(t,UL(t));
title('Wykres napięcia na cewce');

subplot(5,1,5);
plot(t,I(t));
title('Wykres prądu w obwodzie');





