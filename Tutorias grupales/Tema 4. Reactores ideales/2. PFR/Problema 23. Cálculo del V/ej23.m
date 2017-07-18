function dydXa=ej23(Xa,y)
global nao kod Ead R cao kor Ear href cpn cpiso Tref ni cpi niso
V=y(1);
T=y(2);
%function 'name'=nameofthescrip(arguments=(independent variable,vector of
%dependant variables))
%in this script are written all the functions that change with a variable defined here
dydXa(1)=nao/((kod*exp(-Ead/R./T))*cao*(1-Xa)-(kor*exp(-Ear/R./T)*cao*Xa));
dydXa(2)=(-(href)*nao)/(nao*cpn+ni*cpi+niso*cpiso);
dydXa=dydXa';
