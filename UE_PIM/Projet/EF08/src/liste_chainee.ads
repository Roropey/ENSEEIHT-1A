generic
    type T_Valeur is private;
package Liste_Chainee is

    type T_Liste_Chainee is limited private;


	-- Initialiser une Liste.  La Liste est vide.
	procedure Initialiser (Liste: out T_Liste_Chainee) with
		Post => Est_Vide (Liste);


	-- Est-ce qu'une Liste est vide ?
	function Est_Vide (Liste : in T_Liste_Chainee) return Boolean;


	-- Obtenir le nombre d'éléments d'une Liste. 
	function Taille (Liste : in T_Liste_Chainee) return Integer with
		Post => Taille'Result >= 0
			and (Taille'Result = 0) = Est_Vide (Liste);


	-- Ajouter une Valeur a la liste
    procedure Ajouter (Liste : in out T_Liste_Chainee;
                       Valeur : in T_Valeur; Au_Debut : in Boolean);
    
    
    -- Enregistrer Valeur a l'indice Indice dans Liste
    procedure Enregistrer (Liste : in out T_Liste_Chainee;
                           Valeur : in T_Valeur; Indice : in Integer);

    
    procedure Inserer_Avant (Liste : in out T_Liste_Chainee;
                             Indice : in Integer; Valeur : in T_Valeur);
      

	-- Supprimer une valeur dans une Liste.
	-- Exception : Valeur_Absente_Exception si la valeur n'est pas dans la Liste
    procedure Supprimer (Liste : in out T_Liste_Chainee;
                         Valeur : in T_Valeur; Seulement_Une : in Boolean);

    
    procedure Supprimer_Indice (Liste : in out T_Liste_Chainee;
                                Indice : in Integer);
    

	-- Savoir si une Valeur est présente dans une Liste.
    function Valeur_Presente (Liste : in T_Liste_Chainee;
                              Valeur : in T_Valeur) return Boolean;


	-- Obtenir la donnée associée à une Cle dans la Liste.
    function La_Valeur (Liste : in T_Liste_Chainee;
                        Indice : in Integer) return T_Valeur;


    -- Obtenir le premier indice d'une valeur, -1 si pas presente
    function L_Indice (Liste : in T_Liste_Chainee;
                       Valeur : in T_Valeur) return Integer;


	-- Supprimer tous les éléments d'une Liste.
	procedure Vider (Liste : in out T_Liste_Chainee) with
		Post => Est_Vide (Liste);


	-- Appliquer un traitement (Traiter) pour chaque valeur d'une Liste.
	generic
		with procedure Traiter (Valeur : in T_Valeur);
    procedure Pour_Chaque (Liste : in T_Liste_Chainee);

private

    type T_Cellule;

    type T_Liste_Chainee is access T_Cellule;

    type T_Cellule is record
        Valeur : T_Valeur;
        Suivante : T_Liste_Chainee;
    end record;

end Liste_Chainee;
