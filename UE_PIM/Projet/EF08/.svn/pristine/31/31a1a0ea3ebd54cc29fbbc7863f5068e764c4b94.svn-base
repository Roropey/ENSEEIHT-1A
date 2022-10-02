with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Flux_Binaire is

    Taille_Tableau_Masques : constant Integer := 8;
    type T_Tableau_Masques is array (1..Taille_Tableau_Masques) of T_Octet;

    Masques_Un_Droite : constant T_Tableau_Masques :=
        (2#0000_0001#, 2#0000_0011#, 2#0000_0111#, 2#0000_1111#,
         2#0001_1111#, 2#0011_1111#, 2#0111_1111#, 2#1111_1111#);

    Masques_Zero_Droite : constant T_Tableau_Masques :=
        (2#1111_1110#, 2#1111_1100#, 2#1111_1000#, 2#1111_0000#,
         2#1110_0000#, 2#1100_0000#, 2#1000_0000#, 2#0000_0000#);


    -- Initialiser un flux. Le flux est Vide;
    procedure Initialiser (Flux: out T_Flux_Binaire) is
    begin
        Flux.Nombre_Bits_Inutilises := 0;
        Initialiser (Flux.Liste);
    end Initialiser;


    -- Est-ce qu'un flux est vide ?
    function Est_Vide (Flux : in T_Flux_Binaire) return Boolean is
    begin
        return Est_Vide (Flux.Liste);
    end Est_Vide;


    -- Obtenir le nombre d'octets d'un flux.
    function Taille (Flux : in T_Flux_Binaire) return Integer is
    begin
        return Taille (Flux.Liste);
    end Taille;


    function Le_Bit (Octet : in T_Octet; Indice : in Integer) return T_Bit is
    begin
        return T_Bit (Octet / (2 ** (7 - Indice)) and 1);
    end Le_Bit;


    -- Obtenir l'octet d'indice Indice.
    function L_Octet (Flux : in T_Flux_Binaire;
                      Indice : in Integer) return T_Octet is
    begin
        return La_Valeur (Flux.Liste, Indice);
    end L_Octet;


    -- Ajouter un bit au flux
    procedure Ajouter_Bit (Flux : in out T_Flux_Binaire; Bit : in T_Bit) is
        Octet : T_Octet;
    begin
        if Flux.Nombre_Bits_Inutilises = 0 or else Est_Vide (Flux.Liste) then
            Ajouter (Flux.Liste, T_Octet (Bit) * 2 ** 7, False);
            Flux.Nombre_Bits_Inutilises := 7;
        else
            Octet := La_Valeur (Flux.Liste, Taille (Flux.Liste) - 1);
            Octet := Octet or T_Octet (Bit) * 2 ** (Flux.Nombre_Bits_Inutilises - 1);
            Enregistrer (Flux.Liste, Octet, Taille (Flux.Liste) - 1);
            Flux.Nombre_Bits_Inutilises := Flux.Nombre_Bits_Inutilises - 1;
        end if;
    end Ajouter_Bit;


    -- Ajouter un octet au flux
    procedure Ajouter_Octet (Flux : in out T_Flux_Binaire; Octet : in T_Octet) is
        Dernier_Octet : T_Octet;
    begin
        if Flux.Nombre_Bits_Inutilises = 0 or else Est_Vide (Flux.Liste) then
            Ajouter (Flux.Liste, Octet, False);
        else
            Dernier_Octet := La_Valeur (Flux.Liste, Taille (Flux.Liste) - 1);
            Dernier_Octet := Dernier_Octet or ((Octet and Masques_Zero_Droite (8 - Flux.Nombre_Bits_Inutilises)) / (2 ** (8 - Flux.Nombre_Bits_Inutilises)));
            Enregistrer (Flux.Liste, Dernier_Octet, Taille (Flux.Liste) - 1);

            Dernier_Octet := (Octet and Masques_Un_Droite (8 - Flux.Nombre_Bits_Inutilises)) * 2 ** Flux.Nombre_Bits_Inutilises;
            Ajouter (Flux.Liste, Dernier_Octet, False);
        end if;
    end Ajouter_Octet;


    -- Ajouter un flux a un autre flux
    procedure Ajouter_Flux (Flux : in out T_Flux_Binaire;
                            Flux_Deux : in T_Flux_Binaire) is
        Taille_Deux : Integer;
        Dernier_Octet : T_Octet;
    begin
        if not Est_Vide (Flux_Deux) then
            Taille_Deux := Taille (Flux_Deux);
            for I in 0..(Taille_Deux - 2) loop
                Ajouter_Octet (Flux, L_Octet (Flux_Deux, I));
            end loop;

            Dernier_Octet := L_Octet (Flux_Deux, Taille_Deux - 1);
            for I in 1..(8 - Flux_Deux.Nombre_Bits_Inutilises) loop
                Ajouter_Bit (Flux, T_Bit (Dernier_Octet / (2 ** (8 - I)) and 1));
            end loop;
        end if;
    end Ajouter_Flux;


    -- Supprimer tous les octets d'un flux
    procedure Vider (Flux : in out T_Flux_Binaire) is
    begin
        Flux.Nombre_Bits_Inutilises := 0;
        Vider (Flux.Liste);
    end Vider;


    function Une_Chaine (Flux : in T_Flux_Binaire) return String is
        Chaine : Unbounded_String;
        Octet : T_Octet;
        Taille_Flux : Integer;

        Bit_Vers_Chaine : constant array (T_Bit) of Unbounded_String :=
            (To_Unbounded_String ("0"), To_Unbounded_String ("1"));
    begin
        Chaine := To_Unbounded_String ("");

        Taille_Flux := Taille (Flux);
        for I in 0 .. (Taille_Flux - 2) loop
            Octet := L_Octet (Flux, I);
            for J in 0 .. 7 loop
                Append (Chaine, Bit_Vers_Chaine (Le_Bit (Octet, J)));
            end loop;
            -- Append (Chaine, To_Unbounded_String (" "));
        end loop;

        Octet := L_Octet (Flux, Taille_Flux - 1);
        for I in 0 .. (7 - Flux.Nombre_Bits_Inutilises) loop
            Append (Chaine, Bit_Vers_Chaine (Le_Bit (Octet, I)));
        end loop;

        return To_String (Chaine);
    end Une_Chaine;


    -- Appliquer un traitement (Traiter) pour chaque Octet d'un Flux.
    procedure Pour_Chaque (Flux : in T_Flux_Binaire) is
        procedure Pour_Chaque_Octet is new Liste_Octet.Pour_Chaque (Traiter => Traiter);
    begin
        Pour_Chaque_Octet (Flux.Liste);
	end Pour_Chaque;

end Flux_Binaire;
