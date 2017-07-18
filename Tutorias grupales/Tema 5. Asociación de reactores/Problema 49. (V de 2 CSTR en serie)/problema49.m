%main problema 49
clear all; close all; clc

global alfa Qv Talim Cao nao kod koinv Ead Eai AH Cp R Xaout
alfa=[-2 1 1]; %solo pongo la de la reacción directa, la otra me hará falta solo en la ecuación cinética.

Qv=2.8; %m^3/h
Talim=38+273.15; %K
Cao=24; %kmol/m^3
nao=Cao*Qv; %kmol/h

kod=39363; %m^3/kmolh
koinv=0.204; %m^3/kmolh
Ead=32281; %kJ/kmol
Eai=8850; %kJ/kmol
AH=-8000; %kJ/kmol
Cp=251; %kJ/kmolK

R=8.31; %kJ/kmolK

Xaout=0.8;

%%Resolución problema si V(CSTR1)=V(CSTR2)


%      Xa1 T1 V Tout
yO=[0 Talim 2  500];
Sol_a=fsolve(@fproblema49,yO)

%%Resolución problema si solo nos hiciera falta un solo CSTR.
%     v  T
y0_b=[3 500];
Sol_b=fsolve(@fproblema49b,y0_b)



