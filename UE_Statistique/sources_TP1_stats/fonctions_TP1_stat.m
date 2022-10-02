
% TP1 de Statistiques : fonctions a completer et rendre sur Moodle
% Nom : Peyremorte
% Prénom : Romain
% Groupe : 1SN-E

function varargout = fonctions_TP1_stat(varargin)

    [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});

end

% Fonction G_et_R_moyen (exercice_1.m) ----------------------------------
function [G, R_moyen, distances] = ...
         G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees)
G = [mean(x_donnees_bruitees), mean(y_donnees_bruitees)];
distances = sqrt((x_donnees_bruitees - G(1)).^(2) + (y_donnees_bruitees - G(2)).^2);
R_moyen = mean(distances);
     
end

% Fonction estimation_C_uniforme (exercice_1.m) ---------------------------
function [C_estime, R_moyen] = ...
         estimation_C_uniforme(x_donnees_bruitees,y_donnees_bruitees,n_tests)

[G,R_moyen,distances] = G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees);     
C_tests = (rand(n_tests, 2)*2 - 1)*R_moyen + G;

x_ecart = (repmat(x_donnees_bruitees, n_tests, 1) - repmat(C_tests( : , 1), 1, length(x_donnees_bruitees)));
y_ecart = (repmat(y_donnees_bruitees, n_tests, 1) - repmat(C_tests( : , 2), 1, length(y_donnees_bruitees)));

[~, position_min] = min(sum((sqrt(x_ecart.^2+y_ecart.^2) - R_moyen).^2, 2));

C_estime = C_tests(position_min, : );

end

% Fonction estimation_C_et_R_uniforme (exercice_2.m) ----------------------
function [C_estime, R_estime] = ...
         estimation_C_et_R_uniforme(x_donnees_bruitees,y_donnees_bruitees,n_tests)

[G,R_moyen,distances]=G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees);     
C_tests = (rand(n_tests, 2)*2 - 1)*R_moyen + G;
R_tests = (rand(n_tests, 1) + 0.5)*R_moyen;

x_ecart = (repmat(x_donnees_bruitees, n_tests, 1)-repmat(C_tests( : , 1), 1, length(x_donnees_bruitees)));
y_ecart = (repmat(y_donnees_bruitees, n_tests, 1)-repmat(C_tests( : , 2), 1, length(y_donnees_bruitees)));

arguments = (sqrt(x_ecart.^2 + y_ecart.^2) - repmat(R_tests, 1, length(x_donnees_bruitees))).^2;

[~, position_min] = min(sum(arguments, 2));

C_estime = C_tests(position_min, : );
R_estime = R_tests(position_min);

end

% Fonction occultation_donnees (donnees_occultees.m) ----------------------
function [x_donnees_bruitees, y_donnees_bruitees] = ...
         occultation_donnees(x_donnees_bruitees, y_donnees_bruitees, theta_donnees_bruitees)
theta_1 = rand(1)*2*pi;
theta_2 = rand(1)*2*pi;

if theta_1 <= theta_2
    Indices = find(theta_donnees_bruitees >= theta_1 & theta_donnees_bruitees <= theta_2);
else
    Indices = find(theta_donnees_bruitees < theta_2 | theta_donnees_bruitees > theta_1);
end

if isempty(Indices)
    Indices=1;
end

x_donnees_bruitees = x_donnees_bruitees(Indices);
y_donnees_bruitees = y_donnees_bruitees(Indices);

end

% Fonction estimation_C_et_R_normale (exercice_4.m, bonus) ----------------
function [C_estime, R_estime] = ...
         estimation_C_et_R_normale(x_donnees_bruitees,y_donnees_bruitees,n_tests)

[G, R_moyen, distances]=G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees);     

sigma=sqrt(mean((distances-R_moyen).^2));
C_tests = 2*sigma*randn(n_tests, 2) + G;
R_tests = 2*sigma*randn(n_tests, 1) + R_moyen;

x_ecart = (repmat(x_donnees_bruitees, n_tests, 1) - repmat(C_tests(:, 1), 1, length(x_donnees_bruitees)));
y_ecart = (repmat(y_donnees_bruitees, n_tests, 1) - repmat(C_tests(:, 2), 1, length(y_donnees_bruitees)));

arguments = (sqrt(x_ecart.^2 + y_ecart.^2) - repmat(R_tests, 1, length(x_donnees_bruitees))).^2;

[~, position_min] = min(sum(arguments, 2));

C_estime = C_tests(position_min, : );
R_estime = R_tests(position_min);

end
