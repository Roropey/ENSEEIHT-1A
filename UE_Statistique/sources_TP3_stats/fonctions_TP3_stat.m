
% TP3 de Statistiques : fonctions a completer et rendre sur Moodle
% Nom : Peyremorte
% Prenom : Romain
% Groupe : 1SN-E

function varargout = fonctions_TP3_stat(varargin)

    [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});

end

% Fonction estimation_F (exercice_1.m) ------------------------------------
function [rho_F,theta_F,ecart_moyen] = estimation_F(rho,theta)

    A=[cos(theta) sin(theta)];
    B=rho;
    X=A\B;
    rho_F=sqrt((X(1)^2)+(X(2)^2));
    theta_F=atan2(X(2),X(1));



    % A modifier lors de l'utilisation de l'algorithme RANSAC (exercice 2)
    ecart_moyen = (1/length(theta))*sum(abs(rho - rho_F*cos(theta - theta_F)));

end

% Fonction RANSAC_2 (exercice_2.m) ----------------------------------------
function [rho_F_estime,theta_F_estime] = RANSAC_2(rho,theta,parametres)
    
    ecart_moyen_minimum = Inf;
    
    for i = 1:parametres(3)
        Indices_alea=randperm(length(rho),2);

        [rho_F,theta_F,ecart_moyen] = estimation_F(rho(Indices_alea),theta(Indices_alea));
        
        indices_conformes=find(abs(rho-rho_F*cos(theta-theta_F)) <= parametres(1));
        
        if length(indices_conformes)/length(rho) >= parametres(2)   
           
            [rho_F,theta_F,ecart_moyen] = estimation_F(rho(indices_conformes),theta(indices_conformes));
            
            if ecart_moyen <= ecart_moyen_minimum 
                rho_F_estime = rho_F;
                theta_F_estime = theta_F;
                ecart_moyen_minimum = ecart_moyen;
            end

        end

    end

end

% Fonction G_et_R_moyen (exercice_3.m, bonus, fonction du TP1) ------------
function [G, R_moyen, distances] = ...
         G_et_R_moyen(x_donnees_bruitees,y_donnees_bruitees)
G = [mean(x_donnees_bruitees), mean(y_donnees_bruitees)];
distances = sqrt((x_donnees_bruitees - G(1)).^(2) + (y_donnees_bruitees - G(2)).^2);
R_moyen = mean(distances);


end

% Fonction estimation_C_et_R (exercice_3.m, bonus, fonction du TP1) -------
function [C_estime,R_estime,critere] = ...
         estimation_C_et_R(x_donnees_bruitees,y_donnees_bruitees,n_tests,C_tests,R_tests)
     
    % Attention : par rapport au TP1, le tirage des C_tests et R_tests est 
    %             considere comme etant deje effectue 
    %             (il doit etre fait au debut de la fonction RANSAC_3)

x_ecart = (repmat(x_donnees_bruitees, n_tests, 1)-repmat(C_tests( : , 1), 1, length(x_donnees_bruitees)));
y_ecart = (repmat(y_donnees_bruitees, n_tests, 1)-repmat(C_tests( : , 2), 1, length(y_donnees_bruitees)));

arguments = (sqrt(x_ecart.^2 + y_ecart.^2) - repmat(R_tests, 1, length(x_donnees_bruitees))).^2;

[critere, position_min] = min(sum(arguments, 2));

C_estime = C_tests(position_min, : );
R_estime = R_tests(position_min);


end

% Fonction RANSAC_3 (exercice_3, bonus) -----------------------------------
function [C_estime,R_estime] = ...
         RANSAC_3(x_donnees_bruitees,y_donnees_bruitees,parametres)
     
    % Attention : il faut faire les tirages de C_tests et R_tests ici
    
    vraisemblance_min = Inf;
    
    for i = 1:parametres(3)
        Indices_alea=randperm(length(x_donnees_bruitees),3);
        
        [C,R] = estimation_cercle_3points(x_donnees_bruitees(Indices_alea),y_donnees_bruitees(Indices_alea));
        distances = sqrt((x_donnees_bruitees - C(1)).^(2) + (y_donnees_bruitees - C(2)).^2);
        
        indices_conformes=find(abs(distances - R) <= parametres(1));
        
        if length(indices_conformes)/length(x_donnees_bruitees) >= parametres(2)
            
            [G, R_moyen, distances] = G_et_R_moyen(x_donnees_bruitees(indices_conformes),y_donnees_bruitees(indices_conformes));
            n_tests = parametres(4);
            C_tests = (rand(n_tests, 2)*2 - 1)*R_moyen + G;
            R_tests = (rand(n_tests, 1) + 0.5)*R_moyen;

            [C_modele,R_modele,critere] = estimation_C_et_R(x_donnees_bruitees(indices_conformes),y_donnees_bruitees(indices_conformes),n_tests,C_tests,R_tests);
            
            if critere <= vraisemblance_min 
                C_estime = C_modele;
                R_estime = R_modele;
                vraisemblance_min = critere;
            end

        end

    end

end
