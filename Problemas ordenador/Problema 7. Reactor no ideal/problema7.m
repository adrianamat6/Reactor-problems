%problema7
clear all; close all; clc

global alfa Cjo k1 k2 k3  tm
%     A      B       C       D       E
alfa=[-1     -1      1       0       0;
      -1     0       0       1       0;
       0     -1      0       -1      1]; %[3X5]
   
 Cjo=[1       1      0        0      0]; %mol/s
 
 k1=1;
 k2=1;
 k3=1;
 
 tm=1.26;
 %%A)
 %Resolviendo con el modelo de segregación completa.
 t_range=[0 5*tm];
 CI=[Cjo 0 0 0 0 0];
 [t Cj]=ode45(@fproblema7,t_range,CI);
 Cj_seg=Cj(end,[6:10])
 Cj_batch=Cj(end,[1:5])
 
 Cj_SEG=Cj(:,[6:10]);
 
 plot(t,Cj_SEG)
 legend('A', 'B' ,'C', 'D', 'E')
 
 %Resolviendo con el modelo de maxima mezcla.
 t_range2=[5*tm 0];
 CI2=[0.9999 Cjo];
 
 [landa Cjmax]=ode45(@fproblema7max,t_range2,CI2);
 Cj_max=Cjmax(end,[2:6])
 Cj_MAX=Cjmax(:,[2:6]);
 figure(2)
 plot(landa,Cj_MAX)
 
 %%B)
  %Resolviendo con el modelo de segregación completa.
  t_range3=[0 5*tm];
  CI3=[Cjo 0 0 0 0 0];
  [t3 Cj3]=ode45(@fproblema7_B,t_range3,CI3);
  Cj_seg3=Cj(end,[6:10])
 Cj_batch3=Cj(end,[1:5])
 
 figure(3)
 Cj_SEG3=Cj(:,[6:10]);
 subplot(2,2,1)
 Cj_SEG=Cj(:,[6:10]);
 plot(t,Cj_SEG)
 xlabel('Cja (mol/L)')
 ylabel('t (min)')
 legend('A', 'B' ,'C', 'D', 'E')
grid on

 subplot(2,2,2)
 plot(t,Cj_SEG3)
 legend('A', 'B' ,'C', 'D', 'E')
  xlabel('Cjc (mol/L)')
 ylabel('t (min)')
grid on

 %Resolviendo con el modelo de maxima mezcla.
 t_range2=[5*tm 0];
 CI2=[0.9999 Cjo];
 
 [landa4 Cjmax4]=ode45(@fproblema7max4,t_range2,CI2);
 Cj_max4=Cjmax4(end,[2:6])
 Cj_MAX4=Cjmax4(:,[2:6]);
subplot(2,2,1)
 plot(landa4,Cj_MAX4)
  xlabel('Cj4 (mol/L)')
 ylabel('t (min)')
 legend('A', 'B' ,'C', 'D', 'E')
grid on

subplot(2,2,2)
plot(landa,Cj_MAX)
 xlabel('Cj2 (mol/L)')
 ylabel('t (min)')
 legend('A', 'B' ,'C', 'D', 'E')
grid on



