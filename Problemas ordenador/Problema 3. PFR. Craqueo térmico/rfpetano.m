clear all;clc;close all;
%ORDEN CH4-C2H2-C2H4-C2H6-C3H6-C3H8-C4H6-H2

global ko E Cpj Href alfa dQdL R Pen Tref A MW vis D a

M=0.020919*10^3;%mol/s

MW=[16 26 28 30 42 44 54 2]*10^-3; %kg/mol

xi=[0 0 0.01 0.982 0.008 0 0 0];

ni=xi.*M; % condicones iniciales

Pen=3*10^5; %Pa;
Ten=680+273; %K
alfa=[0 0 1 -1 0 0 0 1;
      0 0 -1 1 0 0 0 -1;
      1 0 0 -2 0 1 0 0;
      1 1 0 0 -1 0 0 0;
      -1 -1 0 0 1 0 0 0;
      0 -1 -1 0 0 0 1 0;
      1 0 -1 -1 1 0 0 0]; %7x8
  
Cpj=[34.3 42.4 40.8 49.4 59.6 68 73.5 28.8]; %J/mol

E=[273020 136870 273190 154580 29480 172750 253010]; %J/mol

Href=[136300 -136300 -11400 133900 -133900 -170800 -23100]; %J/mol

ko=[4.65*10^13 8.75*10^8*10^-3 3.85*10^11 9.81*10^8 5.87*10^4*10^-3 1.03*10^12*10^-3 7.08*10^13*10^-3]; %m3/mol s

Radio=0.108/2; %m

D=0.108;

dQdL=80*2*pi()*Radio*10^3; %J/m s

Tref=298;

R=8.314;

A=pi()*Radio^2;

a=0.96;

vis=10^-5; %Pa.s

[x,y]=ode45(@etano,[0 100],[ni,Ten,Pen]);

for i=1: length(x);
    Qv(i)=sum(y(i,[1:8]))*R*y(i,9)/y(i,10);
    Cj(i,:)=y(i,[1:8])/Qv(i);
end
subplot(1,2,1);
plot(x,y(:,[1:8]));
subplot(1,2,2);
plot(x,y(:,9));
figure(2);
subplot(1,2,1);
plot(x,y(:,10));
subplot(1,2,2);
plot(x,Cj);


