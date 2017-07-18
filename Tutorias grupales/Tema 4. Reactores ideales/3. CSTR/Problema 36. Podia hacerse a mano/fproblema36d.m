%fproblema 36d

function F=fproblema36d(y)
global ko E R Ca Cb nain naout V

nrout=y(1);
T=298.7185;

k=ko.*exp(-E/R/T);
rr=2*k(1)*(Ca^1.5)*(Cb^0.3);
BM=nrout/V;

F=rr-BM;