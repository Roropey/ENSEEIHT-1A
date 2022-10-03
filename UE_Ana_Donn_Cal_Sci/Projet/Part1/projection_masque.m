clear all;
close all;

load eigenfaces;

h = figure('Position',[0,0,0.67*L,0.67*H]);
figure('Name','RMSE en fonction du nombre de composantes principales','Position',[0.67*L,0,0.33*L,0.3*L]);

% Calcul de la RMSE entre images originales et images reconstruites :
RMSE_max_masque = 0;

% Composantes principales des données d'apprentissage
C_masque = X_centre_masque*W_masque;

for q = 0:n-1
    if q == 0
        X_reconstruit_masque = individu_moyen_masque; 
    else
        C_extrait_masque = C_masque(:,1:q);		% q premières composantes principales
        eigenfaces_extrait_masque = W_masque(:,1:q);		% q premières eigenfaces
        X_reconstruit_masque = C_extrait_masque * eigenfaces_extrait_masque';
    end    
    figure(1);
    set(h,'Name',['Utilisation des ' num2str(q) ' premieres composantes principales']);
    colormap gray;
    hold off;
    for k = 1:q
        subplot(nb_personnes_base, nb_postures_base,k);
        img = reshape(X_reconstruit_masque(k,:), nb_lignes,nb_colonnes);
        imagesc(img);
        hold on;
        axis image;
        axis off;
    end
   
     figure(2);
     hold on;

     RMSE_masque = sqrt(mean((X_reconstruit_masque-X_masque).^2,'all'));
     RMSE_max_masque = max(RMSE_masque,RMSE_max_masque);

     plot(q,RMSE_masque,'r+','MarkerSize',8,'LineWidth',2);
     axis([0 n-1 0 1.1*RMSE_max_masque]);
     set(gca,'FontSize',20);
     hx = xlabel('$q$','FontSize',30);
     set(hx,'Interpreter','Latex');
     ylabel('RMSE','FontSize',30);
    
     pause(0.01);
end

%save projection;
