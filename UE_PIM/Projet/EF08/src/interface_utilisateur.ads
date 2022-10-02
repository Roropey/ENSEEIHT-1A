with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Types_Huffman; use Types_Huffman;
with Flux_Binaire; use Flux_Binaire;


package Interface_utilisateur is

    use Arbre_Integer_Octet;
    

    Trop_Arguments_Exception : Exception;
    Peu_Arguments_Exception : Exception;
    Option_Inconnue_Exception : Exception;
    

    procedure Recuperer_Infos_Utilisateur (Affichage : out Boolean;
                                           Nom_Fichier : out Unbounded_String);

    
    function Le_Caractere (Octet : in T_Octet) return String;

    
    procedure Afficher_Frequences(Tableau_Frequences : in T_Frequences);
    
    
    procedure Afficher_Arbre (Arbre : in T_Arbre;
                              Indentation : in Unbounded_String;
                              Code : in Unbounded_String;
                              Afficher_Frequence : in Boolean);
    
    
    procedure Afficher_Codage (Codage : in T_Codage;
                               Code_Fin : in T_Flux_Binaire);

end Interface_utilisateur;
