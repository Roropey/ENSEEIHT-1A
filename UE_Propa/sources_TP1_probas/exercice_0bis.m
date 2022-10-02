clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);

% Lecture et affichage de l'image originale :
image_originale = imread('image_originale.png');
figure('Position',[0.1*L,0.05*H,0.8*L,0.7*H]);
subplot(1,2,1)
    imagesc(image_originale);
    axis image off;
    colormap gray;
    title('Image originale')

% Conversion des entiers non signés en doubles :
image_originale = double(image_originale);

% Ecriture de image_RVB :
image_RVB = fonctions_TP1_proba('ecriture_RVB',image_originale);

% Affichage de l'image RVB convertie en entiers non signes :
subplot(1,2,2)
    imagesc(uint8(image_RVB));
    axis image off;
    title('Image convertie en RVB')
