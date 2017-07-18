%fprob53disp

function F=fprob53disp(y)
global D L k alfa tm sigma

Per=y(1)

F(1)=(sigma^2/tm^2)-(2/Per)+(2/Per^2)*(1-exp(-Per));
