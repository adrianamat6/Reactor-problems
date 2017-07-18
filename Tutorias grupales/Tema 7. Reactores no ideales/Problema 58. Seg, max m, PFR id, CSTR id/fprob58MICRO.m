%fprob58MICRO

function dydt=fprob58MICRO(t,y)
global alfa Cao k1 k2 tao Cjo

F=y(1);
Cj=y(2:4);


E=(t/(tao/2)^2)*exp(-t/(tao/2));
dydt(1)=E;

r1=k1*Cj(1)^2;
r2=2*k2*Cj(1);
ri=[r1 r2];
rj=ri*alfa; %[1x2]x[2x3]=[1x3]

dydt(2:4)=-rj+(Cj'-Cjo)*E/(1-F); %[1x3]+[1x3]-[1x3]=[1x3]

dydt=dydt';