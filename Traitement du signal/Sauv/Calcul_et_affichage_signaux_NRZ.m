clear all;
close all;

load('donnees1.mat');
load('donnees2.mat');

T=40*(10^-3);
f1=0;
f2=46000;
Fe=120000;

signal_m1=modulateur_base(bits_utilisateur1,Fe,T);
signal_m2=modulateur_base(bits_utilisateur2,Fe,T);

periodogram_m1=abs(fft(xcorr(signal_m1,'biased')));
periodogram_m2=abs(fft(xcorr(signal_m2,'biased')));


figure;

subplot(2,2,1);
plage_signal_m1=(0:T/(length(signal_m2)-1):T);
plot(plage_signal_m1,signal_m1)
title("Signal m1");
xlabel("Temps (s)");
ylabel("Signal");

subplot(2,2,3);
plage_signal_m2=(0:T/(length(signal_m2)-1):T);
plot(plage_signal_m2,signal_m2)
title("Signal m2");
xlabel("Temps (s)");
ylabel("Signal");

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
xlabel('Hz');
ylabel('Module DSP');