clear, clc, close all;

%% Dane:
syms x;
f(x)=-0.5*x.^2+2*x+3;

a=0;
b=7;
yp=-10;
yk=6;
n=5000;

[Wynik,xblue,yblue,xyellow,yyellow,xcyan,ycyan]=CalcMonteCarlo(f,a,b,yp,yk,n);

%% Wykres
figure(1);
x0=linspace(a,b);
y0=f(x0);

plot(xblue,yblue,'b.',xyellow,yyellow,'y.',xcyan,ycyan,'c.');
hold on;
plot(x0,y0,'color','r','LineWidth',3);
grid on;
title({'Wykres Całkowania Metodą Monte Carlo',['Wynik Całki=',num2str(Wynik)]});