with Ada.Streams.Stream_IO; use Ada.Streams.Stream_IO;
with Arbre; 
with Liste_Chainee;
with Flux_Binaire; use Flux_Binaire;


package Types_Huffman is

    Symbole_Fin : constant T_Octet := T_Octet'Last;
    
    Fichier_Inexistant_Exception : Exception;
    Arbre_Huffman_Vide : Exception;
    Pas_Compression_Huffman : Exception;

    package Arbre_Integer_Octet is
            new Arbre (T_Cle => Integer, T_Valeur => T_Octet);
    
    package Liste_Chainee_Octet is
            new Liste_Chainee (T_Valeur => T_Octet);


    subtype Intervalle_Ascii is T_Octet range T_Octet'First .. T_Octet'Last;
    
    type T_Frequences is array (Intervalle_Ascii) of Integer;

    type T_Liste is array (0..257) of Arbre_Integer_Octet.T_Arbre;
    
    type T_Tableau is record
        Taille : Integer;
        Tableau : T_Liste;
    end record;

    type T_Codage is array (Intervalle_Ascii) of T_Flux_Binaire;

    type T_Flux_Fichier is record
        Flux_Interne : Stream_Access;
        Octet : T_Octet;
        Indice_Bit : Integer;
    end record;

end Types_Huffman;
