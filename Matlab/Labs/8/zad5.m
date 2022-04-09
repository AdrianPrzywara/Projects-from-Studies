clear;
load hospital

M=hospital(hospital.Sex=='Male',:);
B=double(M(:,4));

C1=mean(B);
C2=std(B);

G1=normpdf(B,C1,C2);

figure(1)
subplot(1,2,1)
histfit(B,max(B)-min(B))
title('Rozkład gaussa dla M')
xlabel('Waga')
ylabel('Ilość przypadków')


K=hospital(hospital.Sex=='Female',:);
C=double(K(:,4));

C1=mean(C);
C2=std(C);

G2=normpdf(C,C1,C2);


subplot(1,2,2)
histfit(C,max(C)-min(C))
title('Rozkład gaussa dla K')
xlabel('Waga')
ylabel('Ilość przypadków')





