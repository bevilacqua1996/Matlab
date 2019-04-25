%==============================================================
% EXEMPLO 1: MANIPULADOR RRR 3D ESTÁTICO (SOMENTE UMA POSIÇÃO)
%==============================================================
function Tipos_Comuns_RRR(j1_value, j2_value, j3_value, a1_value, a2_value, a3_value, q1_value, q2_value, q3_value, t1_value, t2_value, t3_value) 

close all; clc;

%Caixa que permite definir o tipo de junta
%Usuário inserir graus de liberdade
%Fazer modelo das configurações mais comuns com controle de ângulo e
%comprimento
%


%Comprimento das juntas

%j1 = input('comprimento do 1° elo: ');
%j2 = input('comprimento do 2° elo: ');
%j3 = input('comprimento do 3° elo: ');
j1 = j1_value;
j2 = j2_value;
j3 = j3_value;

%lim = (j2+j3);
% Ângulo entre os eixos z

%a1 = input('angulo entre o 1° e 2° elo: ');
%a2 = input('angulo entre o 2° e 3° elo: ');
%a3 = input('angulo entre o 3° e 4° elo: ');
a1 = a1_value;
a2 = a2_value;
a3 = a3_value;

% Ângulo da junta rotativa

%q1 = input('angulo da junta 1: ');
%q2 = input('angulo da junta 2: ');
%q3 = input('angulo da junta 3: ');
q1 = q1_value;
q2 = q2_value;
q3 = q3_value;

%Ângulo entre os eixos x
t1 = t1_value;
t2 = t2_value;
t3 = t3_value;
% Parâmetros de DH
a     = [0 j2 j3];
alpha = [ a1  a2 a3]*pi/180;
d     = [ j1  0 0];
theta = [t1+q1 t2-q2 t3-q3]*pi/180 ;


Plot3n(a,alpha,d,theta);