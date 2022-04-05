clc; clear all;
%% Przykładowa funkcja
dx = 0.001;
x = -2:dx:3;
f=@(p)3*p.^3-2*p.^2-p+1;
a=[3,-2,-1,1];
y=f(x);

%% Deklaracja tablicy dla licznika iteracji oraz wykresu
i_bi=zeros(1,5);
i_ne=zeros(1,5);
figure(1)
%% Metoda bisekcji
iM1=30;
e = 0.001;
for j=1:5
    i1=1;
    x2=x;
    while (i1<iM1 && abs(x2(end)-x2(1))>e && length(x2) ~= 1)
        i1=i1+1;
        s=((x2(1)+x2(end))/2);
        if f(x2(1))*f(s) < 0
           x2=x2(1):dx:s;
        else
            x2=s:dx:x2(end);
         end
    end
    
    subplot(5,2,(2*j-1))
    plot(x,y);
    hold on, grid on;
    plot(x2,f(x2),'ro');
    ylim([-4,4]);
    
    if j==1
        title({'Metoda bisekcji',['e=',num2str(e),', i=',num2str(i1)]});
    else
        title(['e=',num2str(e),', i=',num2str(i1)]);
    end
       e=round(e*3.5,3);
    i_bi(j)=i1;
end
%% Metoda Newtona
iM2=30;
e = 0.001;
for j=1:5
    i2=1;
    x3=-0.8;
    while (i2<iM2 && abs((f(x3)/((f(x3+dx)-f(x3))/dx)))> e && abs(f(x3))>e)
        i2 = i2+1;
        x3=x3 - (f(x3)/((f(x3+dx)-f(x3))/dx));
    end
    
    subplot(5,2,(2*j))
    plot(x,y);
    hold on, grid on;
    plot(x3,f(x3),'ro');
    ylim([-4,4]);
    
    if j==1
        title({'Metoda Newtona',['e=',num2str(e),', i=',num2str(i2)]});
    else
        title(['e=',num2str(e),', i=',num2str(i2)]);
    end
    e=round(e*3.5,3);
    i_ne(j)=i2;
end