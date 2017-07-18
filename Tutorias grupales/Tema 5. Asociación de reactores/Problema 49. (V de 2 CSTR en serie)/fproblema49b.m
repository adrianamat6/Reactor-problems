%fproblema49b

function F=fproblema49b(y)
global alfa Qv Talim Cao nao kod koinv Ead Eai AH Cp R Xaout
V=y(1)
Tout=y(2)

k1=kod*exp(-Ead/R/Tout);
k2=koinv*exp(-Eai/R/Tout);

Caout=Cao*(1-Xaout);
Cbout=Cao*(1/2)*Xaout;
Ccout=Cao*(1/2)*Xaout;

r1=k1*Caout^2;
r2=k2*Cbout*Ccout;

ra=-2*r1+2*r2;

%Ec 1. BM CSTR
tao=V/Qv;
F(1)=ra-(Caout-Cao)/tao;

%Ec 2. BE CSTR
F(2)=nao*Cp*(Tout-Talim)+AH*Xaout*nao/(-alfa(1));

F=F'