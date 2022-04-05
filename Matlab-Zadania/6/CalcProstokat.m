function w = CalcProstokat(f,a,b,n)
%Całkowanie metodą prostokątów
h=(b-a)/(n-1);

x0=linspace(a,b,n);

f_sum=0;

for i=1:n-1
    f_sum=f_sum+f(x0(i)+h/2);
end

w=h*f_sum;

end

