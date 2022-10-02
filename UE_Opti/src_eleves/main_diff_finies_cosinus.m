% Auteur : Joseph Gergaud, INP-ENSEEIHT & IRIT
% Date   : décembre 2017
%
% Test de l'algorithme de différences finies avant sur la fonction cosinus
% fun1(x) = cos(x)
% fun2(x) = cos(x) + alpha*rand(1)
% Avec 2 points différents
%

% On réinitialise l'environnement
%
clear;
close all;
clc;

% Des paramètres pour l'affichage
%
tirets  = '------------------------------------------';
LW      = 1.5;
set(0,'defaultaxesfontsize'           ,  14     , ...
      'DefaultTextVerticalAlignment'  , 'bottom', ...
      'DefaultTextHorizontalAlignment', 'left'  , ...
      'DefaultTextFontSize'           ,  12     , ...
      'DefaultFigureWindowStyle'      ,'docked');

% On choisit un format long pour plus de détails sur les résultats numériques
%
format shortE;

% Exercice 2.2
%-------------------------------------------------------------------------------------------------------------
% Test de l'algorithme de différences finies avant sur la fonction cosinus
%
disp(tirets);
disp('Test de l''algorithme de différences finies  sur la fonction cosinus');

% Les differentes fonctions et la jacobienne theorique
fun1 = @(x) -cos(x);
fun2 = @(x) -cos(x) + 1.e-8*rand(1);
true_jac = @(x)  sin(x);

% Variables pour le choix de la precision et de la difference finie
Single_precision = true;
list_diff_finies = {'avants','centrees','complexes'};
%%%%% MODIFIER LE NUMERO APRES AVOIR CODE LA FONCTION ASSOCIEE %%%%%%%%%%%
methode_finite_diff = list_diff_finies{3};

% Calcul du epsilon machine en fonction de la precision
if Single_precision
	precision_machine = eps(single(1));
else
	precision_machine = eps((1));
end

% Estimation du h* en fonction de la difference finie choisie
switch methode_finite_diff
	case {'avants','complexes'}
        h_star = sqrt(precision_machine);
    case 'centrees'
        h_star = precision_machine^(1/3.);
end

% Points ou l'on souhaite effectuer les tests
x0 = pi/3;
x1 = 1.e6*pi/3;

% Ordres pour faire les tests (16 + celui de h*)
ten_log_h_star = -log10(h_star);
ordres = ([1:floor(ten_log_h_star), ten_log_h_star, ceil(ten_log_h_star):16]);

% Initialisation des vecteurs d'erreur
err_x0 = zeros(1,length(ordres)); 
err_x0p = zeros(1,length(ordres));
err_x1 = zeros(1,length(ordres));

% Passage des donnees en single en fonction de la precision choisie
if Single_precision
	x0 = single(x0);
	x1 = single(x1);
	ordres = single(ordres);
end

switch methode_finite_diff
    % Differences finies avant 
    case 'avants'
        diff_finies = @(fun,x,h) forwardfiniteDiff(fun,x,h);
    % Differences finies avant        
    case 'centrees'
        diff_finies = @(fun,x,h) centredfiniteDiff(fun,x,h);
    % Differences finies avant 
    case 'complexes'
        diff_finies = @(fun,x,h) derivee_complexe(fun,x,h);
end

for i = 1:length(ordres)
    h = 10^(-ordres(i));
    err_x0(i)  = abs(diff_finies(fun1,x0,h) - (true_jac(x0)));
    if ~Single_precision
    err_x1(i)  = abs(diff_finies(fun1,x1,h) - (true_jac(x1)));
    err_x0p(i) = abs(diff_finies(fun2,x0,h) - (true_jac(x0)));
    end
end

% Affichage de la courbe pour x0
affichage_erreur(ordres, err_x0, h_star, 'x0',   methode_finite_diff, Single_precision, LW);
if ~Single_precision
% Affichage de la courbe pour x1
    affichage_erreur(ordres, err_x1, h_star, 'x1',   methode_finite_diff, Single_precision, LW);
