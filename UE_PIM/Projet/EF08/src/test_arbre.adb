with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Arbre;


procedure Test_Arbre is

    package Arbre_Integer_Unbounded_String is
            new Arbre (T_Cle => Integer, T_Valeur => Unbounded_String);
    use Arbre_Integer_Unbounded_String;

    total : Integer;
    Arbre_test : T_Arbre;


    procedure Test_Affichage (Arbre : in T_Arbre) is
        procedure Afficher (Cle : in Integer ; Valeur : in Unbounded_String) is
        begin
            Put ("Le noeud à la valeur ");
            Put (Cle);
            Put (" pour la lettre ");
            Put (To_String (Valeur));
            Put (".");
            New_Line;
        end Afficher;

        procedure Afficher_noeud is new Pour_Chaque (Traiter => Afficher);
    begin
        Put_Line ("Afficher Arbre");
        Afficher_noeud (Arbre);
    end Test_Affichage;


    procedure Test_Pour_Chaque_Somme (Arbre : in T_Arbre;
                                      total : in out Integer) is
        pragma Warnings (off); -- Valeur inutilisee, seulement cle utile
        procedure Somme (Cle : in Integer; Valeur : in Unbounded_String) is
        begin
            total := total + Cle;
        end Somme;
        pragma Warnings (on);

        procedure Somme_noeud is new Pour_Chaque (Traiter => Somme);
    begin
        Put_Line ("Test Sommage cle");
        Somme_Noeud (Arbre);

        pragma Assert (total = 80);
    end Test_Pour_Chaque_Somme;


    procedure Initialiser_Arbre(Arbre : out T_Arbre) is
        Sous_arbre : T_Arbre;
    begin
        Put_Line ("Création d'arbres vides");
        Initialiser (Sous_arbre);

        Put_Line ("Modification du noeud d'un arbre");
        Enregistrer (Sous_arbre, 20, To_Unbounded_String("a"), null, null);
        pragma Assert (Sous_arbre.Valeur = To_Unbounded_String ("a"));
        pragma Assert (Sous_arbre.Cle = 20);

        Enregistrer (Arbre, 10, To_Unbounded_String("e"), Sous_arbre, null);
        pragma Assert (Arbre.Valeur = "e");
        pragma Assert (Arbre.Cle = 10);

        pragma Assert (Arbre.Gauche.Valeur = To_Unbounded_String ("a"));
        pragma Assert (Arbre.Gauche.Cle = 20);

       Put_Line ("Modification de l'arbre droit directement");
       Enregistrer (Arbre.Droite, 50, To_Unbounded_String ("o"), null, null);
       pragma Assert (Arbre.Droite.Valeur = To_Unbounded_String ("o"));
       pragma Assert (Arbre.Droite.Cle = 50);
    end Initialiser_Arbre;


    procedure Test_vider (Arbre : in out T_Arbre) is
    begin
        Put_Line ("Suppression Arbre");
        Vider (Arbre);
        pragma Assert (Est_Vide (Arbre));
    end Test_vider;

begin
    Initialiser_Arbre (Arbre_test);
    Test_Affichage (Arbre_test);

    total := 0;
    Test_Pour_Chaque_Somme (Arbre_test, total);

    Test_vider (Arbre_test);
    Put_Line ("Fin des tests : OK.");
end Test_Arbre;
