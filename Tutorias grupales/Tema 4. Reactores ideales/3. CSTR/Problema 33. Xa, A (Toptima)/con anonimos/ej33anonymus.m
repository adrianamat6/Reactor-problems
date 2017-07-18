global k10 E1 R nji Qvf aij k20 E2 V Qv Tin
Tin=77+273.15;%K
Tw=17+273.15;%K
nji=[20 20 0];  % 1x3 mol
Cpj=[25 15 20]; % 1x3 J/(mol*K)
aij=[-1 -1 2; 1 1 -2]; %2x3 
hj=[-40000 -30000 -45000]; %1x3 J/mol
k10=1.45*10^7; %m^3/mol
k20=1.85*10^6; %m^3/mol
R=8.314472; %J/(mol*K)
P=580500; %Pa
Qv=sum(nji,2)*R*Tin/P; %m^3
Qvf=@(T) Qv*T/Tin
%The expansion factor is constant so Qv it is also constant so it doesn't
%depend of Temperature
na=@(Xa) nji(1)*(1-Xa); %moles finales de A
nb=@(Xa) nji(2)+nji(1)*aij(1,2)/-aij(1,1)*Xa; %moles finales de b
nc=@(Xa) nji(3)+nji(1)*aij(1,3)/-aij(1,1)*Xa; %moles finales de c
ca=@(Xa,T) na(Xa)/Qvf(T); %mol/m^3
cb=@(Xa,T) nb(Xa)/Qvf(T); %mol/m^3
cc=@(Xa,T) nc(Xa)/Qvf(T); %mol/m^3
E1=70000; %J/mol
E2=90000; %J/molcc
r1=@(Xa,T) k10*exp(-E1/R/T)*ca(Xa,T)*cb(Xa,T); %mol/(m^3*s)
r2=@(Xa,T) k20*exp(-E2/R/T)*cc(Xa,T)^2; %mol/(m^3*s)
ra=@(Xa,T) aij(1,1)*r1(Xa,T)+aij(2,1)*r2(Xa,T); %mol/(m^3*s)
U=10; %J(m2*s*K)f
A=2; %m^2
V=1.6; %m3
Q=@(T) U*A*(Tw-T); %J/(s*m^2)
Hi=(aij(1,:)*hj'); %J(mol) 1x1
f1=@(T,Xa) (T-Tin)*(nji*Cpj')-Q(T)+Hi*nji(1)/-aij(1,1)*Xa; %balance de energía
f2=@(T,Xa) Xa*nji(1)/V/ra(Xa,T)+1; %mole balance-kinetics
%both functions are equalized to zero
%x es un vector que incluye T y Xa
[s,l]=fsolve(@(x) [f1(x(1),x(2));f2(x(1),x(2))],[750;0.850])
f1sol=f1(s(1),s(2));
f2sol=f2(s(1),s(2));
f1teo=f1(772.6,0.8690);
f2teo=f2(772.6,0.8690);
%Ahora voy a representar el balance de energía para R(T) y G(T) también
%hallaré la solución 
Xa=s(2)
T=s(1)
%Si lo hiciera así apartir de aquí ya tendría definida una variable y es
%como si trabajara en función de una sóla
syms T Xa
Xa= solve(-k10*exp(-E1/R/T)*nji(1)*(1-Xa)/Qvf(T)*(nji(2)+nji(1)*aij(1,2)/-aij(1,1)*Xa)/Qvf(T)+k20*exp(-E2/R/T)*((nji(3)+nji(1)*aij(1,3)/-aij(1,1)*Xa)/Qvf(T))^2==-nji(1)*Xa/V',Xa);
Xa=matlabFunction(Xa);
Xa=@(T) min(Xa(T));
G=@(T) -Hi*nji(1)/-aij(1,1)*Xa(T);
fplot(@(T) G(T),[Tin 1000])
ylabel('G(T)')
xlabel('T (K)')
grid on
Toptima=fminsearch(@(T) -G(T),Tin)
Xa=Xa(Toptima)
% G(T) y R(T) deben ser iguales, por lo que puedo despejar el valor de Q
% del balance energía y de ahí obtener el valor del área
Q=@(T) -G(T)+(T-Tin)*(nji*Cpj');
A=@(T) Q(T)/(U*(Tw-T));
A=A(Toptima)