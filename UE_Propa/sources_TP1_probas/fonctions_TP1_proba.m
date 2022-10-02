
% TP1 de Probabilites : fonctions a completer et rendre sur Moodle
% Nom : Peyremorte
% Prénom : Romain
% Groupe : 1SN-E

function varargout = fonctions_TP1_proba(varargin)

    switch varargin{1}     
        case 'ecriture_RVB'
            varargout{1} = feval(varargin{1},varargin{2:end});
        case {'vectorisation_par_colonne','decorrelation_colonnes'}
            [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});
        case 'calcul_parametres_correlation'
            [varargout{1},varargout{2},varargout{3}] = feval(varargin{1},varargin{2:end}); 
    end

end

% Fonction ecriture_RVB (exercice_0.m) ------------------------------------
% (Copiez le corps de la fonction ecriture_RVB du fichier du meme nom)
function image_RVB = ecriture_RVB(image_originale)

R=image_originale(1:2:end,2:2:end);
B=image_originale(2:2:end,1:2:end);
V=(image_originale(1:2:end,1:2:end)+image_originale(2:2:end,2:2:end))*0.5;

image_RVB=cat(3,R,V,B);

end

% Fonction vectorisation_par_colonne (exercice_1.m) -----------------------
function [Vd,Vg] = vectorisation_par_colonne(I)

Vg_non_vec=I(:,1:end-1);
Vg=Vg_non_vec(:);
Vd_non_vec=I(:,2:end);
Vd=Vd_non_vec(:);

end

% Fonction calcul_parametres_correlation (exercice_1.m) -------------------
function [r,a,b] = calcul_parametres_correlation(Vd,Vg)

moy_Vd=mean(Vd);
moy_Vg=mean(Vg);

Var_Vd_carre=mean(Vd.^2)-moy_Vd^2;
Var_Vg_carre=mean(Vg.^2)-moy_Vg^2;

Cov_Vd_Vg=mean(Vd.*Vg)-moy_Vd*moy_Vg;

r=Cov_Vd_Vg/(sqrt(Var_Vd_carre*Var_Vg_carre));
a=Cov_Vd_Vg/Var_Vd_carre;
b=moy_Vg-moy_Vd*a;

end

% Fonction decorrelation_colonnes (exercice_2.m) --------------------------
function [I_decorrelee,I_min] = decorrelation_colonnes(I,I_max)

I_decorrelee=I;
I_min=-I_max;
I_decorrelee(:,2:end)=I_decorrelee(:,2:end)-I(:,1:end-1);

end



