function [signal_MFTDMA,Ts] = Signal_transmit (bits_utilisateur1,f1,bits_utilisateur2,f2,Fe,T,slot_1,slot_2,nb_slots,bruit,Affichage)

%Création des signaux m1 et m2 : Partie 3.2.1
[signal_m1,Ts1]=modulateur_base(bits_utilisateur1,Fe,T);
[signal_m2,Ts2]=modulateur_base(bits_utilisateur2,Fe,T);

Ts=min(Ts1,Ts2);

%Placement des signaux sur les slots et mise en place sur fréquences porteuses : Partie 3.2.2.1
signal_1=creation_signal_slots(signal_m1,slot_1,nb_slots,Fe,T);
signal_2=creation_signal_slots(signal_m2,slot_2,nb_slots,Fe,T);
signal_avant_bruit=cos(2*pi*f1*(0:(length(signal_1)-1))/Fe)'.*signal_1+cos(2*pi*f2*(0:(length(signal_2)-1))/Fe)'.*signal_2;

%Génération du bruit et ajout au signal pour obtenir le signal MF-TDMA
signal_bruit=randn(length(signal_avant_bruit),1)*sqrt(10^(-bruit/10));
signal_MFTDMA=signal_bruit+signal_avant_bruit;

if Affichage
      

    %Affichage m1 et m2 et leurs densités spéctrales de puissance
    figure('Name','Modulation bande base');
        %Affichage de m1 et m2 : Question 3.2.1.2
    subplot(2,2,1);
    plage_signal_m1=(0:(length(signal_m2)-1))/Fe;
    plot(plage_signal_m1,signal_m1)
    title("Signal m1");
    xlabel("Temps (s)");
    ylabel("Amplitude");
    subplot(2,2,3);
    plage_signal_m2=(0:(length(signal_m2)-1))/Fe;
    plot(plage_signal_m2,signal_m2)
    title("Signal m2");
    xlabel("Temps (s)");
    ylabel("Amplitude");
        %Calcul et affichage des densités spéctrales de puissance de m1 et
        %m2 par périodogramme (corrélogramme biaisé) : Question 3.2.1.3
    periodogram_m1=abs(fft(xcorr(signal_m1,'unbiased')));
    periodogram_m2=abs(fft(xcorr(signal_m2,'unbiased')));
    subplot(2,2,2);
    plage_m1=(-Fe/2:Fe/(length(periodogram_m1)-1):Fe/2);
    semilogy(plage_m1,fftshift(periodogram_m1))
    title('Periodogramme du signal m1');
    xlabel('Hz');
    ylabel('Module DSP');
    subplot(2,2,4);
    plage_m2=(-Fe/2:Fe/(length(periodogram_m2)-1):Fe/2);
    semilogy(plage_m2,fftshift(periodogram_m2))
    title('Periodogramme du signal m2');
    xlabel('Fréquence (Hz)');
    ylabel('Module DSP');

    %Affichage signaux m1 et m2 sur les slots aloués : Question 3.2.2.1.a
    figure('Name','Signaux placés sur le slot aloués');
    plage_signal=(0:(length(signal_1)-1))/Fe;

    subplot(2,1,1);
    plot(plage_signal,signal_1)
    title(strcat("Signal sur ",int2str(nb_slots)," slots utilisateur 1"));
    xlabel('Temps (s)');
    ylabel('Amplitude');
        
    subplot(2,1,2);
    plot(plage_signal,signal_2)
    title(strcat("Signal sur ",int2str(nb_slots)," slots utilisateur 2"));
    xlabel('Temps (s)');
    ylabel('Amplitude');

    %Calcul densité spéctrale de puissance du signal MF-TDMA par 
    %périodogramme (corrélogramme biaisé)
    periodogram_MFTDMA=abs(fft(xcorr(signal_MFTDMA,'unbiased')));

    %Affichage signal MF-TDMA ainsi que sa densité spéctrale de puissance :
    %Question 3.2.2.2

    figure('Name','Signal MF-TDMA');

    subplot(2,1,1);
    plot(plage_signal,signal_MFTDMA)
    title('Signal MF-TDMA temporel');
    xlabel('Temps (s)');
    ylabel('Amplitude');
    %Question 3.2.2.3
    subplot(2,1,2);
        %Calcul densité spéctrale de puissance du signal MF-TDMA par 
        %périodogramme (corrélogramme biaisé)
    periodogram_MFTDMA=abs(fft(xcorr(signal_MFTDMA,'unbiased')));
    plage_ap=(-Fe/2:Fe/(length(periodogram_MFTDMA)-1):Fe/2);
    semilogy(plage_ap,fftshift(periodogram_MFTDMA))
    title('Signal MF-TDMA fréquentielle');
    xlabel('Fréquence (Hz)');
    ylabel('Module DSP');

end
end