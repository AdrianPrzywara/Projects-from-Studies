%1b

clear; clc;

[x,y]=meshgrid(-2:0.8:1.5,-1:1.5:1);
z=rand(2,5);

[xq,yq]=meshgrid(-1:0.4:2);


%Interpolacje

w1=interp2(x,y,z,xq,yq,'linear');
w2=interp2(x,y,z,xq,yq,'next');
w3=interp2(x,y,z,xq,yq,'spline');

%Tworzenie wykresów

figure(1)

subplot(4,1,1)
plot3(x,y,z,'bo')
title('wykres podstawowy')

subplot(4,1,2)
surf(xq,yq,w1)
title('wykres interpolacji "linear"')

subplot(4,1,3)
surf(xq,yq,w2)
title('wykres interpolacji "next"')

subplot(4,1,4)
surf(xq,yq,w3)
title('wykres interpolacji "spline"')