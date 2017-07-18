function dydV=rfp19(V,y);
Xa=y(1);
T=y(2);
global Href ACpj Tref Epsilon To Qvo nbin nain Cpa Cpb Cpi niin Cpc;
na=nain*(1-Xa);
nb=nain*(1-Xa);
nc=nain*Xa;
ni=niin;
k=9750*exp(-4000/T); %L/mol s;
H=Href+ ACpj*(T-Tref);
Qv=Qvo.*T./To.*(1+Epsilon.*Xa);

dydV(1)=(Qv.^2/(k.*(1-Xa).*(nbin-nain.*Xa)))^-1;

dydV(2)=-H.*k.*nain*(1-Xa).*nbin*(1-Xa)./(Qv.^2*(na.*Cpa+nb.*Cpb+ni*Cpi+nc.*Cpc));
dydV=dydV';
