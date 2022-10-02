clear;
close all;
clc;

% Codage de Huffman de l'image initiale :
load exercice_1_TP1;
frequences = histogramme/sum(histogramme);
dico = huffmandico(I_min:I_max,frequences);
image_encodee = huffmanencode(I(:),dico); % AJOUTE

% Calcul du coefficient de compression obtenu par le codage de Huffman :
% coeff_compression_avant_decorrelation = coeff_compression_image(histogramme,dico);
coeff_compression_avant_decorrelation = fonctions_TP2_proba('coeff_compression',I(:),image_encodee);
fprintf('Coefficient de compression avant decorrelation : %.4f\n',coeff_compression_avant_decorrelation);

% Codage de Huffman de l'image decorrelee :
load exercice_2_TP1;
set(0,'RecursionLimit',550);	% Plus de 500 appels recursifs (nombre d'entiers a coder : 2*I_max+1 = 511 > 500)
frequences = histogramme/sum(histogramme);
dico = huffmandico(I_min:I_max,frequences);
image_encodee = huffmanencode(I_decorrelee(:),dico);

% Calcul du coefficient de compression obtenu par decorrelation prealable au codage de Huffman :
% coeff_compression_apres_decorrelation = coeff_compression_image(histogramme,dico);
coeff_compression_apres_decorrelation = fonctions_TP2_proba('coeff_compression',I_decorrelee(:),image_encodee);
fprintf('Coefficient de compression apres decorrelation : %.4f\n',coeff_compression_apres_decorrelation);

% Calcul du gain en compression :
gain_compression_apres_decorrelation = fonctions_TP2_proba('gain_compression', ...
     coeff_compression_avant_decorrelation,coeff_compression_apres_decorrelation);
fprintf('Gain en compression : %.4f\n',gain_compression_apres_decorrelation);
