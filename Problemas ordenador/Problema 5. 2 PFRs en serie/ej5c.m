function dydl=ej5c(l,y);
%Para el primer reactor 5 balances balances molares y uno de energía
global A aij cpj href Tref Qvr1 Tin U Rtubo Tw
cj=y(1:5); %vector columna por defecto de la funcion [4x1]
cj=cj'; % lo quiero como un vector fila [1x4]
T=y(6);
k1=3.5436*10^18*exp(-1.5071*10^4./T); %s^-1
k2=exp(-5.64-220./T); %s^-1
ri=[k1*cj(1) k2*cj(1)] %[1x2] orden 1
hi=href+(T-Tref)*(cpj*aij'); %[1x2]=[1x1]*[1x5]*[2x5]'=[1x1]*[1x2]=[1x2]%J/mol
dQdl=U*2*pi*Rtubo*(Tw-T);
dydl(1:5)=A*(ri*aij)/Qvr1
dydl(6)=(dQdl-A*ri*hi')/(Qvr1*cj*cpj')
dydl=dydl'
