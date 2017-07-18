%fproblema36d2
function F=fproblema36d2(y)
global ko E R Ca Cb nain naout V

nsout=y(1);
T=298.7185;

k=ko.*exp(-E/R/T);
rs=2*k(2)*(Ca^0.5)*(Cb^1.8);
BM=nsout/V;

F=rs-BM;