
generic
    type T_Cle is private;
    type T_Valeur is private;
package Arbre is

    type Noeud;

    type T_Arbre is access Noeud;

    type Noeud is record
        Cle : T_Cle;
        Valeur : T_Valeur;
        Gauche : T_Arbre;
        Droite : T_Arbre;
    end record;
  
    
    -- Initialiser un Abr.
    -- L'Arbre est vide.
    procedure Initialiser(Abr: out T_Arbre) with
            Post => Est_Vide (Abr);


    -- Est-ce qu'un Arbre est vide ?
    function Est_Vide (Abr : in T_Arbre) return Boolean;


    -- Enregistrer un nouveau Noeud dans un arbre
    procedure Enregistrer (Abr : in out T_Arbre;
                           Cle : in T_Cle; Valeur : in T_Valeur;
                           Arbre_Gauche : in T_Arbre;
                           Arbre_Droite : in T_Arbre);

    -- Supprimer tous les éléments d'un Abr.
    procedure Vider (Abr : in out T_Arbre) with
            Post => Est_Vide (Abr);


    generic
        with procedure Traiter (Cle : in T_Cle; Valeur: in T_Valeur);
    procedure Pour_Chaque (Abr : in T_Arbre);

end Arbre;
