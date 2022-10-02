with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Vecteurs_Creux;    use Vecteurs_Creux;

-- Exemple d'utilisation des vecteurs creux.
procedure Exemple_Vecteurs_Creux is

    V : T_Vecteur_Creux;
    V2 : T_Vecteur_Creux;
	Epsilon: constant Float := 1.0e-5;
begin
	Put_Line ("Début du scénario");
    Initialiser(V);
    Put_Line("V");
    Afficher(V);
    New_Line;
    pragma Assert (Est_Nul (V));
    --Detruire(V);
    pragma Assert (Composante_Iteratif(V,18) = 0.0);
    pragma Assert (Composante_Recursif(V,18) = 0.0);
    Modifier (V,3,3.1);
    Modifier (V,5,6.1);
    Modifier (V,2,10.0);
    Put_Line("V");
    Afficher(V);
    New_Line;

    Initialiser(V2);
    Modifier (V2,3,3.1);
    Modifier (V2,5,6.1);
    Modifier (V2,2,10.0);

    Put_Line("V2");
    Afficher(V2);
    New_Line;

    pragma Assert (Sont_Egaux_Iteratif(V,V2));
    pragma Assert (Sont_Egaux_Recursif(V,V2));

    Modifier(V2,1,4.0);
    Additionner(V,V2);
    Put_Line("V=V+V2");
    Afficher(V);
    New_Line;

    Put_Line("Norme");
    Put(Norme2(V));
    New_Line;
    Put_Line("<V|V2>");
    Put(Produit_Scalaire(V,V2));
    New_Line;
    Put_Line("V2");
    Modifier (V2,3,0.0);
    Afficher(V2);
    New_Line;

    Put_Line ("Fin du scénario");
end Exemple_Vecteurs_Creux;
