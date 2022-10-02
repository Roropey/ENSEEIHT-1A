with Ada.Unchecked_Deallocation;


package body Arbre is
    
    procedure Free is
		new Ada.Unchecked_Deallocation (Object => Noeud, Name => T_Arbre);
    
    
    procedure Initialiser(Abr : out T_Arbre) is
    begin
        Abr := null;
    end Initialiser;
    
    
    function Est_Vide(Abr : in T_Arbre) return Boolean is
    begin
        return Abr = null;
    end Est_Vide;
    
    
    procedure Enregistrer (Abr : in out T_Arbre;
                           Cle : in T_Cle; Valeur : in T_Valeur;
                           Arbre_Gauche : in T_Arbre;
                           Arbre_Droite : in T_Arbre) is
    begin
        if Abr = null then
            Abr := new Noeud;
        end if;

        Abr.Cle := Cle;
        Abr.Valeur := Valeur;
        Abr.Gauche := Arbre_Gauche;
        Abr.Droite := Arbre_Droite;
    end Enregistrer;


    -- Supprimer tous les éléments d'un Abr.
    procedure Vider (Abr : in out T_Arbre) is
            
    begin
        if Abr = null then
            Free(Abr);
        else
            Vider(Abr.all.Gauche);
            Vider(Abr.all.Droite);
            Free(Abr);
        end if;
    end Vider;
             

    procedure Pour_Chaque (Abr : in T_Arbre) is
	begin
        if Abr = null then
            null;
        else
            Traiter (Abr.Cle,Abr.Valeur);

            Pour_Chaque (Abr.Gauche);
            Pour_Chaque (Abr.Droite);
        end if;
    exception
        -- On continue le traitement si une exception survient
        when others => 
            Pour_Chaque (Abr.Gauche);
            Pour_Chaque (Abr.Droite);
	end Pour_Chaque;
   
end Arbre;
