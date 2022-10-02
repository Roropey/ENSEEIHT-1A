
% TP3 de Probabilites : fonctions a completer et rendre sur Moodle
% Nom : Peyremorte
% Prénom : Romain
% Groupe : 1SN-E

function varargout = fonctions_TP3_proba(varargin)

    switch varargin{1}
        
        case 'matrice_inertie'
            
            [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});
            
        case {'ensemble_E_recursif','calcul_proba'}
            
            [varargout{1},varargout{2},varargout{3}] = feval(varargin{1},varargin{2:end});
    
    end
end

% Fonction ensemble_E_recursif (exercie_1.m) ------------------------------
function [E,contour,G_somme] = ...
    ensemble_E_recursif(E,contour,G_somme,i,j,voisins,G_x,G_y,card_max,cos_alpha)
    
contour(i,j)=0;
nb_voisins=size(voisins,1);
k=1;

while ((k<=nb_voisins)&(size(E,1)<=card_max))

    i_voisin=i+voisins(k,1);
    j_voisin=j+voisins(k,2);

    if contour(i_voisin,j_voisin)
        G=[G_x(i_voisin,j_voisin), G_y(i_voisin,j_voisin)];
        if (G/(norm(G)))*((G_somme/(norm(G_somme)))') >= cos_alpha
            
            E=[E; i_voisin ,j_voisin];
            G_somme=G_somme+G;
            [E,contour,G_somme]=ensemble_E_recursif(E,contour,G_somme,i_voisin,j_voisin,voisins,G_x,G_y,card_max,cos_alpha);
        end
    end
    k=k+1;
end

end

% Fonction matrice_inertie (exercice_2.m) ---------------------------------
function [M_inertie,C] = matrice_inertie(E,G_norme_E)
    PI_inverse=1./sum(G_norme_E);
    E=fliplr(E);
    C=[PI_inverse*sum(E(:,1).*G_norme_E) PI_inverse*sum(E(:,2).*G_norme_E)];
    M_inertie=PI_inverse.*[sum(G_norme_E.*((E(:,1)-C(1))).^2) sum(G_norme_E.*((E(:,1)-C(1))).*(E(:,2)-C(2))); sum(G_norme_E.*((E(:,1)-C(1))).*(E(:,2)-C(2))) sum(G_norme_E.*(E(:,2)-C(2)).^2)]; 
    


end

% Fonction calcul_proba (exercice_2.m) ------------------------------------
function [x_min,x_max,probabilite] = calcul_proba(E_nouveau_repere,p)

    n=size(E_nouveau_repere,1);
    x_min = min(E_nouveau_repere(:,1));
    x_max = max(E_nouveau_repere(:,1));
    N=floor((x_max-x_min)*(max(E_nouveau_repere(:,2))-min(E_nouveau_repere(:,2))));
    probabilite=1-binocdf((n-1),N,p);
    
end
