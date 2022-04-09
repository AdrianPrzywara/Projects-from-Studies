function [a] = aproks_lin(x,y)
%Algorytm aproksymacji liniowej

n=length(x);
m=n*(sum(x.^2))-(sum(x)^2);

l11=0;
for i = 1:n
    l11=l11+x(i)*y(i);
end
l12=sum(x)*sum(y);

a1=(n*l11-l12)/m;

l21=(sum(x.^2))*sum(y);
l22=sum(x)*l11;

a2=(l21-l22)/m;

a=[a1 a2];

end

