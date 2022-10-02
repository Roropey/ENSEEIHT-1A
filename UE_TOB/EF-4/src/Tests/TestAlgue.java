package Tests;

import Ressources.Algue;
import Utile.*;

public class TestAlgue {

     public static void testerPosition(Algue algueTestConnu, Algue algueTestAleatoire){
        Position positionConnue = algueTestConnu.getPosition();
        Position positionAleatoire = algueTestAleatoire.getPosition();
        Assert.assertEquals(positionConnue.getX(),4.0,"Problème Connu X");
        Assert.assertEquals(positionConnue.getY(),10.5,"Problème Connu Y");
        Assert.assertGreater(positionAleatoire.getX(),10.5,"Problème Aléatoire X borne inf");
        Assert.assertGreater(50,positionAleatoire.getX(),"Problème Aléatoire X borne sup");
        Assert.assertGreater(positionAleatoire.getY(),20,"Problème Aléatoire Y borne inf");
        Assert.assertGreater(30,positionAleatoire.getY(),"Problème Aléatoire Y borne sup");
    }

    public static void testerNutrition(Algue algueTestConnu, Algue algueTestAleatoire){
        Assert.assertEquals(algueTestConnu.getValeurNutritive(),5,"Problème Connu valeur nutritive");
        Assert.assertEquals(algueTestAleatoire.getValeurNutritive(),5,"Problème Aléatoire valeur nutritive");
    }

    public static void testerNom(Algue algueTestConnu, Algue algueTestAleatoire){
        Assert.assertEquals(algueTestConnu.getNom(),"Algue","Problème Connue nom");
        Assert.assertEquals(algueTestAleatoire.getNom(),"Algue","Problème Aléatoire nom");
    }

    public static void testerCategorie(Algue algueTestConnu, Algue algueTestAleatoire){
        Assert.assertEquals(algueTestConnu.getCategorie(),Categorie.plante,"Problème Connue catégorie");
        Assert.assertEquals(algueTestAleatoire.getCategorie(),Categorie.plante,"Problème Aléatoire catégorie");
    }

    public static void main (String[] args){
         
        System.out.print("Création algues de test\n");
        Algue algueTestConnu = new Algue(4,10);
        Algue algueTestAleatoire = new Algue(10,50,20,30);
        System.out.print("Vérification des positions\n");
        testerPosition(algueTestConnu, algueTestAleatoire);
        System.out.print("Vérification des valeurs nutritionnaires\n");
        testerNutrition(algueTestConnu, algueTestAleatoire);
        System.out.print("Vérification des noms\n");
        testerNom(algueTestConnu, algueTestAleatoire);
        System.out.print("Vérification des catégories\n");
        testerCategorie(algueTestConnu, algueTestAleatoire);
        System.out.print("Tous les tests ont réussis\n");
    }

}