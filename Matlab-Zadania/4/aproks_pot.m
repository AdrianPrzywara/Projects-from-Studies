function [b,c] = aproks_pot(x,y)
%Algorytm aproksymacji potęgowej

xp=log(x);
yp=log(y);

n=length(xp);
m=n*(sum(xp.^2))-(sum(xp)^2);

l11=0;
for i = 1:n
    l11=l11+xp(i)*yp(i);
end
l12=sum(xp)*sum(yp);

a1=(n*l11-l12)/m;

l21=(sum(xp.^2))*sum(yp);
l22=sum(xp)*l11;

a2=(l21-l22)/m;

b=exp(a2);
c=a1;

end

