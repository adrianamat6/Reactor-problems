%fproblema 36

function F=fproblema36(y)
global ko E R Ca Cb nain naout V
T=y(1)

k=ko.*exp(-E/R/T);
ra=-2*k(1)*(Ca^1.5)*(Cb^0.3)-2*k(2)*(Ca^0.5)*(Cb^1.8);
BM=(naout-nain)/V;

F=ra-BM;