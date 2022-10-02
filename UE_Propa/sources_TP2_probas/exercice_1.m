clear;
close all;
clc;

% Chargement des donnees :
S = load('donnees_textes.mat');
textes_courts = S.textes_courts;
textes_longs = S.textes_longs;
frequences_langues = S.frequences_langues;
alphabet  = S.alphabet;
langues = S.langues;


% Initialisation des compteurs de langues bien determinees pour les textes courts :
langues_correctes_courts_L1 = 0;
langues_correctes_courts_L2 = 0;
langues_correctes_courts_Linfini = 0;
% Determination de la langue des textes courts avec les trois normes :
for i = 1:length(textes_courts)
    fprintf('Texte : %s\n',textes_courts{i});
    % Calcul des frequences d'apparitions des lettres du texte i :
    frequences_texte = fonctions_TP2_proba('calcul_frequences_caracteres',textes_courts{i}, alphabet);
    % Determination de la langue du texte i :
    num_langue_L1 = fonctions_TP2_proba('determination_langue',frequences_texte, frequences_langues,'L1');
    num_langue_L2 = fonctions_TP2_proba('determination_langue',frequences_texte, frequences_langues,'L2');
    num_langue_Linfini = fonctions_TP2_proba('determination_langue',frequences_texte, frequences_langues,'Linf');
    % Affichage des langues trouvees avec les trois normes
    fprintf('Langue > [attendue : %s] [norme L1 : %s] [norme L2 : %s] [norme Linf : %s]\n\n', ...
            langues{i}, langues{num_langue_L1}, langues{num_langue_L2}, langues{num_langue_Linfini});
    % Incrementation des compteurs si la langue trouvee est la bonne :
    langues_correctes_courts_L1 = langues_correctes_courts_L1 + (i == num_langue_L1);
    langues_correctes_courts_L2 = langues_correctes_courts_L2 + (i == num_langue_L2);
    langues_correctes_courts_Linfini = langues_correctes_courts_Linfini + (i == num_langue_Linfini);
end
% Affichage du nombre de langues correctements trouvees parmi les textes courts :
fprintf('Sur les textes courts, la norme L1 a permis de determiner correctement %d textes sur %d.\n', langues_correctes_courts_L1, length(textes_courts));
fprintf('Sur les textes courts, la norme L2 a permis de determiner correctement %d textes sur %d.\n', langues_correctes_courts_L2, length(textes_courts));
fprintf('Sur les textes courts, la norme Linf a permis de determiner correctement %d textes sur %d.\n\n', langues_correctes_courts_Linfini, length(textes_courts));


% Initialisation des compteurs de langues bien determinees pour les textes longs :
langues_correctes_longs_L1 = 0;
langues_correctes_longs_L2 = 0;
langues_correctes_longs_Linfini = 0;
% Determination de la langue des textes longs avec les trois normes :
for i = 1:length(textes_longs)
    fprintf('Texte : %s\n',textes_longs{i});
    % Calcul des frequences d'apparitions des lettres du texte i :
    frequences_texte = fonctions_TP2_proba('calcul_frequences_caracteres',textes_longs{i}, alphabet);
    % Determination de la langue du texte i :
    num_langue_L1 = fonctions_TP2_proba('determination_langue',frequences_texte, frequences_langues,'L1');
    num_langue_L2 = fonctions_TP2_proba('determination_langue',frequences_texte, frequences_langues,'L2');
    num_langue_Linfini = fonctions_TP2_proba('determination_langue',frequences_texte, frequences_langues,'Linf');
    % Affichage des langues trouvees avec les trois normes :
    fprintf('Langue > [attendue : %s] [norme L1 : %s] [norme L2 : %s] [norme Linf : %s]\n\n', ...
            langues{i}, langues{num_langue_L1}, langues{num_langue_L2}, langues{num_langue_Linfini});
    % Incrementation des compteurs si la langue trouvee est la bonne :
    langues_correctes_longs_L1 = langues_correctes_longs_L1 + (i == num_langue_L1);
    langues_correctes_longs_L2 = langues_correctes_longs_L2 + (i == num_langue_L2);
    langues_correctes_longs_Linfini = langues_correctes_longs_Linfini + (i == num_langue_Linfini);
end
% Affichage du nombre de langues correctements trouvees parmi les textes longs :
fprintf('Sur les textes longs, la norme L1 a permis de determiner correctement %d textes sur %d.\n', langues_correctes_longs_L1, length(textes_courts));
fprintf('Sur les textes longs, la norme L2 a permis de determiner correctement %d textes sur %d.\n', langues_correctes_longs_L2, length(textes_courts));
fprintf('Sur les textes longs, la norme Linf a permis de determiner correctement %d textes sur %d.\n', langues_correctes_longs_Linfini, length(textes_courts));
