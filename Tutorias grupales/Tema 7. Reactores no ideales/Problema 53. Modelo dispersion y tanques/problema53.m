%problema53
clear all; close all; clc
global D L k alfa tm sigma Per Da q
ti=[0   1    2    3    4    5    6    7    8    9    10    12    14];%min
Ci=[0   1    5    8    10   8    6    4    3    2.2   1.5  0.6    0];%g/min

D=10*10^-2; %m
L=6.36;%m
k=0.25; %min^-1 
alfa=[-1 1];


%C�lculo de la E(t)
E=Ci/(trapz(ti,Ci));

%C�lculo tm y sigma
tm=trapz(ti,ti.*E);
sigma_cuad=trapz(ti,((ti-tm).^2).*E);
sigma=sqrt(sigma_cuad);
%%a) C�lculo del parametro de dispersi�n (Per)
y0=4;
Per=fsolve(@fprob53disp,y0)

Da=k*tm;
q=sqrt(1+4*Da/Per)

y1=0.5;
Xa_disp=fsolve(@fprob53a,y1)

%% b) C�lculo del n�mero de tanques
n=tm^2/sigma^2;
Xatanks=1-1/(1+tm/n*k)^n

%%c) C�lculo de la conversi�n. Modelo de PFR ideal
%realizando un B. molar se llega a la expresi�n de Xa
Xa_PFR=1-exp(-k*tm)

%%d) C�lculo de la conversi�n por modelo de segregaci�n completa
Xa_batch=1-exp(-k.*ti);
Xa_seg=trapz(ti,Xa_batch.*E)

%%e) C�lculo de la conversi�n. Modelo de CSTR ideal
%realizando un B. Molar se llega a la expresi�n de Xa
Xa_CSTR=k*tm/(k*tm+1)

