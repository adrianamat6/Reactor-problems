%fprob53a

function F=fprob53a(y)
global D L k alfa tm sigma Per Da q

Xa=y(1)

F(1)=1-Xa-(4*q*exp(Per/2))/((1+q)^2*exp(q*Per/2)-(1-q)^2*exp(-q*Per/2));


