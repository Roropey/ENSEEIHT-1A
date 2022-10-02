package Tests;

import Ressources.Pomme;
import Utile.*;

public class TestPomme {

     public static void testerPosition(Pomme pommeTestConnu, Pomme pommeTestAleatoire){
        Position positionConnue = pommeTestConnu.getPosition();
        Position positionAleatoire = pommeTestAleatoire.getPosition();
        Assert.assertEquals(positionConnue.getX(),4.0,"Problème Connu X");
        Assert.assertEquals(positionConnue.getY(),10.5,"Problème Connu Y");
        Assert.assertGreater(positionAleatoire.getX(),10.5,"Problème Aléatoire X borne inf");
        Assert.assertGreater(50,positionAleatoire.getX(),"Problème Aléatoire X borne sup");
        Assert.assertGreater(positionAleatoire.getY(),20,"Problème Aléatoire Y borne inf");
        Assert.assertGreater(30,positionAleatoire.getY(),"Problème Aléatoire Y borne sup");
    }

    public static void testerNutrition(Pomme pommeTestConnu, Pomme pommeTestAleatoire){
        Assert.assertEquals(pommeTestConnu.getValeurNutritive(),2,"Problème Connu valeur nutritive");
        Assert.assertEquals(pommeTestAleatoire.getValeurNutritive(),2,"Problème Aléatoire valeur nutritive");
    }

    public static void testerNom(Pomme pommeTestConnu, Pomme pommeTestAleatoire){
        Assert.assertEquals(pommeTestConnu.getNom(),"Pomme","Problème Connue nom");
        Assert.assertEquals(pommeTestAleatoire.getNom(),"Pomme","Problème Aléatoire nom");
    }

    public static void testerCategorie(Pomme pommeTestConnu, Pomme pommeTestAleatoire){
        Assert.assertEquals(pommeTestConnu.getCategorie(),Categorie.fruit,"Problème Connue catégorie");
        Assert.assertEquals(pommeTestAleatoire.getCategorie(),Categorie.fruit,"Problème Aléatoire catégorie");
    }

    public static void main (String[] args){
         
        System.out.print("Création pommes de test\n");
        Pomme pommeTestConnu = new Pomme(4,10.5);
        Pomme pommeTestAleatoire = new Pomme(10.5,50,20,30);
        System.out.print("Vérification des positions\n");
        testerPosition(pommeTestConnu, pommeTestAleatoire);
        System.out.print("Vérification des valeurs nutritionnaires\n");
        testerNutrition(pommeTestConnu, pommeTestAleatoire);
        System.out.print("Vérification des noms\n");
        testerNom(pommeTestConnu, pommeTestAleatoire);
        System.out.print("Vérification des catégories\n");
        testerCategorie(pommeTestConnu, pommeTestAleatoire);
        System.out.print("Tous les tests ont réussis\n");
    }

}