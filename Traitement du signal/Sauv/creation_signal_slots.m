function signal_MFTDMA = generation_signal_slots(signal_m,slot,nb_slot,Fe,T)
signal_MFTDMA=zeros(nb_slot*T*Fe,1);
signal_MFTDMA((slot-1)*T*Fe:slot*T*Fe-1)=signal_m;
end