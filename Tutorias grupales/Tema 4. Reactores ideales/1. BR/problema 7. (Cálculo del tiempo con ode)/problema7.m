%main problema 7

clear all
clc

%mainproblema2
%%datos del problema
clear all
clc
global Nj alfa To P Tref AH_ Cpj R Nto E Nao

%   A B C D  I
Nj=[4 4 0 0 4.5]; %mol

%      A  B  C  D  I 
alfa=[-1 -1  2  1  0];

To=200+273; %K

P=1%atm

Tref=20+273; %K

AH_=-12500*2; %J/mol unitario

Cpj=[10 15 15 12 20]; %J/mol/K

R=0.082; %atm/molK

Nto=sum(Nj);

E=(Nj(1)/Nto)*(sum(alfa)/(-alfa(1)));

Nao=Nj(1);

%%resolución del problema

Xa_rango= [0 0.9];
%  t   T
CI=[0   To];

[XA Y]=ode45(@fproblema7,Xa_rango,CI);

%XA variable independiente
t=Y(:,1);
T=Y(:,2);

figure(1)
subplot(1,2,1)
plot(XA,t)
xlabel('conversión Xa')
ylabel('tiempo (h)')
grid on

subplot(1,2,2)
plot(XA,T)
xlabel('conversión Xa')
ylabel('temperatura T (K) ')
grid on


t=Y(end,1)







