clear all;
close all;

load('donnees1.mat');
load('donnees2.mat');

T=40*(10^-3);
f1=0;
f2=46000;
Fe=120000;
bruit=100;

signal_m1=modulateur_base(bits_utilisateur1,Fe,T);
signal_m2=modulateur_base(bits_utilisateur2,Fe,T);

signal_5_slots_1=creation_signal_slots(signal_m1,2,5,Fe,T);
signal_5_slots_2=creation_signal_slots(signal_m2,5,5,Fe,T);

figure;

%Signaux sur slot avant mise sur porteuse
subplot(2,2,1);
plage_signal_1=(0:T*5/(length(signal_5_slots_1)-1):T*5);
plot(plage_signal_1,signal_5_slots_1)
title('Signal sur 5 slots utilisateur 1');
xlabel('Temps (s)');
ylabel('Signal');


subplot(2,2,2);
plage_signal_2=(0:T*5/(length(signal_5_slots_2)-1):T*5);
plot(plage_signal_2,signal_5_slots_2)
title('Signal sur 5 slots utilisateur 2');
xlabel('Temps (s)');
ylabel('Signal');

%Signaux sur slot après mise sur porteuse
subplot(2,2,3);
signal_porteuse_1=cos(2*pi*f1*plage_signal_1)'.*signal_5_slots_1;
plot(plage_signal_1,signal_porteuse_1)
title('Signal sur 5 slots utilisateur 1 sur porteuse');
xlabel('Temps (s)');
ylabel('Signal');

subplot(2,2,4);
signal_porteuse_2=cos(2*pi*f2*plage_signal_1)'.*signal_5_slots_2;
plot(plage_signal_2,signal_porteuse_2)
title('Signal sur 5 slots utilisateur 2 sur porteuse');
xlabel('Temps (s)');
ylabel('Signal');


figure;
%Signal avant bruit
signal_total_avant_bruit=signal_porteuse_1+signal_porteuse_2;
subplot(2,1,1);
plage_signal_total=(0:T*5/(length(signal_total_avant_bruit)-1):T*5);
plot(plage_signal_total,signal_total_avant_bruit)
title('Addition du signal 1 et 2 avant bruit');
xlabel('Temps (s)');
ylabel('Signal');

%Signal après bruit
signal_total_apres_bruit=awgn(signal_total_avant_bruit,bruit);
subplot(2,1,2);
plot(plage_signal_total,signal_total_apres_bruit)
title('Addition du signal 1 et 2 apres bruit');
xlabel('Temps (s)');
ylabel('Signal');

figure;
%Densité de puissance avant bruit
periodogram_av=abs(fft(xcorr(signal_total_avant_bruit,'biased')));
subplot(2,1,1);
plage_av=(-Fe/2:Fe/(length(periodogram_av)-1):Fe/2);
semilogy(plage_av,fftshift(periodogram_av))
title('Periodogramme du signal avant bruit');
xlabel('Hz');
ylabel('Module DSP');


%Densité de puissance après bruit
periodogram_ap=abs(fft(xcorr(signal_total_apres_bruit,'biased')));
subplot(2,1,2);
plage_ap=(-Fe/2:Fe/(length(periodogram_ap)-1):Fe/2);
semilogy(plage_ap,fftshift(periodogram_ap))
title('Periodogramme du signal après bruit');
xlabel('Hz');
ylabel('Module DSP');