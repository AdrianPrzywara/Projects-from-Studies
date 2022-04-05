clear, clc, close all;

%% Dane:
syms x;
f(x)=-0.5*x.^2+2*x+3;
F(x)=-1/6*x.^3+x.^2+3*x;
a=0;
b=7;
yp=-10;
yk=6;
cd=double(F(b)-F(a));

n=5;
nmc=50;
figure(1)
x0=linspace(a,b);
y0=f(x0);
for i=1:4
    t1start=tic;
    WynikTrapez=CalcTrapez(f,a,b,n);
    Trapez=double(WynikTrapez);
    BladT=(Trapez-cd)/Trapez*100;
    t1stop=toc(t1start);
    
    t2start=tic;
    WynikProstokat=CalcProstokat(f,a,b,n);
    Prostokat=double(WynikProstokat);
    BladP=(Prostokat-cd)/Prostokat*100;
    t2stop=toc(t2start);

    t3start=tic;
    [WynikMonteCarlo,xblue,yblue,xyellow,yyellow,xcyan,ycyan]=CalcMonteCarlo(f,a,b,yp,yk,nmc);
    MonteCarlo=double(WynikMonteCarlo);
    BladMC=(MonteCarlo-cd)/MonteCarlo*100;
    t3stop=toc(t3start);
    
    subplot(1,4,i)
    plot(xblue,yblue,'b.',xyellow,yyellow,'y.',xcyan,ycyan,'c.');
    hold on;
    plot(x0,y0,'color','r','LineWidth',3);
    grid on;
    title({['Wynik M. Trapezów: ',num2str(Trapez)],['Wynik M. Prostokątów: ',num2str(Prostokat)],['Wynik M. Monte Carlo: ',num2str(MonteCarlo)],['Czas M. Trapezów: ',num2str(t1stop)],['Czas M. Prostokątów: ',num2str(t2stop)],['Czas M. Monte Carlo: ',num2str(t3stop)],['Błąd dla M. Prostokątów: ',num2str(BladP)],['Błąd dla M. Trapezów: ',num2str(BladT)],['Błąd dla M. Monte Carlo: ',num2str(BladMC)],['Krok Całkowania: ',num2str(n)],['Ilość wylosowanych pkt.: ',num2str(nmc)]});
    
    n=2*n;
    nmc=2*nmc;
end
    