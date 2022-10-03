function signal_bande_base = retour_bande_base(signal,ordre_filtrage,frequence,Fe,T)
if frequence==0
    signal_bande_base=signal;
else
    plage_signal=(0:T*5/(length(signal)-1):T*5);
    signal_avant_filtre=cos(2*pi*frequence*plage_signal)'.*signal;
    signal_bande_base=filtrage_passe_bas(signal_avant_filtre,ordre_filtrage,frequence,Fe,T,false);
end
end