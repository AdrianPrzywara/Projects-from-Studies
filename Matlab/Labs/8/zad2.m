clear;
load hospital

B=double(hospital(:,3));
C=double(hospital(:,4));
D=double(hospital.BloodPressure);

D1=double(hospital.BloodPressure(:,1));
D2=double(hospital.BloodPressure(:,2));

figure(1)

subplot(3,1,1)
histogram(B,max(B)-min(B))
title('Wiek');

subplot(3,1,2)
histogram(C,max(C)-min(C))
title('Waga');

subplot(3,1,3)
histogram(D1,max(D1)-min(D1))
title('Ciśnienie krwi');
hold on
histogram(D2,max(D2)-min(D2))
legend('Skurczowe','Rozkurczowe')
