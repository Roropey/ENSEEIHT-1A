with Piles;

procedure Parenthesage is


    -- L'indice dans la chaîne Meule de l'élément Aiguille.
    -- Si l'Aiguille n'est pas dans la Meule, on retroune Meule'Last + 1.
    Function Index (Meule : in String; Aiguille: Character) return Integer with
        Post => Meule'First <= Index'Result and then Index'Result <= Meule'Last + 1
            and then (Index'Result > Meule'Last or else Meule (Index'Result) = Aiguille)
    is
        Indice : Integer;
        Bool : Boolean;
    begin
        Indice := 0;
        Bool := False;
        loop
            Indice := Indice + 1;
            if Indice > Meule'Last then
                Bool := True;
            elsif Meule(Indice)=Aiguille then
                Bool := True;
            end if;
            exit when Bool; --problème Indice : index check failed (ptt trop loin)
        end loop;

        return Indice;
    end Index;


    -- Programme de test de Index.
    procedure Tester_Index is
        ABCDEF : constant String := "abcdef";
    begin
        pragma Assert (1 = Index (ABCDEF, 'a'));
        pragma Assert (3 = Index (ABCDEF, 'c'));
        pragma Assert (6 = Index (ABCDEF, 'f'));
        pragma Assert (7 = Index (ABCDEF, 'z'));
        pragma Assert (4 = Index (ABCDEF (1..3), 'z'));
        pragma Assert (3 = Index (ABCDEF (3..5), 'c'));
        pragma Assert (5 = Index (ABCDEF (3..5), 'e'));
        pragma Assert (6 = Index (ABCDEF (3..5), 'a'));
        pragma Assert (6 = Index (ABCDEF (3..5), 'g'));
    end;


    -- Vérifier les bon parenthésage d'une Chaîne (D).  Le sous-programme
    -- indique si le parenthésage est bon ou non (Correct : R) et dans le cas
    -- où il n'est pas correct, l'indice (Indice_Erreur : R) du symbole qui
    -- n'est pas appairé (symbole ouvrant ou fermant).
    --
    -- Exemples
    --   "[({})]"  -> Correct
    --   "]"       -> Non Correct et Indice_Erreur = 1
    --   "((()"    -> Non Correct et Indice_Erreur = 2
    --
    procedure Verifier_Parenthesage (Chaine: in String ; Correct : out Boolean ; Indice_Erreur : out Integer) is
        Ouvrants : Constant String := "([{";
        Fermants : Constant String := ")]}";
        Indice : Integer;
        Etat : Boolean;
        Charact : Character;
        package PPC1 is
            new Piles(Chaine'Last, Character);
        use PPC1;
        Pile : PPC1.T_Pile;
        package PPC2 is
            new Piles(Chaine'Last, Integer);
        use PPC2;
        Pile_Indice : PPC2.T_Pile;
    begin
        --Initialiser les variables--
        Indice := Chaine'First - 1;
        Etat := False;
        Initialiser(Pile);
        Initialiser(Pile_Indice);
        --Parcourir la chaine--
        loop
            --Recupérer l'indice et le Character où l'on est--
            Indice := Indice + 1;
            Charact := Chaine (Indice);
            --Regarder si c'est un ouvrant--
            if Index(Ouvrants,Charact)<=Ouvrants'Last then
                --Si c'est le cas, on eempile le character et l'indice
                Empiler(Pile, Charact);
                Empiler(Pile_Indice,Indice);
            --Regarder si c'est un fermant--
            elsif Index(Fermants,Charact)<=Fermants'Last then
                --Regarder si ce fermant correspond au dernier ouvrant--
                if not (Est_Vide(Pile)) and then Index(Ouvrants,Sommet(Pile))=Index(Fermants,Charact) then
                    --Si c'est le cas, on dépile l'ouvrant et on continu
                    Depiler (Pile);
                    Depiler (Pile_Indice);
                else
                    --Si ce n'est pas le cas, on a une erreur
                    if Est_Vide(Pile) then
                        Empiler(Pile_Indice,Indice);
                    end if;
                    Etat := True;
                end if;
            end if;
        exit when Indice >= Chaine'Last or Etat; --On quitte si on est arrivé au bout ou si on a une erreur
        end loop;
        --Attribuer l'indice à la sortie si on a une erreur
        if Etat or not (Est_Vide(Pile_Indice)) then
            Indice_Erreur := Sommet(Pile_Indice);
            Correct := False;
        else
            Correct := True;
        end if;

    end Verifier_Parenthesage;


    -- Programme de test de Verifier_Parenthesage
    procedure Tester_Verifier_Parenthesage is
        Exemple1 : constant String(1..2) :=  "{}";
        Exemple2 : constant String(11..18) :=  "]{[(X)]}";

        Indice : Integer;   -- Résultat de ... XXX
        Correct : Boolean;
    begin
        Verifier_Parenthesage ("(a < b)", Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage ("([{a}])", Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage ("(][{a}])", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 2);

        Verifier_Parenthesage ("]([{a}])", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 1);

        Verifier_Parenthesage ("([{}])}", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 7);

        Verifier_Parenthesage ("([{", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 3);

        Verifier_Parenthesage ("([{}]", Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 1);

        Verifier_Parenthesage ("", Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage (Exemple1, Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage (Exemple2, Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 11);

        Verifier_Parenthesage (Exemple2(12..18), Correct, Indice);
        pragma Assert (Correct);

        Verifier_Parenthesage (Exemple2(12..15), Correct, Indice);
        pragma Assert (not Correct);
        pragma Assert (Indice = 14);
    end Tester_Verifier_Parenthesage;

begin
    Tester_Index;
    Tester_Verifier_Parenthesage;
end Parenthesage;
