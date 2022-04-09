%Dla 10 punktów

clear; clc;

x=-5:1:4;
y=5*x.^3+3*x.^2+5;
xq=[-5:0.01:4];

%Interpolacje

w1=interp1(x,y,xq,'linear');
w2=interp1(x,y,xq,'next');
w3=interp1(x,y,xq,'spline');

%Tworzenie wykresów

figure(1)
subplot(2,2,1)
plot(x,y,'r.');
title('wykres podstawowy')
xlim([-10,10]);

subplot(2,2,2)
ylabel('y')
xlabel('x')
plot(x,y,'bo',xq,w1,'.-')
title('interpolacja liniowa')
legend('węzły interpolacji','interpolacja liniowa','location','Northeast')
xlim([-10,10]);


subplot(2,2,3)
ylabel('y')
xlabel('x')
plot(x,y,'bo',xq,w2,'--')
title('interpolacja "next"')
legend('węzły interpolacji','interpolacja "next"','location','Northeast')
xlim([-10,10]);

subplot(2,2,4)
ylabel('y')
xlabel('x')
plot(x,y,'bo',xq,w3,'-')
title('interpolacja "spline"')
legend('węzły interpolacji','interpolacja "spline"','location','Northeast')
xlim([-10,15]);