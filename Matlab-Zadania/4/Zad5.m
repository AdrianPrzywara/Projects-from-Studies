clear, clc, close all;

%% Dane
x=[1.2,2.5,3.7,4.9];
y=[0.9,1.53,1.84,2.06];


a=aproks_lin(x,y);
[bp cp]=aproks_pot(x,y);
[bw cw]=aproks_wyk(x,y);

x0=linspace(0,7);
fp=@(x)bp*x.^cp;
fw=@(x)bw*exp(cw*x);

%% MSE
mse_lin=0;
for i = 1:length(x);
    mse_lin=mse_lin+(y(i)-polyval(a,x(i)))^2;
end
mse_lin=mse_lin/length(x);

mse_pot=0;
for i = 1:length(x);
    mse_pot=mse_pot+(y(i)-fp(x(i)))^2;
end
mse_pot=mse_pot/length(x);

mse_wyk=0;
for i = 1:length(x);
    mse_wyk=mse_wyk+(y(i)-fw(x(i)))^2;
end
mse_wyk=mse_wyk/length(x);

%% Wykres

y1=polyval(a,x0);
y2=fp(x0);
y3=fw(x0);

figure(1);
subplot(3,1,1);
plot(x,y,'ro',x0,y1,'b-');
grid on;
title({'Wykres aproksymacji potęgowej',['MSE=',num2str(mse_lin)]});
legend('Węzły aproksymacji','Aproksymacja liniowa');

subplot(3,1,2);
plot(x,y,'ro',x0,y2,'b-');
grid on;
title({'Wykres aproksymacji potęgowej',['MSE=',num2str(mse_pot)]});
legend('Węzły aproksymacji','Aproksymacja potęgowa');

subplot(3,1,3);
plot(x,y,'ro',x0,y3,'b-');
grid on;
title({'Wykres aproksymacji wykładniczej',['MSE=',num2str(mse_wyk)]});
legend('Węzły aproksymacji','Aproksymacja wykładnicza');