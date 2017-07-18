clear all; clc; close all;
global ER Cpj Href ko Cjin Tref alfa tau Ten Tw ACpj Qv V UA
njo=[900 100 0];%mol/min
alfa=[-1 1 0;0 -1 1];
dj=[0.8590 0.9941 1.0360]; %g/cm3
PMj=[58.08 48.02 76.11]; %g/mol
Cpj=[1130 1050 1410]; %J/mol K
Href=[-210000 -190000]; %J/mol
Tref=293; %K
ACpj=Cpj*alfa'; %2x1
ko=[8.5*10^10 2*10^21]; %/min
ER=[9250 21000];%(K)
Qv=10^-6*sum(njo.*PMj./dj); %m3/min
Cjin=njo./Qv; %mol/m3
V=1.56;
UA=1.3*10^6;
Ts=13.87+273;
Ten=12.5+273;
Tw=10+273;
tau=V/Qv;
[x,y]=ode45(@rcta,[0 300],[13430 1796 0 Ts]); %estado 1
subplot(1,2,1);
plot(x,y(:,[1:3]));
grid;
subplot(1,2,2)
plot(x,y(:,4));
grid;



