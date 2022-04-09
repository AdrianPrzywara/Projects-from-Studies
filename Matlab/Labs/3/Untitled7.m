clear, clc, close all;
%% Dane
x=[1.2,2.5,3.7,4.9];
y=[1.2,2.23,3.04,4.96];

%% Współczynniki
[b c]=aproks_wyk(x,y);

%% Wykres
figure(1);
x0=linspace(0,7);

f=@(x)b*exp(c*x);
y0=f(x0);

plot(x,y,'ro',x0,y0,'b-');
grid on;
title('Wykres aproksymacji wykładniczej');
legend('Węzły aproksymacji','Aproksymacja wykładnicza');