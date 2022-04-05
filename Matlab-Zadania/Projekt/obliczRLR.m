function [U2,UR1,UL,I] = obliczRLR(U1,R1,R2,L)
syms U2s UR1s ULs Is s f;

U1s=laplace(U1);

f=(U2s==(R2/(R1+R2+s*L)*U1s));
U2s=solve(f,U2s);
U2=ilaplace(U2s);

f=(UR1s==(R1/(R1+R2+s*L)*U1s));
UR1s=solve(f,UR1s);
UR1=ilaplace(UR1s);

f=(ULs==((L*s)/(R1+R2+s*L)*U1s));
ULs=solve(f,ULs);
UL=ilaplace(ULs);

f=(Is==(U1s/(R1+R2+s*L)));
Is=solve(f,Is);
I=ilaplace(Is);

end

