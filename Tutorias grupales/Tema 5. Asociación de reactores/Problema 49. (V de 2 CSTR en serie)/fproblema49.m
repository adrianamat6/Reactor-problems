%fproblema49

function F=fproblema49(y)
global alfa Qv Talim Cao nao kod koinv Ead Eai AH Cp R Xaout

Xa1=y(1)
T1=y(2)
V=y(3)
Tout=y(4)


%Ec 1: BM (CSTR 1)

k11=kod*exp(-Ead/R/T1);
k21=koinv*exp(-Eai/R/T1);

Ca1=Cao*(1-Xa1);
Cb1=nao*(1/2)*Xa1/Qv;
Cc1=nao*(1/2)*Xa1/Qv;

r11=-2*k11*Ca1^2+2*k21*Cb1*Cc1;

tao=V/Qv;
F(1)=r11-(Ca1-Cao)/tao;

%Ec 2 BE (CSTR 1)


F(2)=nao*Cp*(T1-Talim)+AH*Xa1*nao/(-alfa(1));

%Ec 3 BM   (CSTR 2)

k21=kod*exp(-Ead/R/Tout);
k22=koinv*exp(-Eai/R/Tout);

Caout=Cao*(1-Xaout);
Cbout=nao*(1/2)*Xaout/Qv;
Ccout=nao*(1/2)*Xaout/Qv;

r21=-2*k21*Caout^2+2*k22*Cbout*Ccout;

F(3)=r21-(Caout-Ca1)/tao;

%Ec 4  BE (CSTR 2)

na1=Ca1*Qv;
nb1=Cb1*Qv;
nc1=Cc1*Qv;
nj=[na1 nb1 nc1];
F(4)=sum(nj.*Cp)*(Tout-T1)+AH*Xa1*nao/(-alfa(1));


F=F';

