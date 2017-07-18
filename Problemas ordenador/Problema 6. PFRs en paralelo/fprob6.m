function dDEPdL = fprob6(L,y)

global alpha section ko E P0 D Tw Cpj DeltaHref U Rg Tref

nj = y(1:8);   % 8x1, kmol/min
T = y(9);       %K

ntot = sum(nj); %kmol/min
Qv = ntot*Rg*T/P0; %m3/min

Cj = nj/Qv; %8x1, kmol/min

k= ko.*exp(-E/Rg/T); %%min kmol

ri(1)= k(1)*Cj(3)*Cj(8); %kmol/m3 min
ri(2)= k(2)*Cj(3)*Cj(4); %kmol/m3 min
ri(3)= k(3)*Cj(1)*Cj(2); %kmol/m3 min
ri(4)= k(4)*Cj(4);       %kmol/m3 min    
ri(5)= k(5)*Cj(2)*Cj(3); %kmol/m3 min

rj = ri*alpha; %kmol/m3·min  (1x8)
 
dnjdL = section * rj; %kmol/min/m  (1x8)

dQdL = U*D*pi*(Tw-T);  %kJ/min/m
DeltaCp = alpha*Cpj'; %kJ/kmol/K
DeltaH = DeltaHref + DeltaCp'*(T-Tref);  %kJ/kmol
dTdL = (dQdL-section*ri*DeltaH')/(Cpj*nj);  %K/m

dDEPdL = [dnjdL dTdL];
dDEPdL = dDEPdL';

end

