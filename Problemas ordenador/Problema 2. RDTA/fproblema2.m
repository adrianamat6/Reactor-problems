%fproblema 2

function dydXa=fproblema2(Xa,y);
global Nj alfa To P Tref AH_ Cpj R Nto E Nao
t=y(1);
T=y(2);

k=exp(8.2-1000/T);



dydXa(1)=Nto*R*T*(1+E*Xa)/(k*Nao*(1-Xa)^2*P);

AH=AH_+alfa*Cpj'*(T-Tref);%[1x5]x[5x1]=[1x1]

L1=-Nao * AH * (-alfa(1));
L2=Nj*Cpj';%[1x5]x[5x1]=[1x1]
L3=(Xa*Nao/(-alfa(1)))*alfa*Cpj';
dydXa(2)=L1/(L2+L3);

dydXa=dydXa';

