%dla 30 punktów

clear; clc;

x=-4:0.25:3.25;
y=5*x.^3+3*x.^2+5;
xq=[x(1):0.1:x(30)];

%Interpolacje

w1=interp1(x,y,xq,'linear');
w2=interp1(x,y,xq,'next');
w3=interp1(x,y,xq,'spline');

%Tworzenie wykresów
figure(1)
subplot(2,2,1)                          %Wykres podstawowy
plot(x,y,'r.');
title('wykres podstawowy')
xlim([-10,5]);

subplot(2,2,2)                           %Wykres dla "line"
ylabel('y')
xlabel('x')
plot(x,y,'bo',xq,w1,'.-')
title('interpolacja liniowa')
legend('węzły interpolacji','interpolacja liniowa','location','Southwest')
xlim([-10,5]);


subplot(2,2,3)                          %Wykres dla "next"
ylabel('y')
xlabel('x')
plot(x,y,'bo',xq,w2,'--')
title('interpolacja "next"')
legend('węzły interpolacji','interpolacja "next"','location','Southwest')
xlim([-10,5]);

subplot(2,2,4)                           %Wykres dla "spline"
ylabel('y')
xlabel('x')
plot(x,y,'bo',xq,w3,'-')
title('interpolacja "spline"')
legend('węzły interpolacji','interpolacja "spline"','location','Southwest')
xlim([-10,5]);