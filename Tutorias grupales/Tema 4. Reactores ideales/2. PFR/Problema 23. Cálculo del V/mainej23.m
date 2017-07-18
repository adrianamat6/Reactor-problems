clear all
clc
global nao kod Ead R cao kor Ear href cpn cpiso Tref ni cpi niso
nao=(0.9*163*10^3)/3600; %kmol/h*10^3mol/1kmol*1h/3600s
ni=(0.1*163*10^3)/3600; %kmol/h*10^3mol/1kmol*1h/3600s that's the inert
kod=1.7*10^11/3600; %1/h*1h/3600s
kor=6.9*10^11/3600; %1/h*1h/3600s
R=8.314; %J/(mol*K); J=Pa*m^3
cao=9.3; %mol/L
Ead=65.7*10^3; %J/mol
Ear=72.6*10^3; %J/mol
cpn=141; %(J/(mol*K)
cpiso=141; %(J/(mol*K))
cpi=161; %(J/(mol*K)) that's the inert
niso=0; 
href=-6900; %(J/mol n-butano)
Tref=330; %K
[m,z]=ode45(@ej23,[0 0.65],[0 Tref]);
subplot(2,1,1);
plot(m,z(:,1));
xlabel('conversion')
ylabel('V(L)')
grid
subplot(2,1,2)
plot(m,z(:,2));
xlabel('conversion')
ylabel('T(k)')
grid
%[m,z]=output values, ode 45(call of the funcion,values of the indepedent
%variable, initial values of dependant variables)
V=z(end,1)