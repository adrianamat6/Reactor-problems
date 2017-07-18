function dydt=rcta(t,y);
Cj=y(1:3);
T=y(4);
global ER Cpj Href ko Cjin Tref alfa UA tau Ten  ACpj Tw Qv V
k=ko.*exp(-ER./T);
r1=k(1).*Cj(1);
r2=k(2).*Cj(2);
ri=[r1 r2];
H=Href+ ACpj*(T-Tref); %(1x2)
Q=UA*(Tw-T);
dydt(1:3)=(Cjin-Cj')/tau + ri*alfa;
dydt(4)=(Q+Qv*(Cjin*Cpj'*(Ten-T))-V*(ri*H'))/(V*(Cpj*Cj));
dydt=dydt';

