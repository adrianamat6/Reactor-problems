%fprob58SEG

function dCjdt=fprob58SEG(t,y)
global alfa Cao k1 k2 tao Cjo
Cj_batch=y(1:3);
Cj_seg=y(4:6);


r1=k1*Cj_batch(1)^2;
r2=2*k2*Cj_batch(1);
ri=[r1 r2];
rj=ri*alfa; %[1x2]x[2x3]=[1x3]

dCjdt(1:3)=rj;

E=(t/(tao/2)^2)*exp(-t/(tao/2));
dCjdt(4:6)=Cj_batch*E; 

dCjdt=dCjdt';