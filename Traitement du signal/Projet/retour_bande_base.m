function signal_bande_base = retour_bande_base(signal,ordre_filtrage,frequence,Fe,Affichage)
%% Calcul du signal sur la bande de base
if frequence==0
    %Si la fréquence porteuse est 0, il es inutile de retourner sur la
    %bande de base (car cos(0) = 1)
    signal_bande_base=signal;
else
    %Multiplication par le cosinus de la fréquence porteuse
    plage_signal=(0:(length(signal)-1))/Fe;
    signal_avant_filtre=cos(2*pi*frequence*plage_signal)'.*signal;
    %Filtrage pour obtenir le signal sur la bande de base
    signal_bande_base=filtrage(signal_avant_filtre,ordre_filtrage,frequence,Fe,"bas",false);

end
%% Affichage du résultat
if Affichage
    figure('Name',strcat("Signal remi sur leur bande de base pour ",int2str(frequence)," Hz"));
    plage_bande=(0:(length(signal_bande_base)-1))/Fe;
    plot(plage_bande,signal_bande_base)
    title("Signal filtré sur la bande de base");
    xlabel('Temps (s)');
    ylabel('Amplitude');
end
end