donnees_occultees;

n_tests = 500;


% Tirages aleatoires selon des lois uniformes -----------------------------

[C_estime,R_estime] = ...
fonctions_TP1_stat('estimation_C_et_R_uniforme',x_donnees_bruitees,y_donnees_bruitees,n_tests);

% Affichage du premier cercle estime :
n_points_cercle = 100;
theta_cercle = 2*pi/n_points_cercle:2*pi/n_points_cercle:2*pi;
x_cercle_estime = C_estime(1) + R_estime*cos(theta_cercle);
y_cercle_estime = C_estime(2) + R_estime*sin(theta_cercle);
plot(x_cercle_estime([1:end 1]),y_cercle_estime([1:end 1]),'b','LineWidth',3);


% Tirages aleatoires selon des lois normales ------------------------------

[C_estime,R_estime] = ...
fonctions_TP1_stat('estimation_C_et_R_normale',x_donnees_bruitees,y_donnees_bruitees,n_tests);

% Affichage du deuxieme cercle estime :
x_cercle_estime = C_estime(1) + R_estime*cos(theta_cercle);
y_cercle_estime = C_estime(2) + R_estime*sin(theta_cercle);
plot(x_cercle_estime([1:end 1]),y_cercle_estime([1:end 1]),'g','LineWidth',3);
lg = legend(' Cercle initial', ...
		    ' Donnees bruitees', ...
		    ' Cercle estime (loi uniforme)', ...
		    ' Cercle estime (loi normale)', ...
		    'Location','Best');
