%PFR ideal
function dydtao=fpfr58(tao,y);
global Cjo alfa k1 k2 

CA=y(1);
CB=y(2);
CC=y(3);


r(1)=k1*CA^2;
r(2)=2*k2*CA;

rj=r*alfa;%[1x2]x[2x3]=[1x3]

dydtao(1:3)=rj;

dydtao=dydtao';