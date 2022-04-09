clear, clc, close all;
%% Dane
x=[-5,-2.5,3.5,6,4.5,2.5,5];
y=[4.6,2.53,-1.34,2.96,-1.3,3.9,4];

%% Wykres
figure(1);
x0=linspace(-6,7);

subplot(3,1,1);

p1=polyfit(x,y,1);
y1=polyval(p1,x0);

plot(x,y,'ro',x0,y1,'b-');
grid on;
title('Wykresy aproksymacji funkcją polyfit');
legend('Węzły aproksymacji','Aproksymacja funkcją stopnia 1');
ylim([-8 8]);

subplot(3,1,2);

p2=polyfit(x,y,3);
y2=polyval(p2,x0);

plot(x,y,'ro',x0,y2,'b-');
grid on;
legend('Węzły aproksymacji','Aproksymacja funkcją stopnia 3');
ylim([-10 10]);

subplot(3,1,3);

p3=polyfit(x,y,5);
y3=polyval(p3,x0);

plot(x,y,'ro',x0,y3,'b-');
grid on;
legend('Węzły aproksymacji','Aproksymacja funkcją stopnia 5');
ylim([-30 30]);