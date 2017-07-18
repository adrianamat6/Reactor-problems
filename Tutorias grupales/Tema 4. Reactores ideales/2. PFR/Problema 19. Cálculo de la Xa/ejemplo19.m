clear all;clc;
global Tref Href nain nbin niin Cpa Cpb Cpc Cpi alfa Qvo Epsilon To ACpj;
alfa=[-1 -1 1 0];
Tref=298;%K;
Href=50*10^3; %J/mol;
nain=16;
nbin=16;
niin=8;
Cpa=75; %J/mol K
Cpb=75;
Cpc=150;
Cpi=10;
ACpj=alfa(4)*Cpi+alfa(3)*Cpc+alfa(2)*Cpb+alfa(1)*Cpa;
Po=2 ;%atm
To=700+273;
notot=nain+nbin+niin;
R=0.082;
Epsilon=nain/notot*(sum(alfa)/-alfa(1));
Qvo=R*To*notot/Po;
[x,y]=ode45(@rfp19,[0,1500],[0 973]); %el primer valor corresponde a Xa y el segundo a la Tentrada(K)
subplot(2,1,1);
plot(x,y(:,1));
xlabel('V (L)')
ylabel('Xa')
grid on
subplot(2,1,2);
plot(x,y(:,2));
xlabel('V (L)')
ylabel('T (K)')
grid on

Xa=y(end,1)


