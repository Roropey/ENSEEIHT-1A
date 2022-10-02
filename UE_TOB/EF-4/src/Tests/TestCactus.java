package Tests;

import Ressources.Cactus;
import Utile.*;

public class TestCactus {

     public static void testerPosition(Cactus cactusTestConnu, Cactus cactusTestAleatoire){
        Position positionConnue = cactusTestConnu.getPosition();
        Position positionAleatoire = cactusTestAleatoire.getPosition();
        Assert.assertEquals(positionConnue.getX(),4.0,"Problème Connu X");
        Assert.assertEquals(positionConnue.getY(),10.5,"Problème Connu Y");
        Assert.assertGreater(positionAleatoire.getX(),10.5,"Problème Aléatoire X borne inf");
        Assert.assertGreater(50,positionAleatoire.getX(),"Problème Aléatoire X borne sup");
        Assert.assertGreater(positionAleatoire.getY(),20,"Problème Aléatoire Y borne inf");
        Assert.assertGreater(30,positionAleatoire.getY(),"Problème Aléatoire Y borne sup");
    }

    public static void testerNutrition(Cactus cactusTestConnu, Cactus cactusTestAleatoire){
        Assert.assertEquals(cactusTestConnu.getValeurNutritive(),3,"Problème Connu valeur nutritive");
        Assert.assertEquals(cactusTestAleatoire.getValeurNutritive(),3,"Problème Aléatoire valeur nutritive");
    }

    public static void testerNom(Cactus cactusTestConnu, Cactus cactusTestAleatoire){
        Assert.assertEquals(cactusTestConnu.getNom(),"Cactus","Problème Connue nom");
        Assert.assertEquals(cactusTestAleatoire.getNom(),"Cactus","Problème Aléatoire nom");
    }

    public static void testerCategorie(Cactus cactusTestConnu, Cactus cactusTestAleatoire){
        Assert.assertEquals(cactusTestConnu.getCategorie(),Categorie.plante,"Problème Connue catégorie");
        Assert.assertEquals(cactusTestAleatoire.getCategorie(),Categorie.plante,"Problème Aléatoire catégorie");
    }


    public static void main (String[] args){
         
        System.out.print("Création cactus de test\n");
        Cactus cactusTestConnu = new Cactus(4,10);
        Cactus cactusTestAleatoire = new Cactus(10,50,20,30);
        System.out.print("Vérification des positions\n");
        testerPosition(cactusTestConnu, cactusTestAleatoire);
        System.out.print("Vérification des valeurs nutritionnaires\n");
        testerNutrition(cactusTestConnu, cactusTestAleatoire);
        System.out.print("Vérification des noms\n");
        testerNom(cactusTestConnu, cactusTestAleatoire);
        System.out.print("Vérification des catégories\n");
        testerCategorie(cactusTestConnu, cactusTestAleatoire);
        System.out.print("Tous les tests ont réussis\n");
    }

}