%fproblema 33

function F=fproblema38(y)
global alfa alfa_A V U A Tw Cpj hj AHref Tref ko E R nao njo no P To

Xa=y(1);
T=y(2);

Qvo=no*R*To/P;
Qvf=Qvo*T/To; %el factor de espación nos da 0 (solo se tiene en cuenta la reacción directa)
na= njo(1)*(1-Xa); %moles finales de A
nb= njo(2)+njo(1)*alfa(1,2)/-alfa(1,1)*Xa; %moles finales de b
nc= njo(3)+njo(1)*alfa(1,3)/-alfa(1,1)*Xa; %moles finales de c
Ca= na/Qvf; %mol/m^3
Cb= nb/Qvf; %mol/m^3
Cc= nc/Qvf; %mol/m^3

k=ko.*exp(-E/R/T);
r(1)=k(1)*Ca*Cb;
r(2)=k(2)*Cc^2;
ra=-r(1)+r(2);

naout=nao*(1-Xa);

F(1)=(nao*Xa)/(ra*V)+1;

AH=AHref+Cpj*alfa(1,:)'*(T-Tref); %[1x1]+[1x3]x[3x2]=[1x2]
Q=U*A*(Tw-T);
F(2)=(njo*Cpj')*(T-To)+(AH*(Xa*nao/(-alfa_A)))-Q;






