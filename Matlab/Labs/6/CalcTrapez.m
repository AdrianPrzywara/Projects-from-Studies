function w = CalcTrapez(f,a,b,n)
%Całkowanie metodą trapezów

h=(b-a)/(n-1);

x0=linspace(a,b,n);

f1=f(x0(1));
f2=f(x0(n));
f_sum=0;

for i=2:n-1
    f_sum=f_sum+f(x0(i));
end

w=h*(0.5*(f1+f2)+f_sum);
end

