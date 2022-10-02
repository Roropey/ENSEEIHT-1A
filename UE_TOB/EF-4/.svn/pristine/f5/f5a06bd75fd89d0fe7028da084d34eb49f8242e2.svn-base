package Tests;

import Espece.Aigle;
import Utile.*;
import Espece.Etat;
import Environement.*;

public class TestAigle {
    public static void testerNom(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getNom(), "Aigle", "Problème nom");
    }
    
    public static void testerDureeDeVie(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getDureeDeVie(), 32, "Problème durée de vie");
    }

    /*public static void testerComestible(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getComestible(), "Aigle", texte: "Problème nom");
    }*/

    public static void testerTauxReproduction(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getTauxReproduction(2), 0, "Problème taux reproduction mineur");
        Assert.assertEquals(aigleTest.getTauxReproduction(5), 2, "Problème taux reproduction majeur");
    }

    public static void testerVitesse(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getVitesse(), 0, "Problème vitesse default");
        aigleTest.setVitesse(Etat.Normal);
        Assert.assertEquals(aigleTest.getVitesse(), 4, "Problème vitesse normal");
        aigleTest.setVitesse(Etat.Apeure);
        Assert.assertEquals(aigleTest.getVitesse(), 4, "Problème vitesse apeure");
        aigleTest.setVitesse(Etat.EnChasse);
        Assert.assertEquals(aigleTest.getVitesse(), 6, "Problème vitesse en chasse");
        aigleTest.setVitesse(Etat.Blesse);
        Assert.assertEquals(aigleTest.getVitesse(), 3, "Problème vitesse blesse");
    }

    /*public static void testerMortalite(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getMortalite(Environement.Prairie), 0, "Problème mortalite");
    }*/

    public static void testerMajorite(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getMajorite(), 4, "Problème majorité");
    }

    public static void testerEcartTypeEspece(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getEcartTypeEspece(), 2, "Problème écart-type espèce");
    }

    public static void testerPorteeAction(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getPorteeAction(), 5, "Problème portée action");
    }

    public static void testerPorteeVision(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getPorteeVision(), 5, "Problème portée vision");
    }

    public static void testerSatieteMAx(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getSatieteMax(), 100, "Problème satiété max");
    }

    /*public static void testerFerveurSeuil(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getFerveurSeuil(), 0, "Problème ferveur seuil");
    }*/

    /*public static void testerValeurNutritive(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getValeurNutritive(), 0, "Problème valeur nutritive");
    }*/

    public static void testerNbEnfants(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getNbEnfantsMin(), 0, "Problème nombre enfants min");
        Assert.assertEquals(aigleTest.getNbEnfantsMax(), 4, "Problème nombre enfants max");
    }

    public static void testerVolant(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getEstVolant(), true, "Problème est volant");
    }

    public static void testerMarin(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getEstMarin(), false, "Problème est marin");
    }

    public static void testerCategorie(Aigle aigleTest) {
        Assert.assertEquals(aigleTest.getCategorie(), Categorie.petitAnimal, "Problème catégorie");
    }

    public static void main(String[] args) {
        System.out.println("Création aigle de test\n");
        Aigle aigleTest = new Aigle();
        System.out.print("Vérification de la catégorie\n");
        testerCategorie(aigleTest);
        System.out.print("Vérification de la durée de vie\n");
        testerDureeDeVie(aigleTest);
        System.out.print("Vérification de l'écart-type espèce\n");
        testerEcartTypeEspece(aigleTest);
        System.out.print("Vérification de la majorité\n");
        testerMajorite(aigleTest);
        System.out.print("Vérification de est marin\n");
        testerMarin(aigleTest);
        System.out.print("Vérification du nombre d'enfants\n");
        testerNbEnfants(aigleTest);
        System.out.print("Vérification du nom\n");
        testerNom(aigleTest);
        System.out.print("Vérification de la portée d'action\n");
        testerPorteeAction(aigleTest);
        System.out.print("Vérification de la portée de vision\n");
        testerPorteeVision(aigleTest);
        System.out.print("Vérification de la satiété max\n");
        testerSatieteMAx(aigleTest);
        System.out.print("Vérification du taux de reproduction\n");
        testerTauxReproduction(aigleTest);
        System.out.print("Vérification de la vitesse\n");
        testerVitesse(aigleTest);
        System.out.print("Vérification de est volant\n");
        testerVolant(aigleTest);
    }

}

