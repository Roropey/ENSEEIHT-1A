function signal_filtre = filtrage(signal,ordre_de_filtrage,fc,Fe,Bande,Affichage)

plage=(-(ordre_de_filtrage-1)/2:(ordre_de_filtrage-1)/2)*(1/Fe);
if Bande == "bas"
    Impulsion=2*fc*sinc(2*fc*plage)/Fe;
elseif Bande == "haut"
    Impulsion=-2*fc*sinc(2*fc*plage)/Fe;
    Impulsion(((ordre_de_filtrage-1)/2)+1)=Impulsion(((ordre_de_filtrage-1)/2)+1)+1;
else
    error('Choix filtrage non supporté, choississez soit "bas" soit "haut"');
end

signal_decale=[signal;zeros(((ordre_de_filtrage-1)/2),1)]; 
%{entre le dirac à 0 (ce qui nous intéresse) et le début de la réponse
%impulsionnelle, il se déroule un délais dont le nombre

signal_decale_filtre=filter(Impulsion,[1],signal_decale);
signal_filtre=signal_decale_filtre(((ordre_de_filtrage-1)/2)+1:end);


if Affichage
    figure('Name',strcat("Impulsion du filtre passe-",Bande," et signal filtré"));
    
    subplot(3,2,1);
    plot(plage,Impulsion,'r')
    title(strcat("Impulsion temporelle ",Bande));
    xlabel('s');
    ylabel('Amplitude');

    FourrierImp=abs(fftshift(fft(ifftshift(Impulsion))));
    subplot(3,2,2);
    semilogy(plage*Fe*Fe/ordre_de_filtrage,(FourrierImp),'r')
    title(strcat("Impulsion fréquentielle ",Bande));
    xlabel('Hz');
    ylabel('Module TFD');

    subplot(3,2,[3,4]);
    module_signal=abs(fft(xcorr(signal,'unbiased')));
    plage_module=(-Fe/2:Fe/(length(module_signal)-1):Fe/2);
    s1 = semilogy(plage_module,fftshift(module_signal),'b')
    hold on;   
    s2 = semilogy(plage*Fe*Fe/ordre_de_filtrage,(FourrierImp),'r','Linewidth',1.5)
    hold off;
    title(strcat("Module signal et impulsion ",Bande));
    legend([s1, s2],"Module du signal","Module de l'impulsion")
    xlabel('Hz');
    ylabel('Module TFD');

    subplot(3,2,[5 6]);    
    plage_filtre=(0:(length(signal_filtre)-1))/Fe;
    plot(plage_filtre,signal_filtre,'b')
    title(strcat("Signal filtré par passe-",Bande));
    xlabel('Temps (s)');
    ylabel('Amplitude');

end

end