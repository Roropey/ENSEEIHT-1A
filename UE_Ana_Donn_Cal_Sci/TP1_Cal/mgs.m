%--------------------------------------------------------------------------
% ENSEEIHT - 1SN - Calcul scientifique
% TP1 - Orthogonalisation de Gram-Schmidt
% mgs.m
%--------------------------------------------------------------------------

function Q = mgs(A)

    % Recuperation du nombre de colonnes de A
    [~, m] = size(A);
    
    % Initialisation de la matrice Q avec la matrice A
    Q = A;
    
    %------------------------------------------------
    % Algorithme de Gram-Schmidt modifie
    Q(:,1) = A(:,1)./norm(A(:,1));
    for i = 2:m
        y = A(:,i);
        for j = 1:i-1
            Composante = y'*Q(:,j);
            y = y - Composante*Q(:,j);
        end;
        Q(:,i)= y./norm(y);
    end;    
    %------------------------------------------------

end