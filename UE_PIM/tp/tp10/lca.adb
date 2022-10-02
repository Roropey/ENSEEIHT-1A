--with Ada.Text_IO;            use Ada.Text_IO;
with SDA_Exceptions;         use SDA_Exceptions;
with Ada.Unchecked_Deallocation;

package body LCA is


	procedure Free is
		new Ada.Unchecked_Deallocation (Object => T_Cellule, Name => T_LCA);


    procedure Initialiser(Sda: out T_LCA) is
    begin
        Sda := null;
	end Initialiser;


	function Est_Vide (Sda : T_LCA) return Boolean is
	begin
		return (Sda=null);
	end;


	function Taille (Sda : in T_LCA) return Integer is
    begin
        if Sda = null then
            return 0;
        else
            return 1+Taille(SDA.all.Suivant);
        end if;
	end Taille;


    procedure Enregistrer (Sda : in out T_LCA ; Cle : in T_Cle ; Donnee : in T_Donnee) is

	begin
        if Sda = null then
            Sda := new T_Cellule;
            Sda.all.Cle := Cle;
            Sda.all.Donnee := Donnee;
            Sda.all.Suivant := null;
        elsif Sda.Cle = Cle then
            Sda.all.Donnee := Donnee;
        else
            Enregistrer (Sda.all.Suivant,Cle,Donnee);
        end if;
	end Enregistrer;


	function Cle_Presente (Sda : in T_LCA ; Cle : in T_Cle) return Boolean is
     begin
            if Sda = null then
                return False;
            elsif Sda.all.Cle = Cle then
                return True;
            else
                return Cle_Presente (Sda.all.Suivant, Cle);
            end if;
	end;


    function La_Donnee (Sda : in T_LCA ; Cle : in T_Cle) return T_Donnee is
    begin
        if Sda=null then
            raise Cle_Absente_Exception;
        elsif Sda.all.Cle=Cle then
            return Sda.Donnee;
        else
            return La_Donnee(Sda.all.Suivant, Cle);
        end if;
	end La_Donnee;


    procedure Supprimer (Sda : in out T_LCA ; Cle : in T_Cle) is
        Sda_prec : T_LCA := Sda;
	begin
            if Sda = null then
                raise Cle_Absente_Exception;
            elsif Sda.all.Cle = Cle then
            Sda := Sda.all.Suivant;
            Free(Sda_prec);
            else
                Supprimer(Sda.all.Suivant,Cle);
        end if;
	end Supprimer;


	procedure Vider (Sda : in out T_LCA) is
	begin
        if Sda = null then
            Free(Sda);
        else
            Vider(Sda.all.Suivant);
            Free(Sda);
        end if;
	end Vider;


	procedure Pour_Chaque (Sda : in T_LCA) is
	begin
        if Sda = null then
            null;
        else
            begin
                Traiter(Sda.all.Cle,Sda.all.Donnee);
            exception
                when others => null;
            end;
            Pour_Chaque(Sda.all.Suivant);
        end if;
	end Pour_Chaque;

end LCA;
