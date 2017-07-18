%fprob58CSTR

function F=fprob58CSTR(y)
global alfa Cao k1 k2 tao Cjo

Cjout=y(1:3);

r1=k1*Cjout(1)^2;
r2=2*k2*Cjout(1);
ri=[r1 r2];
rj=ri*alfa; %[1x2]x[2x3]=[1x3]

F(1:3)=(Cjout-Cjo)/tao-rj;
F=F';
