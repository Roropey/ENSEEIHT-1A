function Slot_utile = Detection_slot_utile(signal,T,Fe)
    %% Détection du slot utile
    %Calcul du nombre de slots
    nb_slot=length(signal)/(T*Fe);
    %Séparation du signal en différents slots
    signaux_slots=reshape(signal,[T*Fe nb_slot]);
    %Recherche du slot ayant le plus d'énergie
    [~,position_max]=max(sum(abs(signaux_slots),1)./length(signaux_slots));
    Slot_utile=signaux_slots(:,position_max);
end