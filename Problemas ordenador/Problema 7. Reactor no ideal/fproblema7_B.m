%fproblema7

function dCjdt=fproblema7_B(t,y)
global alfa Cjo k1 k2 k3 

Cjbatch=y(1:5)
Cj=y(6:10)


r1=k1*Cjbatch(1)*Cjbatch(2);
r2=k2*Cjbatch(1);
r3=k3*Cjbatch(2)*Cjbatch(4);
ri=[r1 r2 r3]; 
rj=ri*alfa; %[1x3]x[3x5]=[1x5]

dCjdt(1:5)=rj;

E=0.8258*normpdf(t,0.082,0.5)+0.2064*lognpdf(t,log(2.52),0.12);
dCjdt(6:10)=Cjbatch*E;

dCjdt=dCjdt';