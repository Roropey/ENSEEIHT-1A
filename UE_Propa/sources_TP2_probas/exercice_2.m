clear;
close all;
clc;

load exercice_0;

% Encodage du texte :
alphabet_cell = num2cell(selection_alphabet);			% Format 'cell' requis par la fonction huffmandict
dico = huffmandico(alphabet_cell,selection_frequences);	% dico{j,2} = code binaire du caractere ASCII dico{j,1}
texte_encode = huffmanencode(texte,dico);
fprintf('Codage binaire du texte : %s\n',strrep(num2str(texte_encode),' ',''));

% Calcul du coefficient de compression obtenu par le codage de Huffman :
coeff_compression = fonctions_TP2_proba('coeff_compression',texte,texte_encode);
fprintf('Coefficient de compression : %.4f\n',coeff_compression);

% Decodage du texte : 
texte_decode = huffmandecode(texte_encode,dico);

% Verification de l'integrite du texte decode :
integrite_decodage = ~strcmp(texte,texte_decode);
if integrite_decodage
	fprintf('Integrite du decodage OK\n');
else
	fprintf('Probleme d''integrite du decodage !\n');
end
