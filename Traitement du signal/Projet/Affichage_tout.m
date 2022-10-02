%% Nettoyage mémoire et affichage
clear;
close all;

%% Variables données par le sujet
T=40*(10^-3);
f1=0;
Slot1=2;
f2=46000;
Slot2=5;
Fe=120000;
Slot_tot=5;
Bruit=100;

%% Variable pour afficher ou non les courbes (true => afficher)
Affichage=true;

%% Lecture des messages des utilisateurs
load('donnees1.mat');
load('donnees2.mat');

%% Variables utilisées
ordre_filtre=201;
fc=23000;

%% Création signal MF-TDMA : Partie 3.2
[signal_recu,Ts_1,Ts_2]=Signal_transmit(bits_utilisateur1,f1,Slot1,bits_utilisateur2,f2,Slot2,T,Fe,Slot_tot,Bruit,Affichage);

%% Filtrage signal reçu : Partie 4.1
    %Filtrage passe-bas : Partie 4.1.1
signal_filtre_bas=filtrage(signal_recu,ordre_filtre,fc,Fe,"bas",Affichage);
    %Filtrage passe-haut : Partie 4.1.2
signal_filtre_haut=filtrage(signal_recu,ordre_filtre,fc,Fe,"haut",Affichage);

%% Remise des différents signaux sur leur bande de base : Partie 4.2
signal_bande_base_bas = retour_bande_base(signal_filtre_bas,ordre_filtre,f1,Fe,Affichage);
signal_bande_base_haut = retour_bande_base(signal_filtre_haut,ordre_filtre,f2,Fe,Affichage);

%% Extraction des slots utiles des signaux : Partie 4.3
slot_bas = Detection_slot_utile(signal_bande_base_bas,T,Fe);
slot_haut = Detection_slot_utile(signal_bande_base_haut,T,Fe);

%% Récuparation des bits des messages : Partie 4.4
bits_recup_utilisateur1 = demodulateur_bande_base(slot_bas,T,Fe,Ts_1);
bits_recup_utilisateur2 = demodulateur_bande_base(slot_haut,T,Fe,Ts_2);

%% Affichage des messages
disp("Le message de l'utilisateur 1 est :");
message_1 = bin2str(bits_recup_utilisateur1);
disp(message_1);
disp("Le message de l'utilisateur 2 est :");
message_2 = bin2str(bits_recup_utilisateur2);
disp(message_2);