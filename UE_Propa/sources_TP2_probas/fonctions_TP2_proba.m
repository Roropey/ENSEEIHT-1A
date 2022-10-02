
% TP2 de Probabilites : fonctions a completer et rendre sur Moodle
% Nom : Peyremorte
% Prenom : Romain
% Groupe : 1SN-E

function varargout = fonctions_TP2_proba(varargin)

    switch varargin{1}
        
        case {'calcul_frequences_caracteres','determination_langue','coeff_compression','gain_compression','partitionnement_frequences'}

            varargout{1} = feval(varargin{1},varargin{2:end});
            
        case {'recuperation_caracteres_presents','tri_decroissant_frequences','codage_arithmetique'}
            
            [varargout{1},varargout{2}] = feval(varargin{1},varargin{2:end});
            
        case 'calcul_parametres_correlation'
            
            [varargout{1},varargout{2},varargout{3}] = feval(varargin{1},varargin{2:end});
            
    end

end

% Fonction calcul_frequences_caracteres (exercice_0.m) --------------------
function frequences = calcul_frequences_caracteres(texte,alphabet)
frequences=zeros(size(alphabet));
for indice = 1:length(alphabet)
    frequences(indice)=count(texte,alphabet(indice));
end
frequences=frequences/length(texte);
end

% Fonction recuperation_caracteres_presents (exercice_0.m) ----------------
function [selection_frequences,selection_alphabet] = ...
                      recuperation_caracteres_presents(frequences,alphabet)
indices_non_nuls=frequences>0;
selection_frequences=frequences(indices_non_nuls);
selection_alphabet=alphabet(indices_non_nuls);

end

% Fonction tri_decremental_frequences (exercice_0.m) ----------------------
function [frequences_triees,indices_frequences_triees] = ...
                           tri_decroissant_frequences(selection_frequences)
[frequences_triees,indices_frequences_triees]=sort(selection_frequences,'descend');


end

% Fonction determination_langue (exercice_1.m) ----------------------------
function langue = determination_langue(frequences_texte, frequences_langue, nom_norme)
    % Note : la variable nom_norme peut valoir 'L1', 'L2' ou 'Linf'.
erreur=zeros(size(frequences_langue,1));
switch nom_norme
    case 'L1'
        erreur=sum(abs(frequences_texte-frequences_langue),2);
    case 'L2'
        erreur=sum((frequences_texte-frequences_langue).^2,2);
    case 'Linf'
        erreur=max(abs(frequences_texte-frequences_langue),[],2);
end


[~,langue]=min(erreur);

end

% Fonction coeff_compression (exercice_2.m) -------------------------------
function coeff_comp = coeff_compression(signal_non_encode,signal_encode)
coeff_comp=length(signal_non_encode)*8/length(signal_encode);

end

% Fonction coeff_compression (exercice_2bis.m) -------------------------------
function gain_comp = gain_compression(coeff_comp_avant,coeff_comp_apres)

gain_comp=coeff_comp_apres/coeff_comp_avant;

end

% Fonction partitionnement_frequences (exercice_3.m) ----------------------
function bornes = partitionnement_frequences(selection_frequences)
bornes=zeros(length(selection_frequences),2);
for indice = 1:length(selection_frequences)
    bornes(indice,2)=bornes(indice,1)+selection_frequences(indice);
    bornes(2:end,1)=bornes(1:end-1,2);
end


end

% Fonction codage_arithmetique (exercice_3.m) -----------------------------
function [borne_inf,borne_sup] = ...
                       codage_arithmetique(texte,selection_alphabet,bornes)
borne_inf=0;
borne_sup=1;
for indice = 1:length(texte)
    j=find(selection_alphabet==texte(indice));
    largeur = borne_sup-borne_inf;
    borne_sup = borne_inf+largeur*bornes(2,j);
    borne_inf = borne_inf+largeur*bornes(1,j);
%non fini
end
    
end
