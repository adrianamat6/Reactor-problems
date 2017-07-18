%fprob58PFR

function dCjdtao=fprob58PFR(tao,y)
global alfa Cao k1 k2 tao Cjo

Cjout=y(1:3);

r1=k1*Cjout(1)^2;
r2=2*k2*Cjout(1);
ri=[r1 r2];
rj=ri*alfa; %[1x2]x[2x3]=[1x3]

dCjdtao(1:3)=rj;

dCjdtao=dCjdtao';