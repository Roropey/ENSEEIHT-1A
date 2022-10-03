clear;
close all;
taille_ecran = get(0,'ScreenSize');
L = taille_ecran(3);
H = taille_ecran(4);
nom = ["Quai 9 3/4" "?" "Jet moqueur Hunger Games" "X files" "?" "Assassin Creed" "V pour vendetta" "Anonimous" "Champignon (Mario)" "Bowser" "Star Trek" "Doctor Who" "?" "?" "Zelda"];
% Lecture et affichage d'une image RVB :
for i = 1:15
    
    I = imread(strcat("Quizz/ishihara-",int2str(i+30),".png"));
    R = double(I(:,:,1));
    V = double(I(:,:,2));
    B = double(I(:,:,3));

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
    
    figure('Name',strcat("Symbole ",nom(i)),'Position',[0,0,0.67*L,0.67*H]);
    subplot(2,2,1);				% La fenetre comporte 2 lignes et 2 colonnes
    imagesc(I);
    axis off;
    axis equal;
    title('Image RVB','FontSize',20);
    
    colormap gray;				% Pour afficher les images en niveaux de gris
    subplot(2,2,2);
    imagesc(C_RVB(:,:,1));
    axis off;
    axis equal;
    title('Canal R','FontSize',20);
    subplot(2,2,3);
    imagesc(C_RVB(:,:,2));
    axis off;
    axis equal;
    title('Canal V','FontSize',20);
    subplot(2,2,4);
    imagesc(C_RVB(:,:,3));
    axis off;
    axis equal;
    title('Canal B','FontSize',20);
end;