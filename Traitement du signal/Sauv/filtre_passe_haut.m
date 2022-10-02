clear all;
close all;

T=40*(10^-3);
f1=0;
f2=46000;
Fe=120000;
ordre_filtre=61;

fc=(max(f2,f1)-min(f2,f1))/2;
plage=(-(ordre_filtre-1)/2:(ordre_filtre-1)/2)*(1/Fe);
Impulsion=(dirac(plage)==Inf)-2*fc*sinc(2*fc*plage);

subplot(2,1,1)
plot(plage,Impulsion)
title('Ordre 61')
xlabel('s')
ylabel('Filtre passe-bas échantilloné')

FourrierImp=fftshift(fft(ifftshift(Impulsion)));
subplot(2,1,2)
plot(plage*Fe*Fe/ordre_filtre,(FourrierImp))
title('Ordre 61')
xlabel('Hz')
ylabel('Module TFD')

signal_recu=Signal_transmit();

figure;
plot(plage*Fe*Fe/ordre_filtre,(FourrierImp))
hold on;
module_signal=abs(fft(signal_recu));
plage_module=(-Fe/2:Fe/(length(module_signal)-1):Fe/2);
plot(plage_module,module_signal*100)
hold off;