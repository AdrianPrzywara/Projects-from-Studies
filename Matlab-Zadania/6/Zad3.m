clear, clc, close all;

%% Dane:
syms x;
f(x)=x.^3+2*x+4;
F(x)=1/4*x.^4+x.^2+4*x;
a=1;
b=4;
cd=double(F(b)-F(a));
n=50;

%% Metoda Trapezów
t1start=tic;
WynikTrapez=CalcTrapez(f,a,b,n);
Trapez=double(WynikTrapez);
BladT=(Trapez-cd)/Trapez*100;
t1stop=toc(t1start);

%% Metoda Prostokątów
t2start=tic;
WynikProstokat=CalcProstokat(f,a,b,n);
Prostokat=double(WynikProstokat);
BladP=(Prostokat-cd)/Prostokat*100;
t2stop=toc(t2start);

%% Wbudowana funkcja Quad
t3start=tic;
WynikQuad=quad(f,a,b);
Quad=double(WynikQuad);
BladQ=(Quad-cd)/Quad*100;
t3stop=toc(t3start);

%% Wbudowana funkcja Int
t4start=tic;
WynikInt=int(f,a,b);
Int=double(WynikInt);
BladI=(Int-cd)/Int*100;
t4stop=toc(t4start);

%% Wykres
figure(1)
x0=linspace(a,b);
y0=f(x0);
plot(x0,y0,'color','r','LineWidth',3);
grid on;
title({['Czas liczenia metodą Trapezów: ',num2str(t1stop*1000),'ms'],['Wynik ',num2str(Trapez),' Błąd: ',num2str(BladT)],['Czas liczenia metodą Prostokątów: ',num2str(t2stop*1000),'ms'],['Wynik ',num2str(Prostokat),' Błąd: ',num2str(BladP)],['Czas liczenia wbudowaną funkcją Quad: ',num2str(t3stop*1000),'ms'],['Wynik ',num2str(Quad),' Błąd: ',num2str(BladQ)],['Czas liczenia wbudowaną funkcją Int: ',num2str(t4stop*1000),'ms'],['Wynik ',num2str(Int),' Błąd: ',num2str(BladI)]});
    

%% Wyświetlenie wyników czasu liczenia różnych metod
disp(['Czas liczenia metodą Trapezów: ',num2str(t1stop*1000),'ms']);
disp(['Wynik ',num2str(Trapez),' Błąd: ',num2str(BladT)]);
disp(['Czas liczenia metodą Prostokątów: ',num2str(t2stop*1000),'ms']);
disp(['Wynik ',num2str(Prostokat),' Błąd: ',num2str(BladP)]);
disp(['Czas liczenia wbudowaną funkcją Quad: ',num2str(t3stop*1000),'ms']);
disp(['Wynik ',num2str(Quad),' Błąd: ',num2str(BladQ)]);
disp(['Czas liczenia wbudowaną funkcją Int: ',num2str(t4stop*1000),'ms']);
disp(['Wynik ',num2str(Int),' Błąd: ',num2str(BladI)]);