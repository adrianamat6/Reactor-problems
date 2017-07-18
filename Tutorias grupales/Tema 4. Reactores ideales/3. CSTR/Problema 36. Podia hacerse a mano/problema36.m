%problema36
clear all
close all
clc

global ko E R Ca Cb nain naout V alfa njin Cpj AHref Tref e Tout Tin
ko=[3.7*10^7    10^7];
E=[49000 50000]; 
R=8.31; %J/mol/K
Ca=1.5; %mol/L
Cb=7.25; %mol/L
nain=1000; %mol/min
naout=150; %mol/min
V=385; %L
%     A    B   R    S    I
alfa=[-2  -3   2    0    0; 
      -2  -3   0    2    0];
  
%     A        B      R    S    I
njin=[nain    2000    0    0  3050 ];
Cpj=[15       11     12    14  1*18]*4.18;
  
 AHref=[-3765  -3855]*2;%fijate en las unidades J/molA-> J/molunitario
 Tref=25+273.15;
 e=[126.825   298.175];%grado avance
 Tout=298.7185;
Tin=30+273.15;
%%Resolución problema c)

Tinicial=30+273.15;
T=fsolve(@fproblema36,Tinicial)

%%Resolución problema d)
nrinicial=0;
nr_out=fsolve(@fproblema36d,nrinicial)
Cr_out=nr_out/100

%%Resolución problema d2)
nsinicial=0;
ns_out=fsolve(@fproblema36d2,nsinicial)
Cs_out=ns_out/100

%%Resolución problema f)
Qinicial=0;
Q=fsolve(@fproblema36f,Qinicial)



