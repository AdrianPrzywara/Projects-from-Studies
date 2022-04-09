clear;
load hospital

B=double(hospital(:,3));

M=mean(B)
S=std(B)

G=normpdf(B,M,S);

histfit(B,max(B)-min(B))
xlabel('Wiek')
ylabel('Ilość Przypadków')




