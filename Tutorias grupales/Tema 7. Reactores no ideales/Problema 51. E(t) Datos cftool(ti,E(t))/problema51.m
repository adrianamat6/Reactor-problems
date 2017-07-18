%problema51

clear all; close all;clc
global ti Ci E k Cao Qv
%   1      2      3      4       5        6       7       8      9       10       11      12      13       14 
ti=[0      5     10     15       20      30      40      50      70     100      125      150     175      200   ];
Ci=[112   95.8   82.2   70.6     60.9    45.6    34.5    26.3    15.7   7.67     5.11     2.55    1.73     0.9  ];

E=Ci./trapz(ti,Ci)

k=0.01; %L/(mol*min)
Cao=8;%mol/L
Vteo=1000; %L
Qv=25;%L/min

%%Ajustamos los datos de la E(t) a una función:
%cf=cftool(ti,trapz(ti,E)) ajusto a una exponencial

%%Cálculo del volumen real
tao=trapz(ti,ti.*E);
V=tao*Qv

%%Cálculo conversión con modelo de segregación completa
Xa_batch=1-1./(k.*Cao.*ti+1)

Xa_segreg=trapz(ti,Xa_batch.*E)

%%Cálculo de conversión con modelo de micromezcla

tao=V/Qv;

y0=[5*tao   0]; %rango de landa   F      Xa(landa inf) 
[t Y]=ode45(@fprob58micro,y0,[0.999999999 0]);
Xa_2=Y(end,2)
%%Cálculo de prueba
%                                      F        C(landa inf)
%[Cap Fp]=ode45(@fprob58micropru,y0,[0.999999999 Cao]);

%Ca=Cap(end,1);
%Xa=1-Ca/Cao

%%Cálculo de conversión con modelo de micromezcla con bucle for. 
for i=2 : length(ti);
    F(i)=trapz(ti(:,[1:i]),E(:,[1:i]));
end

for i=length(ti):1
    Xa(i-1)=(k*Cao*(1-Xa(i))/Cao+E(:,i)/(1-F(i))*Xa(i))*(ti(i-1)-ti(i))+Xa(i)
    
end


