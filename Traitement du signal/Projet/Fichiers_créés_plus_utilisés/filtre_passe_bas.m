clear;
close all;

T=40*(10^-3);
f1=0;
f2=46000;
Fe=120000;
ordre_filtre=61;

fc=(max(f2,f1)-min(f2,f1))/2;
plage=(-(ordre_filtre-1)/2:(ordre_filtre-1)/2)*(1/Fe);
Impulsion=2*fc*sinc(2*fc*plage);

subplot(2,1,1);
plot(plage,Impulsion)
title(strcat("Ordre ",int2str(ordre_filtre)));
xlabel('s');
ylabel('Filtre passe-bas échantilloné');

FourrierImp=fftshift(fft(ifftshift(Impulsion)));
subplot(2,1,2)
plot(plage*Fe*Fe/ordre_filtre,(FourrierImp))
title('Ordre 61')
xlabel('Hz')
ylabel('Module TFD')

signal_recu=Signal_transmit(f1,f2,Fe,T,2,5,5,100,true);

figure;
plot(plage*Fe*Fe/ordre_filtre,(FourrierImp))
hold on;
module_signal=abs(fftshift(fft(signal_recu)));
plage_module=(-Fe/2:Fe/(length(module_signal)-1):Fe/2);
semilogy(plage_module,module_signal*100) %ptt supprimer le *100
hold off;