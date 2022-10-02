with Ada.Text_IO;                 use Ada.Text_IO;
with Ada.Integer_Text_IO;         use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;           use Ada.Float_Text_IO;
with Ada.Unchecked_Deallocation;

package body Vecteurs_Creux is


	procedure Free is
		new Ada.Unchecked_Deallocation (T_Cellule, T_Vecteur_Creux);


    procedure Initialiser (V : out T_Vecteur_Creux) is
	begin
        V := null;
	end Initialiser;


	procedure Detruire (V: in out T_Vecteur_Creux) is
	begin
        if V.Suivant/=null then
            Detruire (V.Suivant);
            Free(V);
        else
            null;
        end if;
    end Detruire;


	function Est_Nul (V : in T_Vecteur_Creux) return Boolean is
    begin
		return  V = null;
	end Est_Nul;


    function Composante_Recursif (V : in T_Vecteur_Creux ; Indice : in Integer) return Float is
    begin
        if Est_Nul(V) or else (V.Indice > Indice) then
            return 0.0;
        elsif V.Indice = Indice then
            return V.Valeur;
        else
            return Composante_Recursif(V.Suivant,Indice);
        end if;

	end Composante_Recursif;


   function Composante_Iteratif (V : in T_Vecteur_Creux ; Indice : in Integer) return Float is
            Pointeur_copy : T_Vecteur_Creux;
        begin
            Pointeur_copy := V;
            while not(Est_Nul(Pointeur_copy)) and then (Pointeur_copy.Indice /= Indice and Pointeur_copy.Indice < Indice)  loop
                Pointeur_copy := Pointeur_copy.Suivant;
            end loop;
            if not(Est_Nul(Pointeur_copy)) and then Pointeur_copy.Indice = Indice then
                return Pointeur_copy.Valeur;
            else
                return 0.0;
            end if;


	end Composante_Iteratif;


	procedure Modifier (V : in out T_Vecteur_Creux ;
				       Indice : in Integer ;
                     Valeur : in Float ) is
        V_nouv : T_Vecteur_Creux;
	begin
        if V = null then
            V := new T_Cellule;
            V.Indice := Indice;
            V.Valeur := Valeur;
            V.Suivant := null;

        elsif V.Indice < Indice then
            Modifier (V.Suivant, Indice, Valeur);

        elsif V.Indice = Indice then
            if Valeur = 0.0 then
                V:=V.Suivant;
            else
                V.Valeur := Valeur;
            end if;
        else
            if Valeur = 0.0 then
                null;
            else
                V_nouv := new T_Cellule;
                V_nouv.Indice := V.Indice;
                V_nouv.Valeur := V.Valeur;
                V_nouv.Suivant := V.Suivant;
                V.Suivant := V_nouv;
                V.Indice := Indice;
                V.Valeur := Valeur;
            end if;
        end if;
	end Modifier;


	function Sont_Egaux_Recursif (V1, V2 : in T_Vecteur_Creux) return Boolean is
	begin
        if Est_Nul(V1) xor Est_Nul(V2) then
            return False;
        elsif Est_Nul(V1) and Est_Nul(V2) then
            return True;
        elsif V1.Indice=V2.Indice and V1.Valeur = V2.Valeur then
            return Sont_Egaux_Recursif(V1.Suivant,V2.Suivant);
        else
            return False;
       end if;
	end Sont_Egaux_Recursif;


    function Sont_Egaux_Iteratif (V1, V2 : in T_Vecteur_Creux) return Boolean is
        Copy_V1 : T_Vecteur_Creux;
        Copy_V2 : T_Vecteur_Creux;
	begin
        Copy_V1 := V1;
        Copy_V2 := V2;
        while (not(Est_Nul(Copy_V1)) and not(Est_Nul(Copy_V2))) and then (Copy_V1.Indice = Copy_V2.Indice and Copy_V1.Valeur=Copy_V2.Valeur) loop
            Copy_V1 := Copy_V1.Suivant;
            Copy_V2 := Copy_V2.Suivant;
        end loop;
        if Est_Nul(Copy_V1) and Est_Nul(Copy_V2) then
            return True;
        else
            return False;
        end if;
     end Sont_Egaux_Iteratif;


    procedure Additionner (V1 : in out T_Vecteur_Creux; V2 : in T_Vecteur_Creux) is
        Copy_V2 : T_Vecteur_Creux;
    begin
        if Est_Nul(V2) then
            null;
        elsif Est_Nul(V1) then
            Copy_V2 := V2;
            loop
                Modifier(V1,Copy_V2.Indice,Copy_V2.Valeur);
                Copy_V2 := Copy_V2.Suivant;
            exit when Est_Nul(Copy_V2);
            end loop;
        elsif V1.Indice < V2.Indice then
            Additionner (V1.Suivant,V2);
        elsif V1.Indice > V2.Indice then
            Modifier(V1,V2.Indice,V2.Valeur);
            Additionner(V1,V2.Suivant);
        else
            Modifier(V1,V1.Indice,V1.Valeur+V2.Valeur);
            Additionner(V1.Suivant,V2.Suivant);
        end if;
    end Additionner;


	function Norme2 (V : in T_Vecteur_Creux) return Float is
	begin
		return Produit_Scalaire(V,V);
	end Norme2;


    Function Produit_Scalaire (V1, V2: in T_Vecteur_Creux) return Float is
        Resultat : Float;
    begin
        if Est_Nul(V1) or Est_Nul(V2) then
            return 0.0;
        elsif V1.Indice < V2.Indice then
            return Produit_Scalaire(V1.Suivant,V2);
        elsif V1.Indice > V2.Indice then
            return Produit_Scalaire(V1,V2.Suivant);
        else
            return V1.Valeur*V2.Valeur+Produit_Scalaire(V1.Suivant,V2.Suivant);
        end if;
	end Produit_Scalaire;


	procedure Afficher (V : T_Vecteur_Creux) is
	begin
		if V = Null then
			Put ("--E");
		else
			-- Afficher la composante V.all
			Put ("-->[ ");
			Put (V.all.Indice, 0);
			Put (" | ");
			Put (V.all.Valeur, Fore => 0, Aft => 1, Exp => 0);
			Put (" ]");

			-- Afficher les autres composantes
			Afficher (V.all.Suivant);
		end if;
	end Afficher;


	function Nombre_Composantes_Non_Nulles (V: in T_Vecteur_Creux) return Integer is
	begin
		if V = Null then
			return 0;
		else
			return 1 + Nombre_Composantes_Non_Nulles (V.all.Suivant);
		end if;
	end Nombre_Composantes_Non_Nulles;


end Vecteurs_Creux;
