%fproblema36f

function F=fproblema36f(y)
global ko E R Ca Cb nain naout V alfa njin Cpj AHref Tref e Tout Tin

Q=y(1);


ACpj=Cpj*alfa'; %[1x5]x[5x2]=[1x2]
AH=AHref+ACpj*(Tout-Tref);

F=(njin*Cpj')*(Tout-Tin)+AH*e'+Q;
