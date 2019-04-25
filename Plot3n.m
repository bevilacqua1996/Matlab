function Plot3n(a,alpha,d,theta)
% Transformações homogêneas entre pares de sistemas de referência
TH01 = DH(a(1), alpha(1), d(1), theta(1));
TH12 = DH(a(2), alpha(2), d(2), theta(2));
TH23 = DH(a(3), alpha(3), d(3), theta(3));
% Transformação homogêna do efetuador à base
TH02 = TH01 * TH12;
TH03 = TH02 * TH23;

% Coordenadas dos sistemas de referência
coord(1,:) = [0 0 0];
coord(2,:) = TH01(1:3,4)';
coord(3,:) = TH02(1:3,4)';
coord(4,:) = TH03(1:3,4)';

figure(1);
%trava a figura, eixos iguais, delimita borda, adiciona linhas grid
hold on;axis equal;box on;grid on ;
%plota em 3D elos e juntas(b- indica blue continua e bo indica blue ponto)
for i = 1 : length(a)
    plot3(coord(i:i+1,1),coord(i:i+1,2),coord(i:i+1,3), 'b-', 'LineWidth', 6);
    plot3(coord(i,1),coord(i,2), coord(i,3),'bo','MarkerSize',15,'MarkerFaceColor',[0 0 1]);
end

%plotar setas x,y,z no efetuador

plotSeta(coord,a);

  view(45,45);
  % Exibe as coordenadas do efetuador 
text(0,0,0,strcat('X = ',num2str(coord(4,1)),'; Y = ', num2str(coord(4,2)),'; Z= ',num2str(coord(4,3))), 'FontSize',12);
hold off;


function plotSeta(coord,a)
%eixo Z - na mesma direção do elo ligado ao efetuador
g=1;
X1=[coord(4,1) coord(3,1)+((coord(4,1)-coord(3,1))*(a(3)+g)/a(3))];
Y1=[coord(4,2) coord(3,2)+((coord(4,2)-coord(3,2))*(a(3)+g)/a(3))];
Z1=[coord(4,3) coord(3,3)+((coord(4,3)-coord(3,3))*(a(3)+g)/a(3))];
V1=[X1(2)-X1(1) Y1(2)-Y1(1) Z1(2)-Z1(1)]; 

%eixo X - usando produto escalar, descobre qual vetor é ortogonal ao eixo
%Z,e tem módulo igual a g
%conta pra caralho se liga

aa=0;
m1=V1(3)^2+V1(2)^2;
m2=2*aa*V1(1)*V1(2);
m3=(aa*V1(1))^2-V1(3)^2*(g^2-aa^2);
ab1= -m2+sqrt(m2^2-4*m1*m3)/(2*m1);
ac1=(-aa*V1(1)-ab1*(V1(2)))/V1(3);
V2 = [aa ab1 ac1];

X2=[coord(4,1) coord(4,1)+V2(1)];
Y2=[coord(4,2) coord(4,2)+V2(2)];
Z2=[coord(4,3) coord(4,3)+V2(3)];
%eixo Y - por produto vetorial, encontra o vetor ortogonal a Z e X

V3 = [ V1(2)*V2(3)-V1(3)*V2(2) V1(3)*V2(1)-V1(1)*V2(3) V1(1)*V2(2)-V1(2)*V2(1)];
X3=[coord(4,1) coord(4,1)+V3(1)];
Y3=[coord(4,2) coord(4,2)+V3(2)];
Z3=[coord(4,3) coord(4,3)+V3(3)];

plot3(X1,Y1,Z1,'r-','LineWidth',1);
plot3(X2,Y2,Z2,'g-','LineWidth',1);
plot3(X3,Y3,Z3,'b-','LineWidth',1);

