with Piles;
with Ada.Text_IO;            use Ada.Text_IO;

-- Montrer le risque d'autoriser l'affectation entre variables dont le type
-- est une structure chaînée.
procedure Illustrer_Affectation_Pile is
	package Pile is
		new Piles (Character);
	use Pile;

	procedure Afficher is
		new Pile.Afficher (Put);

	P1, P2 : T_Pile;
begin
	-- construire la pile P1
	Initialiser (P1);
	Empiler (P1, 'A');
	Empiler (P1, 'B');
	Afficher (P1); New_Line;   -- XXX Qu'est ce qui s'affiche ? [A,B>

	P2 := P1;                  -- XXX Conseillé ? Non
	pragma Assert (P1 = P2);

	Depiler (P2);              -- XXX Quel effet ? Vide P2 d'un élément
	Afficher (P2); New_Line;   -- XXX Qu'est ce qui s'affiche ? [A>
	Afficher (P1); New_Line;   -- XXX Qu'est ce qui s'affiche ? [A>, non affiche [,>
	-- XXX Que donne l'exécution avec valkyrie ? Des erreurs

    Depiler (P1);	-- XXX correct ? Oui, en fait non car pointeur vide (déjà free)

    -- limited permet d'empécher que 2 pointeurs pointent au même endroit car il empèche d'associer deux éléments dont un est limitedS
    Detruire (P1);
    Detruire(P2);
end Illustrer_Affectation_Pile;
