clear, clc, close all;
%% Dane
x=[-5,-2.5,3.5,6];
y=[4.6,2.53,-1.34,-4.56];

%% Współczynniki
a=aproks_lin(x,y);

%% Wykres
figure(1);
x0=linspace(-6,7);

y0=polyval(a,x0);

plot(x,y,'ro',x0,y0,'b-');
grid on;
title('Wykres aproksymacji liniowej');
legend('Węzły aproksymacji','Aproksymacja liniowa');
ylim([-5 5]);