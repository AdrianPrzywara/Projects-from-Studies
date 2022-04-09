%Zad 3
clear, clc, close all;
%% Dane
x=[-5,4.5,-3.5];
y=[4.6,3.53,-2.34];

%% Algorytm
n = length(x) - 1;
a=0;
for i=1:n+1
    Y0=1;
    for j=1:n+1
        if i==j
            continue;
        else
            Y0=conv(Y0,[1 -x(j)])/(x(i)-x(j));
        end
    end
    a=a+y(i)*Y0;
end

%% Wykres
x_min = min(x);
x_max = max(x);
xprzedzial = linspace(x_min,x_max,50);
f_y=polyval(a,xprzedzial);

figure(1);
plot(xprzedzial,f_y,'b',x,y,'ro');
title("Wykres interpolacji wielomianami LaGrange’a");
ylim([-25,25]);