% d) Modelo de micromezcla
function dCjdtao=fmicro58(t,y);
global Cjo alfa k1 k2 tao
F=y(1);
Cj=y(2:4);
Cj=Cj' %[1x3]
r(1)=k1*Cj(1)^2;
r(2)=2*k2*Cj(1);

rj=r*alfa;%[1x2]x[2x3]=[1x3]



E=(t/((tao/2)^2))*exp(-t/(tao/2));

dCjdtao(1)=E;
dCjdtao(2:4)=-rj+(Cj-Cjo)*E/(1-F); %[1x3]+([1x3]-[1x3])

dCjdtao=dCjdtao';