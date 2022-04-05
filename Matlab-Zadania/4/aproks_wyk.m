function [b,c] = aproks_wyk(x,y)
%Algorytm aproksymacji wykładniczej

yp=log(y);

n=length(x);
m=n*(sum(x.^2))-(sum(x)^2);

l11=0;
for i = 1:n
    l11=l11+x(i)*yp(i);
end
l12=sum(x)*sum(yp);

a1=(n*l11-l12)/m;

l21=(sum(x.^2))*sum(yp);
l22=sum(x)*l11;

a2=(l21-l22)/m;

b=exp(a2);
c=a1;

end

