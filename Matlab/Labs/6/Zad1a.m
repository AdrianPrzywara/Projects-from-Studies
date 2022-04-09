clear, clc, close all;

%% Dane:
syms x;
f(x)=x.^3+2*x+4;

a=1;
b=4;
n=20;

Wynik=CalcTrapez(f,a,b,n);

%% Wykres
figure(1);
x0=linspace(a,b);
y0=f(x0);

plot(x0,y0,'color','r','LineWidth',3);
grid on;
title({'Wykres Całkowania Metodą Trapezów',['Wynik Całki=',num2str(double(Wynik))]});