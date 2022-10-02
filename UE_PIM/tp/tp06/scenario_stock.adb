with Ada.Text_IO;          use Ada.Text_IO;
with Ada.Integer_Text_IO;  use Ada.Integer_Text_IO;
with Stocks_Materiel;      use Stocks_Materiel;

-- Auteur: Romain Peyremorte
-- Gérer un stock de matériel informatique.
--
procedure Scenario_Stock is

    Mon_Stock : T_Stock;
begin
    -- Créer un stock vide
    Creer (Mon_Stock);
    pragma Assert (Nb_Materiels (Mon_Stock) = 0);

    -- Enregistrer quelques matériels
    Enregistrer (Mon_Stock, 1012, UNITE_CENTRALE, 2016);
    pragma Assert (Nb_Materiels (Mon_Stock) = 1);
    pragma Assert (Nb_non_fonctionnement (Mon_Stock) = 0);

    Enregistrer (Mon_Stock, 2143, ECRAN, 2016);
    pragma Assert (Nb_Materiels (Mon_Stock) = 2);
    pragma Assert (Nb_non_fonctionnement (Mon_Stock) = 0);

    Enregistrer (Mon_Stock, 3001, IMPRIMANTE, 2017);
    pragma Assert (Nb_Materiels (Mon_Stock) = 3);
    Modifier_etat_materiel (Mon_Stock, 1012);
    pragma Assert (Nb_non_fonctionnement (Mon_Stock) = 1);
    Modifier_etat_materiel (Mon_Stock, 1012);
    pragma Assert (Nb_non_fonctionnement (Mon_Stock) = 0);
    Supprimer_non_fonctionnels (Mon_Stock);
    pragma Assert (Nb_Materiels (Mon_Stock) = 3);

    Enregistrer (Mon_Stock, 3012, UNITE_CENTRALE, 2017);
    pragma Assert (Nb_Materiels (Mon_Stock) = 4);
    Modifier_etat_materiel (Mon_Stock, 3012);
    Supprimer_non_fonctionnels (Mon_Stock);
    pragma Assert (Nb_Materiels (Mon_Stock) = 3);
    Supprimer_materiel (Mon_Stock,2143);
    pragma Assert (Nb_Materiels (Mon_Stock) = 2);
    
    

end Scenario_Stock;
