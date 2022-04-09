%1a

clear; clc;

x=-5:1:4;
y=[1,2,2.2,1.3,4,4,1.3,2.2,2,1];
xq=[-5:0.01:4];


w1=interp1(x,y,xq,'linear');
w2=interp1(x,y,xq,'next');
w3=interp1(x,y,xq,'spline');

figure(1)
subplot(4,1,1)
plot(x,y,'r.');
title('Wykres Podstawowy')
xlim([-10,10]);

subplot(4,1,2)
ylabel('y')
xlabel('x')
plot(x,y,'bo',xq,w1,'.-')
title('Wykres interpolacji liniowej')
legend('Węzły interpolacji','Interpolacja liniowa','location','Northeast')
xlim([-10,10]);


subplot(4,1,3)
ylabel('y')
xlabel('x')
plot(x,y,'bo',xq,w2,'--')
title('Wykres interpolacji "next"')
legend('Węzły Interpolacji','interpolacja "next"','location','Northeast')
xlim([-10,10]);


subplot(4,1,4)
ylabel('y')
xlabel('x')
plot(x,y,'bo',xq,w3,'-')
title('Wykres interpolacji "spline"')
legend('węzły interpolacji','interpolacja "spline"','location','Northeast')
xlim([-10,15]);