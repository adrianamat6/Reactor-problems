%prueba con concentración


function dydt=fprob58micro(t,y)
global ti Ci E  k Cao 
F = y (1);
Ca =y (2);

ra=-k*Ca^2;

E_t=0.02747*exp(-0.02898*t);
dydt(1)=E_t;
dydt(2)=-ra+(Ca-Cao)*(E_t/(1-F));

dydt=dydt';
