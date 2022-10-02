function signal_filtre_haut = filtrage_passe_haut(signal,ordre_de_filtrage,fc_haut,Fe,T,Affichage)
plage=(-(ordre_de_filtrage-1)/2:(ordre_de_filtrage-1)/2)*(1/Fe);
Impulsion=(dirac(plage)==Inf)-2*fc_haut*sinc(2*fc_haut*plage)/Fe;
signal_filtre_haut=filter(Impulsion,[1],signal);

if Affichage
    figure;
    subplot(2,2,1)
    plot(plage,Impulsion)
    title('Impulsion temporelle haut')
    xlabel('s')
    ylabel('Filtre passe-haut échantilloné')

    FourrierImp=fftshift(fft(ifftshift(Impulsion)));;
    subplot(2,2,2)
    plot(plage*Fe*Fe/ordre_de_filtrage,(FourrierImp))
    title('Impulsion fréquentielle haut')
    xlabel('Hz')
    ylabel('Module TFD')

    subplot(2,2,[3,4]);
    plot(plage*Fe*Fe/ordre_de_filtrage,(FourrierImp))
    hold on;
    module_signal=abs(fftshift(fft(signal)));
    plage_module=(-Fe/2:Fe/(length(module_signal)-1):Fe/2);
    facteur=max(FourrierImp)/max(module_signal);
    plot(plage_module,module_signal*facteur)
    hold off;
    title('Module signal et impulsion haut')
    xlabel('Hz')
    ylabel('Module TFD')
end  

end