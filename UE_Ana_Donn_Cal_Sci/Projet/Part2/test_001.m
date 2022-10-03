clear all;
format long;


N = [1 5 10 20 50 100 200 500 800];

T_v0 = zeros(4,length(N)); %temps pour différent n et matrices pour eig
T_v1 = zeros(4,length(N)); %temps pour différent n et matrices pour la méthode de la puissance itérée
T_v2 = zeros(4,length(N)); %temps pour différent n et matrices pour la méthode de la puissance itérée modifiée


for j=1:length(N)

    n =N(j);
    for i=1:4
        
        imat = i;
        genere = 1;
        
        % méthode de calcul
        v = 10; % eig
        t_v0=cputime;
        [W, V, flag] = eigen_2022(imat, n, v, [], [], [], [], [], genere);
        t_v0=cputime-t_v0;
        if (flag == 0)
            T_v0(i,j)=t_v0;
        elseif (flag == 1)
            % Pourcentage non atteint = pas de temps -> NaN
            T_v0(i,j)="Pourcentage non atteint";
        else
            % Convergence non atteint = temps indéterminer -> Inf
            T_v0(i,j)=Inf;
        end;
        % nombre maximum de couples propres calculés
        m = 100;
        percentage = 0.4;
        
        genere = 0;
        
        % méthode de calcul
        v = 11; % power
        % tolérance
        eps = 1e-8;
        % nombre d'itérations max pour atteindre la convergence
        maxit = 10000;
        
        t_v1 = cputime;
        [W, V, flag] = eigen_2022(imat, n, v, m, eps, maxit, percentage, [], genere);
        t_v1 = cputime-t_v1;
        if (flag == 0)
            T_v1(i,j)=t_v1;
        elseif (flag == 1)
            % Pourcentage non atteint = pas de temps -> NaN
            T_v1(i,j)=NaN;
        else
            % Convergence non atteint = temps indéterminer -> Inf
            T_v1(i,j)=Inf;
        end;
        
        
        % méthode de calcul
        v = 12; % power modified
        
        t_v2 = cputime;
        [W, V, flag] = eigen_2022(imat, n, v, m, eps, maxit, percentage, [], genere);
        t_v2 = cputime-t_v2;
        if (flag == 0)
            T_v2(i,j)=t_v2;
        elseif (flag == 1)
            % Pourcentage non atteint = pas de temps -> NaN
            T_v2(i,j)=NaN;
        else
            % Convergence non atteint = temps indéterminer -> Inf
            T_v2(i,j)=Inf;
        end;
        
        
    end;
end;

