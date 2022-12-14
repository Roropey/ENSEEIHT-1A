clear variables;clc
% tolerance relative minimum pour l'ecart entre deux iteration successives 
% de la suite tendant vers la valeur propre dominante 
% (si |lambda-lambda_old|/|lambda_old|<eps, l'algo a converge)
eps = 1e-8;
% nombre d iterations max pour atteindre la convergence 
% (si i > kmax, l'algo finit)
imax = 5000; 

% Generation d une matrice rectangulaire aleatoire A de taille n x p.
% On cherche le vecteur propre et la valeur propre dominants de AA^T puis
% de A^TA
n = 1500; m = 500;
V = 5*randn(n,m);
V = mgs(V);

VVt = V*V'; VtV = V'*V;
%Generate a set of m orthonormal vectors V ∈ Rn×m;
%% Methode de la puissance iteree pour la matrice AAt de taille nxn
% Point de depart de l'algorithme de la puissance iteree : un vecteur
% aleatoire, normalise
x = ones(n,1); x = x/norm(x);

cv = false;
lambda1 = x'*VVt*x;
iv1 = 0;        % pour compter le nombre d'iterations effectuees
t_v1 = cputime; % pour calculer le temps d execution de l'algo
err1 = 0;       % indication que le calcul est satisfaisant
                % on stoppe quand err1 < eps 
%disp('** A COMPLETER ** CONSIGNES EN COMMENTAIRE **')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODER L'ALGORITHME DE LA PUISSANCE ITEREE POUR LA MATRICE VVt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while(~cv)
   %break 
   % /!\ Ce break sert a eviter que vous rentriez dans une boucle infini 
   % si vous lancez ce script avant de l'avoir modifier. Pensez a le 
   % supprimer quand vous coderez la puissance iteree
   mu1 = lambda1;
   x = VVt*x;
   x = x/norm(x);
   lambda1 = x'*VVt*x;
   iv1 = iv1 + 1;
   err1 = abs(lambda1-mu1)/abs(mu1);
   cv = (err1 < eps) | (iv1 > imax);
end
t_v1 = cputime-t_v1; % t_version1 : temps d execution de l algo de la 
                     % puissance iteree pour la matrice AAt

%% Methode de la puissance iteree pour la matrice AtA de taille pxp
% Point de depart de l'algorithme de la puissance iteree : un vecteur
% aleatoire, normalise
y = ones(m,1); 
y = y/norm(y);

cv = false;
lambda2 = y'*VtV*y;
iv2 = 0;        % pour compter le nombre d iterations effectuees
t_v2 = cputime; % pour calculer le temps d execution de l'algo
err2 = 0;       % indication que le calcul est satisfaisant
                % on stoppe quand err2 < eps 
%disp('** A COMPLETER ** CONSIGNES EN COMMENTAIRE **')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CODER L ALGORITHME DE LA PUISSANCE ITEREE POUR LA MATRICE VtV
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while(~cv)
    %break
    % /!\ Ce break sert a eviter que vous rentriez dans une boucle infini
    % si vous lancez ce script avant de l'avoir modifier. Pensez a le
    % supprimer quand vous coderez la puissance iteree
    mu2 = lambda2;
    y = VtV*y;
    y = y/norm(y);
    lambda2 = y'*VtV*y;
    iv2 = iv2 + 1;
    err2 = abs(lambda2-mu2)/abs(mu2);
    cv = (err2 < eps) | (iv2 > imax);
end
t_v2 = cputime-t_v2;


%disp('** A COMPLETER ** CONSIGNES EN COMMENTAIRE **')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% APRES VOUS ETRE ASSURE DE LA CONVERGENCE DES DEUX METHODES, AFFICHER 
% L'ECART RELATIF ENTRE LES DEUX VALEURS PROPRES TROUVEES, ET LE TEMPS
% MOYEN PAR ITERATION POUR CHACUNE DES DEUX METHODES. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('Erreur pour la methode avec la grande matrice = %0.3e\n', err1);
fprintf('Erreur pour la methode avec la petite matrice = %0.3e\n', err2);
fprintf('Ecart relatif entre les deux valeurs propres trouvees = %1.2e\n', abs(lambda1-lambda2));
fprintf('Temps pour une ite avec la grande matrice = %0.3e\n', t_v1/iv1);
fprintf('Temps pour une ite avec la petite matrice = %0.3e\n', t_v2/iv2);

D = eig(VVt);
%D = sort(D, 'ascend'); %Sûr ? 'ascend' trie pas dans l'ordre croissant, nan ? et donc le premier élément n'est pas le + petit (et donc pas la dominante ?)
D = sort(D, 'descend'); % avec ça on trouve le même résultat qu'avec les
%boucles tant que...

fprintf('\nValeur propre dominante (methode avec la grande matrice) = %0.3e\n', lambda1);
fprintf('Valeur propre dominante (methode avec la petite matrice) = %0.3e\n', lambda2);
fprintf('Valeur propre dominante (fonction eig) = %0.3e\n', D(1));
