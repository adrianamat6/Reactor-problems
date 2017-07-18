%fproblema6

function y=fproblema6(xa);
h=25000*3; %Kcal/Kmolrxn
M=950; %Kg
nao=10.2; %Kmol
Cp=0.59; %Kcal/(kgmix*K)
T=673.15-1/3*h/Cp/M*nao*(xa-0.10);
k=3*exp(-5000./T+5);
y=1./k/nao.^2./(1-xa).^3;