% Affichage de la courbe pour x0p
    affichage_erreur(ordres, err_x0p, h_star, 'x0p', methode_finite_diff, Single_precision, LW);
end


% Fonctions ---------------------------------------------------------------

function affichage_erreur(ordres,err,h_star,x_str,methode_str,single,LW)
    figure;
        non_nul_element = find(err);
        err = err(non_nul_element);
        ordres = ordres(non_nul_element);
        % Courbe des erreurs pour les differents ordres en bleu
        loglog(10.^(-ordres), err, 'b', 'LineWidth', LW);
        hold on;
        % Ligne verticale pour situer l'erreur optimale h* en rouge
        line([h_star, h_star], [min(err), max(err)], 'Color', 'r');
        grid on; 
        xlabel('h'); 
        ylabel('erreurs');
        
        titre = ['Erreur des differences finies ' methode_str];
        
        if single
            titre = [titre ' precision simple'];
            single_str = '_prec_simple_';
        else
            titre = [titre ' precision double'];
            single_str = '_prec_double_';
        end
        
        switch x_str
            case 'x0'
                titre = [titre, sprintf('\n sur la fonction cosinus en x_0= %s/3', '\pi')];
            case 'x1'
                titre = [titre, sprintf('\n sur la fonction cosinus en x_1= %s/3', '1.e6*\pi')];
            case 'x0p'
                titre = [titre, sprintf('\n sur la fonction cosinus perturbee en x_0= %s/3', '\pi')];
        end
        
        title(titre, 'HorizontalAlignment', 'center');
        legend({'Numerique','Theorique'},'Location','SouthWest');
        grid on;
        drawnow;
        % Enregistrement de l'image
        print(['fig_diff_finies_' single_str x_str],'-dpng'); 
end


function Jac = forwardfiniteDiff(fun,x,h)
%
% Cette fonction calcule les différences finies
% Paramètres en entrées
% fun : fonction dont on cherche à calculer la matrice jacobienne
%       fonction de IR^n à valeurs dans IR^m
% x   : point où l'on veut calculer la matrice jacobienne
% h   : pas
%
% Paramètre en sortie
% Jac : Matrice jacobienne approximé par les différences finies
%        real(m,n)
% ------------------------------------

Jac = ones(size(fun(x),2),size(x,2));
I=eye(size(x,2));
for direction = 1:size(x,2)
    Jac(:,direction)=(fun(x+I(direction,:)*h)-fun(x))./(h);
end
end

function Jac = centredfiniteDiff(fun, x, h)
%
%Cette fonction calcule les différences finies à l'aide d'un schéma centré
%Paramètres en entrées
% fun : fonction dont on cherche à calculer la matrice jacobienne
%       fonction de IR^n à valeurs dans IR^m
% x   : point où l'on veut calculer la matrice jacobienne
% h   : pas
%
% Paramètre en sortie
% Jac : Matrice jacobienne approximé par les différences finies
%        real(m,n)
% ------------------------------------
Jac = ones(size(fun(x),2),size(x,2));
I=eye(size(x,2));
for direction = 1:size(x,2)
    Jac(:,direction)=(fun(x+I(direction,:)*h)-fun(x-I(direction,:)*h))./(2*h);
end
end

function Jac = derivee_complexe(fun, x,h)

%
%Cette fonction calcule les différences finies à l'aide d'un schéma complexe
%Paramètres en entrées
% fun : fonction dont on cherche à calculer la matrice jacobienne
%       fonction de IR^n à valeurs dans IR^m
% x   : point où l'on veut calculer la matrice jacobienne
% h   : pas
%
% Paramètre en sortie
% Jac : Matrice jacobienne approximé par les différences finies
%        real(m,n)
% ------------------------------------
Jac = ones(size(fun(x),2),size(x,2));
I=eye(size(x,2));
for direction = 1:size(x,2)
    Jac(:,direction)=imag(fun(x+sqrt(-1)*h*I(direction,:)))./h;
end
end




