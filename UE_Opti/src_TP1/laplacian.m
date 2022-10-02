function L = laplacian(nu,dx1,dx2,N1,N2)
%
%  Cette fonction construit la matrice de l'opérateur Laplacien 2D anisotrope
%
%  Inputs
%  ------
%
%  nu : nu=[nu1;nu2], coefficients de diffusivité dans les dierctions x1 et x2. 
%
%  dx1 : pas d'espace dans la direction x1. (h1)
%
%  dx2 : pas d'espace dans la direction x2. (h2)
%
%  N1 : nombre de points de grille dans la direction x1.
%
%  N2 : nombre de points de grilles dans la direction x2.
%
%  Outputs:
%  -------
%
%  L      : Matrice de l'opérateur Laplacien (dimension N1N2 x N1N2)
%
% 

% Initialisation
%A1 = ones(N1*N2,1).*((-nu(1))/(dx1^2));
%A2 = ones(N1*N2,1).*((-nu(2))/(dx1^2));
%A3 = (-A1-A2)*2;
%A2(N2+1:N2:end)=0;
%L=spdiags([A1, A2, A3, A1],[-1-N2 -1 0 1 N2+1],N1*N2,N1*N2); % problème

A1=spdiags([1 -2 1],[-1-N2 0 N2+1],N1*N2,N1*N2).*((-nu(1))/(dx1^2));
A2=spdiags([1 -2 1],[-1 0 -1],N1*N2,N1*N2).*((-nu(2))/(dx1^2));
L=A1+L2;


end    
