clear;
close all;

load Data_Exo_2/SG5.mat;
load Data_Exo_2/ImSG5.mat;
%% MCO
A = [-Data(:) ones(length(Data(:)),1)];
b= log(DataMod(:))
beta_MCO = A\b;

Im_estime = (log(ImMod)-beta_MCO(2))./(-beta_MCO(1));

Erreur = sqrt(mean((I(:)-Im_estime(:)).^2));

fprintf('Erreur de l''estimation par MCO = %.5f\n', Erreur);

figure('Name','Originale');
imshow(I);
figure('Name','Estimée');
imshow(Im_estime);

%% MCT

[U,S,V] = svd([A b]);

beta_MCT = (-1/V(end,end)).*(V(1:end-1,end));

Im_estime = (log(ImMod)-beta_MCT(2))./(-beta_MCT(1));

Erreur = sqrt(mean((I(:)-Im_estime(:)).^2));

fprintf('Erreur de l''estimation par MCT = %.10f\n', Erreur);

figure('Name','Estimée');
imshow(Im_estime);