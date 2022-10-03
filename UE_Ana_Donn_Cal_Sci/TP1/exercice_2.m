clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
figure('Name','Separation des canaux RVB','Position',[0,0,0.67*L,0.67*H]);
figure('Name','Nuage de pixels dans le repere RVB','Position',[0.67*L,0,0.33*L,0.45*H]);

% Lecture et affichage d'une image RVB :
I = imread('ishihara-0.png');
figure(1);				% Premiere fenetre d'affichage
subplot(2,2,1);				% La fenetre comporte 2 lignes et 2 colonnes
imagesc(I);
axis off;
axis equal;
title('Image RVB','FontSize',20);

% Decoupage de l'image en trois canaux et conversion en doubles :
R = double(I(:,:,1));
V = double(I(:,:,2));
B = double(I(:,:,3));

% Affichage du canal R :
colormap gray;				% Pour afficher les images en niveaux de gris
subplot(2,2,2);
imagesc(R);
axis off;
axis equal;
title('Canal R','FontSize',20);

% Affichage du canal V :
subplot(2,2,3);
imagesc(V);
axis off;
axis equal;
title('Canal V','FontSize',20);

% Affichage du canal B :
subplot(2,2,4);
imagesc(B);
axis off;
axis equal;
title('Canal B','FontSize',20);

% Affichage du nuage de pixels dans le repere RVB :
figure(2);				% Deuxieme fenetre d'affichage
plot3(R,V,B,'b.');
axis equal;
xlabel('R');
ylabel('V');
zlabel('B');
rotate3d;

% Matrice des donnees :
X = [R(:) V(:) B(:)];			% Les trois canaux sont vectorises et concatenes
x_moy = sum(X,1)./size(X,1); %(peut utiliser mean)
X_centre = X - x_moy;
% Matrice de variance/covariance :
Sigma = (1/size(X_centre,1))*X_centre'*X_centre;
%Valeurs propres de la matrice de variance/covariance :
[W,D]=eig(Sigma);
%Trie des valeurs propres par ordre décroissant :
[VP_trie,Indice_VP_trie] = sort(diag(D),'descend');
W_trie = W(:,Indice_VP_trie);
%Projections des pixels par la matrice W triée :
C = X_centre * W_trie;
%Affichage de C :
C_RVB = reshape(C,[size(R) 3]);

figure('Name','Separation des canaux RVB projetés','Position',[0,0,0.67*L,0.67*H]);
colormap gray;				% Pour afficher les images en niveaux de gris
subplot(1,3,1);
imagesc(C_RVB(:,:,1));
axis off;
axis equal;
title('Canal R','FontSize',20);
subplot(1,3,2);
imagesc(C_RVB(:,:,2));
axis off;
axis equal;
title('Canal V','FontSize',20);
subplot(1,3,3);
imagesc(C_RVB(:,:,3));
axis off;
axis equal;
title('Canal B','FontSize',20);

% Matrice de variance/covariance :
Sigma_C = (1/size(C,1))*C'*C;
% Coefficients de correlation lineaire :
r_RV = Sigma_C(2,1)/(sqrt(Sigma_C(1,1))*sqrt(Sigma_C(2,2)));
fprintf("Corrélation linéaire de R et V %.4f\n",r_RV);
r_VB = Sigma_C(3,2)/(sqrt(Sigma_C(2,2))*sqrt(Sigma_C(3,3)));
fprintf("Corrélation linéaire de V et B %.4f\n",r_VB);
r_BR = Sigma_C(1,3)/(sqrt(Sigma_C(3,3))*sqrt(Sigma_C(1,1)));
fprintf("Corrélation linéaire de B et R %.4f\n",r_BR);
% Proportions de contraste :
c_R = (Sigma_C(1,1))/(Sigma_C(1,1)+Sigma_C(2,2)+Sigma_C(3,3));
fprintf("Proportion de contraste de R %.4f\n",c_R);
c_V = (Sigma_C(2,2))/(Sigma_C(1,1)+Sigma_C(2,2)+Sigma_C(3,3));
fprintf("Proportion de contraste de V %.4f\n",c_V);
c_B = (Sigma_C(3,3))/(Sigma_C(1,1)+Sigma_C(2,2)+Sigma_C(3,3));
fprintf("Proportion de contraste de B %.4f\n",c_B);