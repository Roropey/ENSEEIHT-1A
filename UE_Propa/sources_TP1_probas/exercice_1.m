clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture d'une image interne a Matlab et conversion en doubles :
I = rgb2gray(imread('autumn.tif'));
I = double(I);

% Valeur extremales de l'image (8 bits non signes au depart) :
I_max = 255;
I_min = 0;

% Affichage de l'image :
figure('Position',[0.1*L,0.05*H,0.8*L,0.7*H]);
subplot(2,2,1)
    imagesc(I);
    axis image off;
    colormap gray;
    set(gca,'FontSize',20);
    title('Exemple d''image interne a Matlab')

% Affichage de l'histogramme de l'image :
histogramme = histcounts(I(:),I_min:I_max+1);
subplot(2,2,3)
    plot(I_min:I_max,histogramme);
    axis([I_min I_max 0 1.1*max(histogramme)]);
    xlabel('Niveau de gris','FontSize',15);
    ylabel('Frequence','FontSize',15);
    set(gca,'FontSize',20);
    title('Histogramme des niveaux de gris')

% Calcul de vecteurs contenant les niveaux de gris de gauche (de droite) d'une paire de pixels :
[Vd,Vg] = fonctions_TP1_proba('vectorisation_par_colonne',I);

% Affichage des paires de niveaux de gris sous la forme d'un nuage de points :
subplot(1,2,2)
    plot(Vd,Vg,'b+');
    axis([I_min I_max I_min I_max]);
    xlabel('Niveau de gris du pixel de droite','FontSize',15);
    ylabel('Niveau de gris du pixel de gauche','FontSize',15);
    hold on;
    set(gca,'FontSize',20);
    axis equal;
    title('Mise en evidence de la correlation entre pixels voisins')

% Calcul des parametres de la droite de regression :
[r,a,b] = fonctions_TP1_proba('calcul_parametres_correlation',Vd,Vg);
fprintf('Coefficient de correlation lineaire : %.4f\n',r);

% Affichage de la droite de regression (d'equation y = a*x+b) :
x = I_min:I_max;
y = a*x+b;
plot(x,y,'r','LineWidth',3);
