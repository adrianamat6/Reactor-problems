clear all; clc; 

global alfa Cao k1 k2 tao Cjo

alfa=[-1 1 0;
      -1 0 0.5];
  
  
  Cao=2.5; %mol/L
  Cjo=[Cao 0 0];
  k1=3; %L/(mol*s)
  k2=0.4; %s^-1
  tao=1; 
  
  %%a) Resolucion CSTR ideal
  
  y0=[1 1 1];
  Cjout_CSTR=fsolve(@fprob58CSTR,y0)
  
  %%b) Resolución PFR ideal
  tao_range=[0 tao];
  CI=Cjo;
  [TAO Cjout_PFR]=ode45(@fprob58PFR,tao_range,CI)
  Cjout_pfr=Cjout_PFR(end,:)
 %%C) Segregación completa
 
t_range=[0 10*tao];
CI_c=[Cao 0 0 0 0 0];
[t Cj_seg]=ode45(@fprob58SEG,t_range,CI_c);
Cj_SEG=Cj_seg(end,[4:6])


%%d) Micromezcla 

landa_range=[10*tao 0];
CI_d=[0.99999 Cjo]
[landa  Cj_micro]=ode45(@fprob58MICRO,landa_range,CI_d);
Cj_MICRO=Cj_micro(end,[2:4])

%%Rendimiento y selectividad del producto B en los 4 casos anteriores. 

%a) CSTR ideal
Cb_a=Cjout_CSTR(2);
Ca_a=Cjout_CSTR(1);
Rb_a=Cb_a/(Cao)
Sb_a=Cb_a/(Cao-Ca_a)

%b) PFR ideal
Cb_b=Cjout_pfr(2);
Ca_b=Cjout_pfr(1);
Rb_b=Cb_b/(Cao)
Sb_b=Cb_b/(Cao-Ca_b)

%c) Segregación completa
Ca_c=Cj_SEG(1);
Cb_c=Cj_SEG(2);
Rb_c=Cb_c/(Cao)
Sb_c=Cb_c/(Cao-Ca_c)

%d)Micromezcla
Ca_d=Cj_MICRO(1);
Cb_d=Cj_MICRO(2);
Rb_d=Cb_d/(Cao)
Sb_d=Cb_d/(Cao-Ca_d)







