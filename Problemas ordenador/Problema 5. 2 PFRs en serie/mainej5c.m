clear all
clc
%S+W->G+F
%S+W->2U
global A aij cpj href Tref Qvr1 Tin U Rtubo Tw 
% S W G F U Importante este orden
cpj=[62 75.2 80 80 80]; %KJ/(Kmol*K)[1x5]
href=[-11000 -12000]; %Kj/Kmol [1x2]
Tref=25+273.15; %K
aij=[-1 -1 1 1 0;-1 -1 0 0 2]; %[2x5]
A=0.1; %m^2 sección transversal de ambos reactores
U=1000; %J/(s*m^2*K)
Tw=30+273.15; %Temperatura refrigerante K
Rtubo=sqrt(A/pi); %m obtenido a partir dem la seccion tranversal
%como la densidad es constante el caudal es constante
Qvr1=200*10^-3/60; %Qv=[m^3/s]=[L/min*1m^3/10^3L*1min/60s)[S W G F U]  caudal volumetrico que entra al reactor 1
A1=0.1; %m^2 for reactor 1
A2=0.1; %m^2 for reactor 2
cjo=[2 16.56 0.1 0 0]*1000; %mol/m^3 (originalmente en mol/L)
Tin=50+273.15; %K Temperatura alimento
L1=1.52; %m
L2=0.78+L1; %m 
[X,Y]=ode45(@ej5c,[0 L1],[cjo Tin])
cjo2=Y(end,[1:5]);%concentraciones tras la reaccion
Qvr1a=Qvr1; %Esto es el Qvr1 de antes
Qvr1=300*10^-3/60; %Qv=[m^3/s]=[L/min*1m^3/10^3L*1min/60s)[S W G F U]
Qvpurga=100*10^-3/60; %es lo que sale del reactor despues de la purga
cjent=(Qvpurga*cjo2+Qvr1a*cjo)/Qvr1; %es la aplicación de un balance de materia
[X1,Y1]=ode45(@ej5c,[L1 L2],[cjent Tin]);
m=[X;X1]
j=[Y;Y1]
subplot(2,2,1)
plot(m,j(:,[1:5]))
xlabel('L Tubo (m)')
ylabel('Cj (mol/m3')
legend('Sacarosa','Agua','Glucosa','Fructosa','Indeseables')
grid
subplot(2,2,2)
xlabel('L Tubo (m)')
ylabel('T (K)')
plot(m,j(:,6))
grid
