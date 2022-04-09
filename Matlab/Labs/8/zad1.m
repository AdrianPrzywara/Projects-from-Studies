clear; clc; clear all;

load hospital

B=double(hospital(:,3));
C=double(hospital(:,4));
D1=double(hospital.BloodPressure(:,1));
D2=double(hospital.BloodPressure(:,2));

a=mean(B);
b=mean(C);
c=mean(D1);
d=mean(D2);

aa=std(B);
bb=std(C);
cc=std(D1);
dd=std(D2);

disp(['Wartość średnia dla wieku: ',num2str(a),' Odchylenie standardowe: ',num2str(aa)]);
disp(['Wartość średnia dla wagi: ',num2str(b),' Odchylenie standardowe: ',num2str(bb)]);
disp(['Wartość średnia dla ciśnienia skurczowego krwi: ',num2str(c),' Odchylenie standardowe: ',num2str(cc)]);
disp(['Wartość średnia dla ciśnienia rozkurczowego krwi: ',num2str(d),' Odchylenie standardowe: ',num2str(dd)]);