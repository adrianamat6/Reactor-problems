%problema33
clear all
close all
clc
global alfa alfa_A V U A Tw Cpj hj AHref Tref ko E R nao njo no P To

%     A     B     C
alfa=[-1   -1     2;   %1
       1    1    -2 ]; %2
   
alfa_A=alfa(1,1);

V=1.6; %m`3
U=10; %J/(m^2*s*K)
A=2; %m^2
Tw=17+273.15; %K

%     A     B     C
Cpj=[ 25   15    20];
hj=[-40000 -30000 -45000];
AHref=hj*alfa(1,:)';%[1x3]x[3x1]=[1x1]  solo se tiene en cuenta la primera reacción
Tref=25+273.15; 

ko=[1.45*10^7     1.85*10^6]; %m^3/(mol*s)
E=[ 70000         90000]; %J/mol?
R=8.31; %J/mol/K

nao=20;%mol/s
%    A  B  C
njo=[20 20 0];   
no=sum(njo);
P=580500;%Pa
To=77+273.15; %K

%%Resolución problema

yO=[0.85 750];
Sol=fsolve(@fproblema33,yO);
Xa=Sol(1)
T=Sol(2)

%%Cálculo del calor generado 

syms T Xa
Qvo=no*R*To/P;
Qvf=@(T) Qvo*T/To
Xa= solve(-ko(1)*exp(-E(1)/R/T)*njo(1)*(1-Xa)/Qvf(T)*(njo(2)+njo(1)*alfa(1,2)/-alfa(1,1)*Xa)/Qvf(T)+ko(2)*exp(-E(2)/R/T)*((njo(3)+njo(1)*alfa(1,3)/-alfa(1,1)*Xa)/Qvf(T))^2==-njo(1)*Xa/V',Xa);
Xa=matlabFunction(Xa);
Xa=@(T) min(Xa(T));

AH=AHref+Cpj*alfa(1,:)'*(T-Tref); %[1x1]+[1x3]x[3x2]=[1x2]
G=@(T) -AH*njo(1)/-alfa(1,1)*Xa(T);
fplot(@(T) G(T),[To 1000])
Toptima=fminsearch(@(T) -G(T),To)
Xa=Xa(Toptima)
% G(T) y R(T) deben ser iguales, por lo que puedo despejar el valor de Q
% del balance energía y de ahí obtener el valor del área
Q=@(T) -G(T)+(T-To)*(no*Cpj');
A=@(T) Q(T)/(U*(Tw-T));
A=A(Toptima)















