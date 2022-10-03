%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Calcul scientifique
% TP1 - Orthogonalisation de Gram-Schmidt
% cgs.m
%--------------------------------------------------------------------------

function Q = cgs(A)

    % Recuperation du nombre de colonnes de A
    [~, m] = size(A);
    
    % Initialisation de la matrice Q avec la matrice A
    Q = A;
    
    %------------------------------------------------
    % Algorithme de Gram-Schmidt classique
    Q(:,1) = A(:,1)./norm(A(:,1));
    for i = 2:m
        Composantes = A(:,i)'*Q(:,1:i-1);
        Vector = A(:,i) - sum(Composantes.*Q(:,1:i-1),2);
        Q(:,i) = Vector ./ norm(Vector);        
    end    
    %------------------------------------------------

end