clear, clc, close all;
%% Dane
x=[1.2,2.5,3.7,4.9];
y=[0.9,1.53,1.84,2.06];

%% Współczynniki
[b c]=aproks_pot(x,y);

%% Wykres
figure(1);
x0=linspace(0,7);

f=@(x)b*x.^c;
y0=f(x0);

plot(x,y,'ro',x0,y0,'b-');
grid on;
title('Wykres aproksymacji potęgowej');
legend('Węzły aproksymacji','Aproksymacja potęgowa');