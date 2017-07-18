clc
clear all
close all

global alpha section ko E P0 D Tw Cpj DeltaHref U Rg Tref

Qvo = 2;  %m3/min
T0 = 600+273.15; %K
P0 = 300; %kPa
Rg = 8.314 ; %kPa·m3/(kmol·K)
Tref = 298 ; % K

%            A  B    C    D    E    F  G  H
fraccion_0= [0  0.25 0.22 0.52 0.01 0  0  0];

Qv01 = Qvo*1/3; %m3/min
Qv02 = Qvo*2/3; %m3/min

%         A  B  C  D E F G  H
alpha = [ 0  0 -1  1 0 1 0 -1;
          1  0 -1 -1 1 0 0  0;
         -1 -1  0  0 1 0 0  0;
          0  0  1 -1 0 0 0  1;
          0 -1 -1  0 0 0 1  0];
     
ko = [3e9 9e13 7e4 9e13 1e7]; %min kmol 
E = [136000 250000 35000 270000 75000]; %kJ/kmol
DeltaHref=[-141000 -290000 -132000 141000 250000]; %kJ/kmol
Cpj = [35 42 41 55 60 69 75 28]; %kJ/kmol K

Tw1 = 725+273.15; %K
Tw2 = 800+273.15; %K

U1 = 5; %kJ/(min m2 K)
U2 = 3; %kJ/(min m2 K)

L1 = 12; %m
L2 = 10; %m
section = 0.2; %m2
D = 2*(section/pi)^0.5; %m

n0_tot_1 = P0*Qv01/Rg/T0;  %kmol/min
n0_tot_2 = P0*Qv02/Rg/T0;  %kmol/min

nj0_1 = n0_tot_1*fraccion_0;   %kmol/min
nj0_2 = n0_tot_2*fraccion_0;   %kmol/min

y0_1 = [nj0_1 T0];
y0_2 = [nj0_2 T0];
L_range1 = [0 L1];
L_range2 = [0 L2];

%% Resolución del primer reactor

Tw = Tw1;
U = U1;

[L_1, Y1] = ode45(@fprob6, L_range1, y0_1);
n_1= Y1(:,1:8);
T_1 = Y1(:,9);

for i=1:length(L_1)
    Qv_1(i) = sum(n_1(i,:))*Rg*T_1(i)/P0 ; %m3/min
    C_1(i,:) = n_1(i,:)/Qv_1(i) ; % kmol/m3
end
    
    
%% Resolución del segundo reactor

Tw = Tw2;
U = U2;

[L_2, Y2] = ode45(@fprob6, L_range2, y0_2);
n_2= Y2(:,1:8);
T_2 = Y2(:,9);

for i=1:length(L_2)
    Qv_2(i) = sum(n_2(i,:))*Rg*T_2(i)/P0 ; %m3/min
    C_2(i,:) = n_2(i,:)/Qv_2(i) ; % kmol/m3
end
  

%% Mezcla final de corrientes

nsal_1= n_1(end,:);
nsal_2= n_2(end,:);

Tsal_1= T_1(end);
Tsal_2= T_2(end);

Qvsal_1= Qv_1(end);
Qvsal_2= Qv_2(end);

Tfin= 600 + 273.15; %K

Qvsal_1_fin= Qvsal_1*Tfin/Tsal_1; %m3/min
Qvsal_2_fin= Qvsal_2*Tfin/Tsal_2; %m3/min

nfin= nsal_1 + nsal_2; %kmol/min
Qvfin= Qvsal_1 + Qvsal_2;

Cfin= nfin/Qvfin %kmol/m3

%% Gráficas

figure(1)

subplot(1,3,1)
plot(L_1,n_1)
xlabel('L1 (m)');
ylabel('n1_{j} (kmol/min)');
legend('A','B','C','D','E','F','G','H')
grid on

subplot(1,3,2)
plot(L_1,C_1)
xlabel('L1 (m)');
ylabel('C1_{j} (kmol/m3)');
legend('A','B','C','D','E','F','G','H')
grid on

subplot(1,3,3)
plot(L_1,T_1)
xlabel('L1 (m)');
ylabel('T1 (K)');
grid on

figure(2)
title('Segundo reactor')

subplot(1,3,1)
plot(L_2,n_2)
xlabel('L2 (m)');
ylabel('n2_{j} (kmol/min)');
legend('A','B','C','D','E','F','G','H')
grid on

subplot(1,3,2)
plot(L_2,n_2)
xlabel('L2 (m)');
ylabel('C2_{j} (kmol/m3)');
legend('A','B','C','D','E','F','G','H')
grid on

subplot(1,3,3)
plot(L_2,T_2)
xlabel('L2 (m)');
ylabel('T2 (K)');
grid on     