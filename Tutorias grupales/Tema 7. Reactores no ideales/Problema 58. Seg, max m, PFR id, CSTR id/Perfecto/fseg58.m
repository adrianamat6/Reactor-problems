% c) modelo de segregación completa

function dydt=fseg58(t,y);
global Cjo alfa k1 k2 tao


Cj_batch=y(1:3);
Cj_seg=y(4:6);

E=(t/((tao/2)^2))*exp(-t/(tao/2));

r(1)=k1*Cj_batch(1)^2;
r(2)=2*k2*Cj_batch(1);

rj=r*alfa;%[1x2]x[2x3]=[1x3]

dydt(1:3)=rj;
dydt(1:6)=Cj_batch*E;

dydt=dydt';