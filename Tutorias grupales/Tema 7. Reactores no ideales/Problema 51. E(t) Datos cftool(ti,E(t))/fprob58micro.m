%fprob58micro

function dydt=fprob58micro(t,y)
global ti Ci E  k Cao 
F = y (1);
Xa =y (2);

ra=-k*(Cao^2)*((1-Xa)^2);

E_t=0.02747*exp(-0.02898*t);
dydt(1)=E_t;
dydt(2)=(ra/Cao)+(E_t/(1-F))*Xa;

dydt=dydt'
