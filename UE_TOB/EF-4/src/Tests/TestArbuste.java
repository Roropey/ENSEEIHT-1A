package Tests;

import Ressources.Arbuste;
import Utile.*;

public class TestArbuste {

     public static void testerPosition(Arbuste arbusteTestConnu, Arbuste arbusteTestAleatoire){
        Position positionConnue = arbusteTestConnu.getPosition();
        Position positionAleatoire = arbusteTestAleatoire.getPosition();
        Assert.assertEquals(positionConnue.getX(),4.0,"Problème Connu X");
        Assert.assertEquals(positionConnue.getY(),10.5,"Problème Connu Y");
        Assert.assertGreater(positionAleatoire.getX(),10.5,"Problème Aléatoire X borne inf");
        Assert.assertGreater(50,positionAleatoire.getX(),"Problème Aléatoire X borne sup");
        Assert.assertGreater(positionAleatoire.getY(),20,"Problème Aléatoire Y borne inf");
        Assert.assertGreater(30,positionAleatoire.getY(),"Problème Aléatoire Y borne sup");
    }

    public static void testerNutrition(Arbuste arbusteTestConnu, Arbuste arbusteTestAleatoire){
        Assert.assertEquals(arbusteTestConnu.getValeurNutritive(),7,"Problème Connu valeur nutritive");
        Assert.assertEquals(arbusteTestAleatoire.getValeurNutritive(),7,"Problème Aléatoire valeur nutritive");
    }

    public static void testerNom(Arbuste arbusteTestConnu, Arbuste arbusteTestAleatoire){
        Assert.assertEquals(arbusteTestConnu.getNom(),"Arbuste","Problème Connue nom");
        Assert.assertEquals(arbusteTestAleatoire.getNom(),"Arbuste","Problème Aléatoire nom");
    }

    public static void testerCategorie(Arbuste arbusteTestConnu, Arbuste arbusteTestAleatoire){
        Assert.assertEquals(arbusteTestConnu.getCategorie(),Categorie.plante,"Problème Connue catégorie");
        Assert.assertEquals(arbusteTestAleatoire.getCategorie(),Categorie.plante,"Problème Aléatoire catégorie");
    }

    public static void testerNbBaies(Arbuste arbusteTestConnu, Arbuste arbusteTestAleatoire){
        int nbArbusteConnue = arbusteTestConnu.getNbBaies();
        int nbArbusteAleatoire = arbusteTestAleatoire.getNbBaies();
        System.out.print("L'arbuste dont la position est connue a "+nbArbusteConnue+" baie(s)\nL'arbuste dont la position est aléatoire a "+nbArbusteAleatoire+" baie(s)\n");
        Assert.assertGreater(nbArbusteConnue,0,"Problème Connue nombre baie borne inférieur");
        Assert.assertGreater(6,nbArbusteConnue,"Problème Connue nombre baie borne supérieur");
        Assert.assertGreater(nbArbusteAleatoire,0,"Problème Aléatoire nombre baie borne inférieur");
        Assert.assertGreater(6,nbArbusteAleatoire,"Problème Aléatoire nombre baie borne supérieur");
    }

    public static void testerEstMangee(Arbuste arbusteTestConnu, Arbuste arbusteTestAleatoire){
        int nbArbusteConnue = arbusteTestConnu.getNbBaies();
        int nbArbusteAleatoire = arbusteTestAleatoire.getNbBaies();
        
        int i = 0;
        while(arbusteTestConnu.estMangee()){
            i++;
            Assert.assertEquals(arbusteTestConnu.getNbBaies()+i,nbArbusteConnue,"Nombre baie connu problème");
        }
        Assert.assertFalse(arbusteTestConnu.estMangee(),"Problème arbuste connu encore mangeable");

        i = 0;
        while(arbusteTestAleatoire.estMangee()){
            i++;
            Assert.assertEquals(arbusteTestAleatoire.getNbBaies()+i,nbArbusteAleatoire,"Nombre baie aléatoire problème");
        }
        Assert.assertFalse(arbusteTestAleatoire.estMangee(),"Problème arbuste aléatoire encore mangeable");

    }

    public static void main (String[] args){
         
        System.out.print("Création arbustes de test\n");
        Arbuste arbusteTestConnu = new Arbuste(4,10);
        Arbuste arbusteTestAleatoire = new Arbuste(10,50,20,30);
        System.out.print("Vérification des positions\n");
        testerPosition(arbusteTestConnu, arbusteTestAleatoire);
        System.out.print("Vérification des valeurs nutritionnaires\n");
        testerNutrition(arbusteTestConnu, arbusteTestAleatoire);
        System.out.print("Vérification des noms\n");
        testerNom(arbusteTestConnu, arbusteTestAleatoire);
        System.out.print("Vérification des catégories\n");
        testerCategorie(arbusteTestConnu, arbusteTestAleatoire);
        System.out.print("Vérification de la présence de baie(s)\n");
        testerNbBaies(arbusteTestConnu, arbusteTestAleatoire);
        System.out.print("Vérification estMangee() avec des baie dans les arbustes\n");
        testerEstMangee(arbusteTestConnu, arbusteTestAleatoire);
        System.out.print("Tous les tests ont réussis\n");
    }

}