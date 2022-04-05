function [w,x_blue,y_blue,x_yellow,y_yellow,x_cyan,y_cyan] = CalcMonteCarlo(f,xp,xk,yp,yk,n)
%Całkowanie metodą Monte Carlo

P=abs(xk-xp)*abs(yk-yp);

xrand=xp+(xk-xp).*rand(1,n);
yrand=yp+(yk-yp).*rand(1,n);

c=0;
x_blue=xrand;
x_yellow=xrand;
x_cyan=xrand;
y_blue=yrand;
y_yellow=yrand;
y_cyan=yrand;

for i=1:n
    if (yrand(i)>0) && (yrand(i)<=f(xrand(i)))
        c=c+1;
        x_yellow(i)=NaN;
        y_yellow(i)=NaN;
        x_cyan(i)=NaN;
        y_cyan(i)=NaN;
    elseif(yrand(i)<0) && (yrand(i)>=f(xrand(i)))
        c=c-1;
        x_blue(i)=NaN;
        y_blue(i)=NaN;
        x_cyan(i)=NaN;
        y_cyan(i)=NaN;
    else
        c=c;
        x_yellow(i)=NaN;
        y_yellow(i)=NaN;
        x_blue(i)=NaN;
        y_blue(i)=NaN;
    end
end

w=P*c/n;
end

