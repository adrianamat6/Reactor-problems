clear all
clc
%% Exercise 53.  Data. Instead of fzero fsolve can be used. 
% A -> B 
% liquid phase
D=0.1; %m
L=6.36; %m
V=pi()*D*L;% m^3
k=0.25; %min^-1
t=[0 1 2 3 4 5 6 7 8 9 10 12 14]; % min
C=[0 1 5 8 10 8 6 4 3 2.2 1.5 0.6 0]; %g/m^3
E= C/trapz(t,C); 
f=t.*E;
tm=trapz(t,f); %min
%varianza
sigma_square=trapz(t,(t-tm).^2.*E);
sigma=sqrt(sigma_square);
% Cumulative distribution function
F=cumtrapz(t,E);
%Pe=7.68
%% a) Dispersion model
Pe1=fzero(@(Pe) sigma^2/tm^2-(2/Pe-2/Pe^2*(1-exp(-Pe))),0.1)
% Número de Damkho
Da=k*tm;
q=sqrt(1+4*Da/Pe1);
% f=fsolve(@(Xa) 4*q*exp(Pe1/2)/((1+q)^2*exp(q*Pe1/2)-(1-q)^2*exp(-q*Pe1/2)),0.6)
% Xa=1-f
Xas=fzero(@(Xa) 1-Xa-(4*q*exp(Pe1/2))/((1+q)^2*exp(q*Pe1/2)-(1-q)^2*exp(-q*Pe1/2)),0.5)
%Suggestion, at the end compare the conversion obtained for each model
%Use fsolve if the sulution is not for exactly zero
%% b) Tanks in series model
% First of all it is necessary calculate how many tanks do we approach
n=tm^2/sigma^2
% As we obtain a number of reactors that it is not an integer, it's
% necessary to do an interpolation but in this case coz it is a first order
% rxn we can just use the equation for one reactor.
% It's interesting to realize that coz we have discrete data it is not
% necessary to calculate E(t) as it's seen in the equation of tanks in
% series model

Xatanks=1-1/(1+tm/n*k)^n

%% c) Ideal PFR model
%It's deduction comes from a mole balance I have realized
XaPFR=1-1/exp(k*tm)

%% d) Complete segregation model
% I have done a mole balance for batch
Xabatch=1-1./exp(t*k);
Xaseg=trapz(t,Xabatch.*E)


%% e) Ideal CSTR Model
% it comes from a mole balance I preoviously done. try to automatize from
% the original equation.
XaCSTR=(k*tm)/(k*tm+1)