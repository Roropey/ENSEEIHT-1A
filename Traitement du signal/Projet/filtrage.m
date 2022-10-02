function signal_filtre = filtrage(signal,ordre_de_filtrage,fc,Fe,Bande,Affichage)
%% Détermination de l'impulsion de filtrage en fontion des entrées de la fonction
plage=(-(ordre_de_filtrage-1)/2:(ordre_de_filtrage-1)/2)*(1/Fe);
if Bande == "bas"
    Impulsion=2*fc*sinc(2*fc*plage)/Fe;
elseif Bande == "haut"
    Impulsion=-2*fc*sinc(2*fc*plage)/Fe;
    Impulsion(((ordre_de_filtrage-1)/2)+1)=Impulsion(((ordre_de_filtrage-1)/2)+1)+1;
else
    error('Choix filtrage non supporté, choississez soit "bas" soit "haut"');
end
%% Filtrage
%Décalage pour prendre en compte le délais
signal_decale=[signal;zeros(((ordre_de_filtrage-1)/2),1)]; 
%{entre le dirac à 0 (ce qui nous intéresse) et le début de la réponse
%impulsionnelle, il se déroule un délais

%Filtrage réel
signal_decale_filtre=filter(Impulsion,[1],signal_decale);

%Inversion du décalage après filtrage
signal_filtre=signal_decale_filtre(((ordre_de_filtrage-1)/2)+1:end);

%% Affichages des résultats trouvés
if Affichage
    figure('Name',strcat("Impulsion du filtre passe-",Bande," et signal filtré"));
    
    %Question 4.1.1.1 et 4.1.2.3
    subplot(3,2,1);
    plot(plage,Impulsion,'r')
    title(strcat("Impulsion temporelle ",Bande));
    xlabel('s');
    ylabel('Amplitude');

    %Question 4.1.1.2 et 4.1.2.3
    FourrierImp=abs(fftshift(fft(ifftshift(Impulsion))));
    subplot(3,2,2);
    semilogy(plage*Fe*Fe/ordre_de_filtrage,(FourrierImp),'r')
    title(strcat("Impulsion fréquentielle ",Bande));
    xlabel('Hz');
    ylabel('Module TFD');
    
    %Question 4.1.1.2 et 4.1.2.4
    subplot(3,2,[3,4]);
    module_signal=abs(fft(xcorr(signal,'unbiased')));
    plage_module=(-Fe/2:Fe/(length(module_signal)-1):Fe/2);
    s1 = semilogy(plage_module,fftshift(module_signal));
    hold on;   
    s2 = semilogy(plage*Fe*Fe/ordre_de_filtrage,(FourrierImp),'r','Linewidth',1);
    hold off;
    title(strcat("Module signal et impulsion ",Bande));
    legend([s1, s2],"Module du signal","Module de l'impulsion")
    xlabel('Hz');
    ylabel('Module TFD');
    
    %Question 4.1.3
    subplot(3,2,[5 6]);    
    plage_filtre=(0:(length(signal_filtre)-1))/Fe;
    plot(plage_filtre,signal_filtre)
    title(strcat("Signal filtré par passe-",Bande));
    xlabel('Temps (s)');
    ylabel('Amplitude');

end

end