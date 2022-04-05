clear, clc, close all;
%% Dane
x=linspace(-5,5,8);
y=[3.2,2.23,-1.34,-2.56,-2.96,-4.3,-3.9,-5];

%% Wykres
figure(1);
x0=linspace(-6,7);

subplot(2,1,1);

p1=polyfit(x,y,1);
y1=polyval(p1,x0);

plot(x,y,'ro',x0,y1,'b-');
grid on;
title('Overfitting');
legend('Węzły aproksymacji','Aproksymacja funkcją liniową');


subplot(2,1,2);

p3=polyfit(x,y,9);
y3=polyval(p3,x0);

plot(x,y,'ro',x0,y3,'b-');
grid on;
legend('Węzły aproksymacji','Aproksymacja funkcją wielomianową');
ylim([-10,10]);