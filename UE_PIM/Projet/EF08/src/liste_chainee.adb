with Ada.Unchecked_Deallocation;

package body Liste_Chainee is

    procedure Free is
		new Ada.Unchecked_Deallocation (Object => T_Cellule, Name => T_Liste_Chainee);


	-- Initialiser une Liste.  La Liste est vide.
    procedure Initialiser (Liste: out T_Liste_Chainee) is
    begin
        Liste := null;
    end Initialiser;


	-- Est-ce qu'une Liste est vide ?
    function Est_Vide (Liste : in T_Liste_Chainee) return Boolean is
    begin
        return Liste = null;
    end Est_Vide;


	-- Obtenir le nombre d'éléments d'une Liste. 
    function Taille (Liste : in T_Liste_Chainee) return Integer is
    begin
        if Liste = null then
            return 0;
        else
            return 1 + Taille (Liste.all.Suivante);
        end if;
    end Taille;


	-- Ajouter une Valeur a la liste
    procedure Ajouter (Liste : in out T_Liste_Chainee;
                       Valeur : in T_Valeur; Au_Debut : in Boolean) is
    begin
        if Liste = null then
            Liste := new T_Cellule'(Valeur, null);
        elsif Au_Debut then
            Liste := new T_Cellule'(Valeur, Liste);
        else
            Ajouter (Liste.all.Suivante, Valeur, False);
        end if;
    end Ajouter;


    procedure Enregistrer (Liste : in out T_Liste_Chainee;
                           Valeur : in T_Valeur; Indice : in Integer) is
    begin
        if Liste = null then
            raise Constraint_Error;
        elsif Indice = 0 then
            Liste.all.Valeur := Valeur;
        else
            Enregistrer (Liste.all.Suivante, Valeur, Indice - 1);
        end if;
    end Enregistrer;


    procedure Inserer_Avant (Liste : in out T_Liste_Chainee;
                             Indice : in Integer; Valeur : in T_Valeur) is
    begin
        if Indice = 0 then
            Liste := new T_Cellule'(Valeur, Liste);
        elsif Liste = null then
            raise Constraint_Error;
        else
            Inserer_Avant (Liste.all.Suivante, Indice - 1, Valeur);
        end if;
    end Inserer_Avant;


	-- Supprimer une valeur dans une Liste.
	-- Exception : Valeur_Absente_Exception si la valeur n'est pas dans la Liste
    procedure Supprimer (Liste : in out T_Liste_Chainee;
                         Valeur : in T_Valeur; Seulement_Une : in Boolean) is
        Cellule : T_Liste_Chainee;
        Doit_Etre_Supprimee : Boolean;
    begin
        if Liste = null then
            if Seulement_Une then
                raise Constraint_Error;
            end if;
        else
            Doit_Etre_Supprimee := Liste.all.Valeur = Valeur;

            if Doit_Etre_Supprimee then
                Cellule := Liste;
                Liste := Liste.all.Suivante;
                Free (Cellule);

                if not Seulement_Une then
                    Supprimer (Liste, Valeur, False);
                end if;        
            else
                Supprimer (Liste.all.Suivante, Valeur, Seulement_Une);
            end if;
        end if;
    end Supprimer;


    procedure Supprimer_Indice (Liste : in out T_Liste_Chainee;
                                Indice : in Integer) is
        Cellule : T_Liste_Chainee;
    begin
        if Indice = 0 then
            Cellule := Liste;
            Liste := Liste.all.Suivante;
            Free (Cellule);
        else
            Supprimer_Indice (Liste.all.Suivante, Indice - 1);
        end if;
    end Supprimer_Indice;


	-- Savoir si une Valeur est présente dans une Liste.
    function Valeur_Presente (Liste : in T_Liste_Chainee;
                              Valeur : in T_Valeur) return Boolean is
    begin
        if Liste = null then
            return False;
        else
            return Liste.all.Valeur = Valeur or else Valeur_Presente (Liste.all.Suivante, Valeur);
        end if;
    end Valeur_Presente;


	-- Obtenir la i-eme valeur de la liste.
    function La_Valeur (Liste : in T_Liste_Chainee;
                        Indice : in Integer) return T_Valeur is
    begin
        if Liste = null then
            raise Constraint_Error;
        elsif Indice = 0 then
            return Liste.all.Valeur;
        else
            return La_Valeur (Liste.all.Suivante, Indice - 1);
        end if; 
    end La_Valeur;


    -- Obtenir le premier indice d'une valeur, -1 si pas presente
    function L_Indice (Liste : in T_Liste_Chainee;
                       Valeur : in T_Valeur) return Integer is
        -- recursion terminale
        function L_Indice_Rec (Liste : in T_Liste_Chainee;
                               Valeur : in T_Valeur;
                               Indice : in Integer) return Integer is
        begin
            if Liste = null then
                return -1;
            elsif Liste.all.Valeur = Valeur then
                return Indice;
            else
                return L_Indice_Rec (Liste.all.Suivante, Valeur, Indice + 1);
            end if;
        end L_Indice_Rec;
    begin
        return L_Indice_Rec (Liste, Valeur, 0);
    end L_Indice;


    -- Supprimer tous les éléments d'une Liste.
    -- non recursif pour eviter un depassement de la pile d'appels
    procedure Vider (Liste : in out T_Liste_Chainee) is
        Cellule : T_Liste_Chainee;
    begin
        Cellule := Liste;
        loop
            Cellule := Liste;
            exit when Cellule = null;
            Liste := Liste.all.Suivante;
            Free (Cellule);
        end loop;
    end Vider;


	-- Appliquer un traitement (Traiter) pour chaque valeur d'une Liste.
    procedure Pour_Chaque (Liste : in T_Liste_Chainee) is
    begin
        if Liste /= null then
            Traiter (Liste.all.Valeur);
            Pour_Chaque (Liste.all.Suivante);
        end if;
    exception
        -- On continue le traitement si une exception survient
        when others => Pour_Chaque (Liste.all.Suivante);
	end Pour_Chaque;

end Liste_Chainee;
