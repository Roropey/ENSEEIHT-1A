--with Ada.Text_IO;            use Ada.Text_IO;
with SDA_Exceptions;         use SDA_Exceptions;

package body TH is

    procedure Initialiser(Sda: out T_TH) is
    begin
        for Liste of Sda loop
            Initialiser(Liste);
        end loop;
	end Initialiser;


	function Est_Vide (Sda : T_TH) return Boolean is
	begin
        for Liste of Sda loop
            if not(Est_Vide(Liste)) then
                return False;
            end if;
        end loop;
        return True;
	end;


    function Taille (Sda : in T_TH) return Integer is
        Taille_TH : Integer;
    begin
        Taille_TH := 0;
        for Liste of Sda loop
            if not(Est_Vide(Liste))  then
                Taille_TH := Taille_TH + Taille(Liste);
            end if;
        end loop;
        return Taille_TH;
	end Taille;


     procedure Enregistrer (Sda : in out T_TH ; Cle : in T_Cle ; Donnee : in T_Donnee) is
        Indice : Integer;
	begin
        Indice := fonction_de_hachage(Cle);
        if Est_Vide(Sda(Indice))  then
            Initialiser(Sda(Indice));
        end if;
        Enregistrer(Sda(Indice),Cle,Donnee);

	end Enregistrer;


    function Cle_Presente (Sda : in T_TH ; Cle : in T_Cle) return Boolean is
        Indice : Integer;
     begin
        Indice := fonction_de_hachage(Cle);
        return Cle_Presente(Sda(Indice),Cle);
	end;


    function La_Donnee (Sda : in T_TH ; Cle : in T_Cle) return T_Donnee is
        Indice : Integer;
     begin
        Indice := fonction_de_hachage(Cle);
        return La_Donnee(Sda(Indice),Cle);
	end La_Donnee;

     procedure Supprimer (Sda : in out T_TH ; Cle : in T_Cle) is
        Indice : Integer;
     begin
        Indice := fonction_de_hachage(Cle);
        Supprimer(Sda(Indice),Cle);
	end Supprimer;


	procedure Vider (Sda : in out T_TH) is
	begin
        for Liste of Sda loop
            Vider(Liste);
        end loop;
	end Vider;


    procedure Pour_Chaque (Sda : in T_Th) is
        procedure Pour_Chaque_LCA is new P_LCA.Pour_Chaque (Traiter => Traiter);
	begin
        for Liste of Sda loop
            Pour_Chaque_LCA(Liste);
        end loop;
    end Pour_Chaque;


end TH;
