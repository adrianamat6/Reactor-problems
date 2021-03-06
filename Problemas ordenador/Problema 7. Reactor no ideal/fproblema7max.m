%fproblema7max

function dydt=fproblema7max(t,y)
global alfa Cjo k1 k2 k3  tm
F=y(1)
Cj=y(2:6)


E=wblpdf(t,1.36,6.2);
dydt(1)=E;

r1=k1*Cj(1)*Cj(2);
r2=k2*Cj(1);
r3=k3*Cj(2)*Cj(4);
ri=[r1 r2 r3]; 
rj=ri*alfa; %[1x3]x[3x5]=[1x5]


dydt(2:6)=-rj+(Cj'-Cjo)*E/(1-F);

dydt=dydt';