clear;
load hospital

B=double(hospital(:,3));
C=double(hospital(:,4));
D=double(hospital.BloodPressure);

figure(1)
subplot(1,3,1)
boxplot(B)
title('Wiek')

subplot(1,3,2)
boxplot(C)
title('Waga')

subplot(1,3,3)
boxplot(D)
title('Ciśnienie krwi')


