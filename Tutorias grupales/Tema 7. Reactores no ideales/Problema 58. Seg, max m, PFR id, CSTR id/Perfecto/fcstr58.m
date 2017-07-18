%CSTR ideal
function F=fcstr58(y);
global Cjo alfa k1 k2 tao

Cj=y(1:3); %en este caso si que tenemos un vector fila[1x3]


r(1)=k1*Cj(1)^2;
r(2)=2*k2*Cj(1);

rj=r*alfa;%[1x2]x[2x3]=[1x3]


F(1:3)=Cj-Cjo-rj*tao; %[1x3]-[1x3]-[1x3]*[1x1]=[1x3]

F=F';