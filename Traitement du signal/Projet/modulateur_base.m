function [signal_m , Ts] = modulateur_signal_base(bits_utilisateur,Fe,T)
%% Détermination de Ns : Question 3.2.1.1
Ts=T/length(bits_utilisateur);
Ns=floor(Ts/(1/Fe));

%% Création signal m
signal_m=bits_utilisateur(1,:).*2-1;
signal_m=repmat(signal_m,Ns,1);
signal_m=reshape(signal_m,1,length(bits_utilisateur)*Ns);
end