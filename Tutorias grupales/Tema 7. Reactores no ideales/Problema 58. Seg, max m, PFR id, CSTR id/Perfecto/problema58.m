%problema 58
clear all
clc
global Cjo alfa k1 k2 tao
%     A   B  C
Cjo=[2.5  0  0];

%     A   B  C
alfa=[-1  1  0;
      -1  0  0.5];
  
  k1=3; %L/(mol*s)
  k2=0.4;%s^-1
  tao=1;%s
  
  
 %% a) CSTR ideal
 
 yO=[1 1 1];
 Cj_a=fsolve(@fcstr58,yO)
 
 %% b) PFR ideal
 
 trango_b=[0 tao];
 CI_b=Cjo;
 
 [X1 Y1]=ode45(@fpfr58,trango_b,CI_b)
 
 %% c)Segregación completa

 trango_c=[0 tao*10];
 CI_c=[2.5 0 0 0 0 0];
 
 [X2 Y2]=ode45(@fseg58,trango_c,CI_c)
 
 %% d)Micromezcla
 
 trango_d=[10*tao 0];
 CI_d=[0.999999999999 2.5 0 0];
 
 [X3 Y3]=ode45(@fmicro58,trango_d,CI_d)
 
 %% Cb, Rb y Sb
 %CSTR ideal
 Cb_a=Cj_a(2);
 Cao=Cjo(1);
 Ca_a=Cj_a(1);
 
 Rb_a=(Cb_a-0)/( Cao)
 Sb_a=(Cb_a-0)/( Cao-Ca_a)
 
 %PFR ideal
 Cb_b=Y1(end,2);
 Ca_b=Y1(end,1);
 
 Rb_a=(Cb_b-0)/(Cao)
 Sb_a=(Cb_b-0)/(Cao-Ca_b)
 
 %Segregación completa
 Cb_c=Y2(end,5);
 Ca_c=Y2(end,4);
 
 Rb_a=(Cb_c-0)/(Cao)
 Sb_a=(Cb_c-0)/(Cao-Ca_c)
 
 %Micromezcla
 Cb_d=Y3(end,3);
 Ca_d=Y3(end,2);
 
 Rb_a=(Cb_d-0)/(Cao)
 Sb_a=(Cb_d-0)/(Cao-Ca_d)
 
 