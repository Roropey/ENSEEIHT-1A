
% TP2 de Statistiques : fonctions a completer et rendre sur Moodle
% Nom : Peyremorte
% Prénom : Romain
% Groupe : 1SN-E

function varargout = fonctions_TP2_stat(varargin)

    [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});

end

% Fonction centrage_des_donnees (exercice_1.m) ----------------------------
function [x_G, y_G, x_donnees_bruitees_centrees, y_donnees_bruitees_centrees] = ...
                centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees)
     x_G=mean(x_donnees_bruitees);
     y_G=mean(y_donnees_bruitees);
     x_donnees_bruitees_centrees = x_donnees_bruitees-x_G;
     y_donnees_bruitees_centrees = y_donnees_bruitees-y_G;
   
     
end

% Fonction estimation_Dyx_MV (exercice_1.m) -------------------------------
function [a_Dyx,b_Dyx] = ...
           estimation_Dyx_MV(x_donnees_bruitees,y_donnees_bruitees,n_tests)

    [x_G, y_G, x_donnees_bruitees_centrees, y_donnees_bruitees_centrees] = centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees);
    
    psi_tests = rand(n_tests,1)*pi-pi/2;
    
    [~, position_min] = min(sum((repmat(y_donnees_bruitees_centrees, n_tests, 1) - tan(psi_tests)*x_donnees_bruitees_centrees).^2, 2));
    
    a_Dyx = tan(psi_tests(position_min));
    b_Dyx = y_G-x_G.*a_Dyx;

end

% Fonction estimation_Dyx_MC (exercice_2.m) -------------------------------
function [a_Dyx,b_Dyx] = ...
                   estimation_Dyx_MC(x_donnees_bruitees,y_donnees_bruitees)
    
    A = [x_donnees_bruitees ; ones(1,length(x_donnees_bruitees))]';
    B = y_donnees_bruitees';
    
    X=A\B;
    a_Dyx = X(1);
    b_Dyx = X(2);
    
end

% Fonction estimation_Dorth_MV (exercice_3.m) -----------------------------
function [theta_Dorth,rho_Dorth] = ...
         estimation_Dorth_MV(x_donnees_bruitees,y_donnees_bruitees,n_tests)
    [x_G, y_G, x_donnees_bruitees_centrees, y_donnees_bruitees_centrees] = centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees);
    
    theta_tests = rand(n_tests,1)*pi;
    [~, position_min] = min(sum((cos(theta_tests)*x_donnees_bruitees_centrees + sin(theta_tests)*y_donnees_bruitees_centrees).^2, 2));
    theta_Dorth = theta_tests(position_min);
    
    rho_Dorth = x_G*cos(theta_Dorth)+y_G*sin(theta_Dorth);

    %Si rho n'appartient pas à R+ => on met rho positif et on enlève pi à
    %theta pour qu'il corresponde au nouveau rho (et car theta varie entre
    %-pi et pi
    if rho_Dorth < 0
        rho_Dorth = -rho_Dorth;
        theta_Dorth = theta_Dorth - pi;
    end

end

% Fonction estimation_Dorth_MC (exercice_4.m) -----------------------------
function [theta_Dorth,rho_Dorth] = ...
                 estimation_Dorth_MC(x_donnees_bruitees,y_donnees_bruitees)

    [x_G, y_G, x_donnees_bruitees_centrees, y_donnees_bruitees_centrees] = centrage_des_donnees(x_donnees_bruitees,y_donnees_bruitees);
    
    C=[x_donnees_bruitees_centrees;y_donnees_bruitees_centrees]';
    [V,D] = eig(C'*C);
    [~,min_position] = min(sum(D,2));
    Y = V(:,min_position);
    theta_Dorth = atan2(Y(2),Y(1));

    %Pour réaliser le calcul de rho, il faut que theta soit entre 0 et pi
    %donc s'il est inférieur à 0 (donc entre -pi et 0), on ajoute pi
    if theta_Dorth < 0
        theta_Dorth = theta_Dorth+pi;
    end

    rho_Dorth = x_G*cos(theta_Dorth) + y_G*sin(theta_Dorth);
    
    %Si rho n'appartient pas à R+ => on met rho positif et on enlève pi à
    %theta pour qu'il corresponde au nouveau rho (et car theta varie entre
    %-pi et pi
    if rho_Dorth < 0
        rho_Dorth = -rho_Dorth;
        theta_Dorth = theta_Dorth - pi;
    end

end
