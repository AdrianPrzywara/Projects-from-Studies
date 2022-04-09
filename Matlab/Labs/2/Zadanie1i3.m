clc; clear all;
%% Przykładowa funkcja
dx = 0.001;
x = -2:dx:3;
f=@(p)3*p.^3-2*p.^2-p+1;
a=[3,-2,-1,1];
e = 0.001;
y=f(x);

%% Metoda bisekcji
iM1=20;
i1=1;
x2=x;
t1start=tic;
while (i1<iM1 && abs(x2(end)-x2(1))>e && length(x2) ~= 1)
    i1=i1+1;
    s=((x2(1)+x2(end))/2);
    if f(x2(1))*f(s) < 0
        x2=x2(1):dx:s;
    else
        x2=s:dx:x2(end);
    end
end

if i1 == iM1;
    disp('Być może został popełniony błąd w obliczeniach metodą bisekcji');
end
t1stop=toc(t1start);
%% Metoda Newtona
t2start=tic;
iM2=30;
i2=1;
x3=-0.8;
while (i2<iM2 && abs((f(x3)/((f(x3+dx)-f(x3))/dx)))> e && abs(f(x3))>e)
    i2 = i2+1;
    x3=x3 - (f(x3)/((f(x3+dx)-f(x3))/dx));
end

if i2 == iM2;
    disp('Być może został popełniony błąd w obliczeniach metodą Newtona');
end
t2stop=toc(t2start);

%% Wbudowana funkcja
t3start=tic;
x4=roots(a);
t3stop=toc(t3start);

%% Wykresy
figure(1)
subplot(3,1,1)
plot(x,y);
hold on, grid on;
plot(x2,f(x2),'ro');
title('Metoda Bisekcji');
legend('y=f(x)');
ylim([-4,4]);

subplot(3,1,2)
plot(x,y);
hold on, grid on;
plot(x3,f(x3),'ro');
title('Metoda Newtona');
legend('y=f(x)');
ylim([-4,4]);

subplot(3,1,3)
plot(x,y);
hold on, grid on;
plot(x4(1),f(x4(1)),'ro');
title('Wbudowana funkcja');
legend('y=f(x)');   
ylim([-4,4]);


%% Wyświetlenie czasu liczenia różnych metod
disp(['Czas liczenia metodą bisekcji wyniósł: ',num2str(t1stop*1000),'ms']);
disp(['Czas liczenia metodą Newtona wyniósł: ',num2str(t2stop*1000),'ms']);
disp(['Czas liczenia wbudowaną funkcją wyniósł: ',num2str(t3stop*1000),'ms']);