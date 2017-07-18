function dydL=etano(L,y);
nj=y(1:8);
T=y(9);
P=y(10);
global D vis A a R E ko Href alfa dQdL Tref Cpj MW

k=ko.*exp(-E/(R*T));
Qv=sum(nj)*R*T/P; %m3/s

Cj=nj/Qv;

m=nj'.*MW;


Re=sum(m)*D/A/vis;

f=0.046*Re^(-0.2);



H=Href +Cpj*alfa'*(T-Tref);

r(1)=k(1)*Cj(4);
r(2)=k(2)*Cj(3)*Cj(8);
r(3)=k(3)*Cj(4);
r(4)=k(4)*Cj(5);
r(5)=k(5)*Cj(2)*Cj(1);
r(6)=k(6)*Cj(2)*Cj(3);
r(7)=k(7)*Cj(3)*Cj(4);


dydL(1:8)=A*r*alfa;
dydL(9)=(dQdL-A*(r*H'))/(Cpj*nj);
dydL(10)=(2*f*Qv/D + R/a/P*(dydL(9)*sum(nj)+T*sum(dydL(1:8))))/(R*T/(a*P^2)*sum(nj)-(A^2/(MW*nj)));
dydL=dydL';

