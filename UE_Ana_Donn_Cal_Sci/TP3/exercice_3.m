%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Analyse de données
% TP3 - Classification bayésienne
% exercice_3.m
%--------------------------------------------------------------------------

clear
close all
clc

% Chargement des données de l'exercice 2
load resultats_ex2

%% Classifieur par maximum de vraisemblance
% code_classe est la matrice contenant des 1 pour les chrysanthemes
%                                          2 pour les oeillets
%                                          3 pour les pensees
% l'attribution de 1,2 ou 3 correspond au maximum des trois vraisemblances
code_classe = zeros(size(V_pensees));
max_V_chrysanthemes = (max(max(V_pensees,V_oeillets),V_chrysanthemes)==V_chrysanthemes);
max_V_oeillets = (max(max(V_pensees,V_oeillets),V_chrysanthemes)==V_oeillets);
max_V_pensees = (max(max(V_pensees,V_oeillets),V_chrysanthemes)==V_pensees);

code_classe = zeros(size(V_pensees));
code_classe(max_V_pensees) = 3;
code_classe(max_V_chrysanthemes) = 1;
code_classe(max_V_oeillets) = 2;


%% Affichage des classes

figure('Name','Classification par maximum de vraisemblance',...
       'Position',[0.25*L,0.1*H,0.5*L,0.8*H])
axis equal ij
axis([r(1) r(end) v(1) v(end)]);
hold on
imagesc(r,v,code_classe)
carte_couleurs = [.45 .45 .65 ; .45 .65 .45 ; .65 .45 .45];
colormap(carte_couleurs)
hx = xlabel('$\overline{r}$','FontSize',20);
set(hx,'Interpreter','Latex')
hy = ylabel('$\bar{v}$','FontSize',20);
set(hy,'Interpreter','Latex')
view(-90,90)

%% Comptage des images correctement classees
Pensees_pensees = vraisemblance(X_pensees(:,1),X_pensees(:,2),mu_pensees, Sigma_pensees, denominateur_classe_pensees);
Pensees_oeillets = vraisemblance(X_pensees(:,1),X_pensees(:,2),mu_oeillets, Sigma_oeillets, denominateur_classe_oeillets);
Pensees_chrysanthemes = vraisemblance(X_pensees(:,1),X_pensees(:,2),mu_chrysanthemes, Sigma_chrysanthemes, denominateur_classe_chrysanthemes);

Proportion_juste_pensees = (sum(max(max(Pensees_pensees,Pensees_oeillets),Pensees_chrysanthemes)==Pensees_pensees))/length(X_pensees);

Oeillets_pensees = vraisemblance(X_oeillets(:,1),X_oeillets(:,2),mu_pensees, Sigma_pensees, denominateur_classe_pensees);
Oeillets_oeillets = vraisemblance(X_oeillets(:,1),X_oeillets(:,2),mu_oeillets, Sigma_oeillets, denominateur_classe_oeillets);
Oeillets_chrysanthemes = vraisemblance(X_oeillets(:,1),X_oeillets(:,2),mu_chrysanthemes, Sigma_chrysanthemes, denominateur_classe_chrysanthemes);

Proportion_juste_oeillets = (sum(max(max(Oeillets_pensees,Oeillets_oeillets),Oeillets_chrysanthemes)==Oeillets_oeillets))/length(X_oeillets);

Chrysanthemes_pensees = vraisemblance(X_chrysanthemes(:,1),X_chrysanthemes(:,2),mu_pensees, Sigma_pensees, denominateur_classe_pensees);
Chrysanthemes_oeillets = vraisemblance(X_chrysanthemes(:,1),X_chrysanthemes(:,2),mu_oeillets, Sigma_oeillets, denominateur_classe_oeillets);
Chrysanthemes_chrysanthemes = vraisemblance(X_chrysanthemes(:,1),X_chrysanthemes(:,2),mu_chrysanthemes, Sigma_chrysanthemes, denominateur_classe_chrysanthemes);

Proportion_juste_chrysanthemes = (sum(max(max(Chrysanthemes_pensees,Chrysanthemes_oeillets),Chrysanthemes_chrysanthemes)==Chrysanthemes_chrysanthemes))/length(X_chrysanthemes);

Proportion_juste_tout = (sum(max(max(Pensees_pensees,Pensees_oeillets),Pensees_chrysanthemes)==Pensees_pensees)+sum(max(max(Oeillets_pensees,Oeillets_oeillets),Oeillets_chrysanthemes)==Oeillets_oeillets)+sum(max(max(Chrysanthemes_pensees,Chrysanthemes_oeillets),Chrysanthemes_chrysanthemes)==Chrysanthemes_chrysanthemes))/(length(X_pensees)+length(X_oeillets)+length(X_chrysanthemes));