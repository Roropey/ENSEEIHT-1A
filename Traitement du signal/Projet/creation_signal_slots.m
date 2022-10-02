function signal_MFTDMA = generation_signal_slots(signal_m,slot,nb_slot,Fe,T)
%Création du signal avec tous ces slots pour le moment vide
signal_MFTDMA=zeros(nb_slot*T*Fe,1);
%Mise en place du signal m sur le slot correspondant
signal_MFTDMA((slot-1)*T*Fe:slot*T*Fe-1)=signal_m;
end