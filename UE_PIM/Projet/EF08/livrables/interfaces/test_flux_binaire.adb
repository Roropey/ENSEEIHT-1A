with Ada.Text_IO; use Ada.Text_IO;
with Flux_Binaire; use Flux_Binaire;


procedure Test_Flux_Binaire is

    Flux : T_Flux_Binaire;

    procedure Tester_Initialiser is
    begin
        Initialiser (Flux);

        Vider (Flux);
        Put_Line ("Test Initialiser OK.");
    end Tester_Initialiser;


    procedure Tester_Est_Vide is
    begin
        Initialiser (Flux);
        pragma Assert (Est_Vide (Flux));

        Ajouter_Bit (Flux, 1);
        pragma Assert (not Est_Vide (Flux));

        Vider (Flux);
        Put_Line ("Test Est_Vide OK.");
    end Tester_Est_Vide;


    procedure Tester_Taille is
    begin
        Initialiser (Flux);
        pragma Assert (Taille (Flux) = 0);

        Ajouter_Bit (Flux, 1);
        pragma Assert (Taille (Flux) = 1);

        Vider (Flux);
        Put_Line ("Test Taille OK.");
    end Tester_Taille;


    procedure Tester_Le_Bit is
        Octet : T_Octet;
    begin
        Initialiser (Flux);
        Ajouter_Octet (Flux, 2#1001_1101#);
        Octet := L_Octet (Flux, 0);

        pragma Assert (Le_Bit (Octet, 0) = 1);
        pragma Assert (Le_Bit (Octet, 1) = 0);
        pragma Assert (Le_Bit (Octet, 2) = 0);
        pragma Assert (Le_Bit (Octet, 3) = 1);
        pragma Assert (Le_Bit (Octet, 4) = 1);
        pragma Assert (Le_Bit (Octet, 5) = 1);
        pragma Assert (Le_Bit (Octet, 6) = 0);
        pragma Assert (Le_Bit (Octet, 7) = 1);

        Vider (Flux);
        Put_Line ("Test Le_Bit OK.");
    end Tester_Le_Bit;


    procedure Tester_L_Octet is
    begin
        Initialiser (Flux);
        Ajouter_Octet (Flux, 0);
        Ajouter_Octet (Flux, 1);
        Ajouter_Octet (Flux, 2);
        Ajouter_Octet (Flux, 3);

        pragma Assert (L_Octet (Flux, 0) = 0);
        pragma Assert (L_Octet (Flux, 1) = 1);
        pragma Assert (L_Octet (Flux, 2) = 2);
        pragma Assert (L_Octet (Flux, 3) = 3);

        Vider (Flux);
        Put_Line ("Test L_Octet OK.");
    end Tester_L_Octet;

    procedure Tester_Ajouter_Bit is
    begin
        Initialiser (Flux);
        Ajouter_Bit (Flux, 1);
        Ajouter_Bit (Flux, 1);
        Ajouter_Bit (Flux, 0);
        Ajouter_Bit (Flux, 1);
        Ajouter_Bit (Flux, 0);
        Ajouter_Bit (Flux, 1);
        Ajouter_Bit (Flux, 1);
        Ajouter_Bit (Flux, 0);

        pragma Assert (L_Octet (Flux, 0) = 2#1101_0110#);

        Vider (Flux);
        Put_Line ("Test Ajouter_Bit OK.");
    end Tester_Ajouter_Bit;


    procedure Tester_Ajouter_Octet is
    begin
        Initialiser (Flux);

        -- Ajouts simples
        Ajouter_Octet (Flux, 0);
        Ajouter_Octet (Flux, 1);
        Ajouter_Octet (Flux, 2);

        pragma Assert (L_Octet (Flux, 0) = 0);
        pragma Assert (L_Octet (Flux, 1) = 1);
        pragma Assert (L_Octet (Flux, 2) = 2);
        pragma Assert (Taille (Flux) = 3);

        -- Ajouts non alignes
        Vider (Flux);
        Ajouter_Bit (Flux, 1);
        Ajouter_Bit (Flux, 0);
        Ajouter_Bit (Flux, 0);
        Ajouter_Octet (Flux, 2#1110_1010#);
        Ajouter_Octet (Flux, 2#0101_1001#);

        pragma Assert (L_Octet (Flux, 0) = 2#1001_1101#);
        pragma Assert (L_Octet (Flux, 1) = 2#0100_1011#);
        pragma Assert (L_Octet (Flux, 2) = 2#0010_0000#);
        pragma Assert (Taille (Flux) = 3);

        Vider (Flux);
        Put_Line ("Test Ajouter_Octet OK.");
    end Tester_Ajouter_Octet;


    procedure Tester_Ajouter_Flux is
        Flux_Deux : T_Flux_Binaire;
    begin
        Initialiser (Flux);
        Ajouter_Octet (Flux, 0);
        Ajouter_Octet (Flux, 1);

        Initialiser (Flux_Deux);
        Ajouter_Octet (Flux_Deux, 2);
        Ajouter_Octet (Flux_Deux, 3);

        -- ajout aligne
        Ajouter_Flux (Flux, Flux_Deux);

        -- ajout non aligne
        Ajouter_Bit (Flux, 1);
        Ajouter_Bit (Flux, 0);
        Ajouter_Bit (Flux, 1);
        Ajouter_Bit (Flux, 0);
        Ajouter_Flux (Flux, Flux_Deux);
        Ajouter_Bit (Flux, 0);
        Ajouter_Bit (Flux, 0);
        Ajouter_Bit (Flux, 0);
        Ajouter_Bit (Flux, 1);

        pragma Assert (L_Octet (Flux, 0) = 0);
        pragma Assert (L_Octet (Flux, 1) = 1);
        pragma Assert (L_Octet (Flux, 2) = 2);
        pragma Assert (L_Octet (Flux, 3) = 3);
        pragma Assert (L_Octet (Flux, 4) = 2#1010_0000#);
        pragma Assert (L_Octet (Flux, 5) = 2#0010_0000#);
        pragma Assert (L_Octet (Flux, 6) = 2#0011_0001#);
        pragma Assert (Taille (Flux) = 7);

        pragma Assert (L_Octet (Flux_Deux, 0) = 2);
        pragma Assert (L_Octet (Flux_Deux, 1) = 3);
        pragma Assert (Taille (Flux_Deux) = 2);

        Vider (Flux);
        Vider (Flux_Deux);
        Put_Line ("Test Ajouter_Flux OK.");
    end Tester_Ajouter_Flux;


    procedure Tester_Vider is
    begin
        Initialiser (Flux);
        Ajouter_Octet (Flux, 0);
        Ajouter_Octet (Flux, 1);
        Vider (Flux);

        Vider (Flux);
        Put_Line ("Test Vider OK.");
    end Tester_Vider;


    procedure Tester_Une_Chaine is
    begin
        Initialiser (Flux);
        Ajouter_Octet (Flux, 2#0010_1110#);
        Ajouter_Bit (Flux, 0);
        Ajouter_Bit (Flux, 0);
        Ajouter_Bit (Flux, 1);

        pragma Assert (Une_Chaine (Flux) = "00101110001");

        Vider (Flux);
        Put_Line ("Test Une_Chaine OK.");
    end Tester_Une_Chaine;

begin
    Tester_Initialiser;
    Tester_Est_Vide;
    Tester_Taille;
    Tester_Le_Bit;
    Tester_L_Octet;
    Tester_Ajouter_Bit;
    Tester_Ajouter_Octet;
    Tester_Ajouter_Flux;
    Tester_Vider;
    Tester_Une_Chaine;

    New_Line;
    Put_Line ("Fin des tests de Flux_Binaire : OK.");
end Test_Flux_Binaire;
