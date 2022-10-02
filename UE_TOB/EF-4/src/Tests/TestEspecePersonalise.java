package Tests;

import Espece.Personalise;
import Utile.*;
import Espece.Etat;
import Environement.*;

public class TestEspecePersonalise {
    public static void testerNom(Personalise personaliseTest) {
        Assert.assertEquals(personaliseTest.getNom(), "Dragon", "Problème nom");
    }
    
    public static void testerDureeDeVie(Personalise personaliseTest) {
        Assert.assertEquals(personaliseTest.getDureeDeVie(), 1000, "Problème durée de vie");
    }

    /*public static void testerComestible(Personalisé personaliseTest) {
        Assert.assertEquals(personaliseTest.getComestible(), "Personalisé", texte: "Problème nom");
    }*/

    public static void testerTauxReproduction(Personalise personaliseTest) {
        Assert.assertEquals(personaliseTest.getTauxReproduction(2), 0, "Problème taux reproduction mineur");
        Assert.assertEquals(personaliseTest.getTauxReproduction(5), 50, "Problème taux reproduction majeur");
    }

    public static void testerVitesse(Personalise personaliseTest) {
        Assert.assertEquals(personaliseTest.getVitesse(), 0, "Problème vitesse default");
        personaliseTest.setVitesse(Etat.Normal);
        Assert.assertEquals(personaliseTest.getVitesse(), 6, "Problème vitesse normal");
        personaliseTest.setVitesse(Etat.Apeure);
        Assert.assertEquals(personaliseTest.getVitesse(), 8, "Problème vitesse apeure");
        personaliseTest.setVitesse(Etat.EnChasse);
        Assert.assertEquals(personaliseTest.getVitesse(), 10, "Problème vitesse en chasse");
        personaliseTest.setVitesse(Etat.Blesse);
        Assert.assertEquals(personaliseTest.getVitesse(), 4, "Problème vitesse blesse");
    }

    /*public static void testerMortalite(Personalisé personaliseTest) {
        Assert.assertEquals(personaliseTest.getMortalite(Environement.Prairie), 0, "Problème mortalite");
    }*/

    public static void testerMajorite(Personalise personaliseTest) {
        Assert.assertEquals(personaliseTest.getMajorite(), 25, "Problème majorité");
    }

    public static void testerEcartTypeEspece(Personalise personaliseTest) {
        Assert.assertEquals(personaliseTest.getEcartTypeEspece(), 2, "Problème écart-type espèce");
    }

    public static void testerPorteeAction(Personalise personaliseTest) {
        Assert.assertEquals(personaliseTest.getPorteeAction(), 6, "Problème portée action");
    }

    public static void testerPorteeVision(Personalise personaliseTest) {
        Assert.assertEquals(personaliseTest.getPorteeVision(), 10, "Problème portée vision");
    }

    public static void testerSatieteMAx(Personalise personaliseTest) {
        Assert.assertEquals(personaliseTest.getSatieteMax(), 100, "Problème satiété max");
    }

    /*public static void testerFerveurSeuil(Personalisé personaliseTest) {
        Assert.assertEquals(personaliseTest.getFerveurSeuil(), 0, "Problème ferveur seuil");
    }*/

    /*public static void testerValeurNutritive(Personalisé personaliseTest) {
        Assert.assertEquals(personaliseTest.getValeurNutritive(), 0, "Problème valeur nutritive");
    }*/

    public static void testerNbEnfants(Personalise personaliseTest) {
        Assert.assertEquals(personaliseTest.getNbEnfantsMin(), 0, "Problème nombre enfants min");
        Assert.assertEquals(personaliseTest.getNbEnfantsMax(), 1, "Problème nombre enfants max");
    }

    public static void testerVolant(Personalise personaliseTest) {
        Assert.assertEquals(personaliseTest.getEstVolant(), true, "Problème est volant");
    }

    public static void testerMarin(Personalise personaliseTest) {
        Assert.assertEquals(personaliseTest.getEstMarin(), false, "Problème est marin");
    }

    public static void testerCategorie(Personalise personaliseTest) {
        Assert.assertEquals(personaliseTest.getCategorie(), Categorie.grandAnimal, "Problème catégorie");
    }
    public static void main(String[] args) {
        System.out.println("Création loup de test\n");
        Personalise personaliseTest = new Personalise("Dragon", 25, 2, 6, 10, 0, 1000, 100, comestibles, 1, 0, 1, 200, true, false, Categorie.grandAnimal);
        System.out.print("Vérification de la catégorie\n");
        testerCategorie(personaliseTest);
        System.out.print("Vérification de la durée de vie\n");
        testerDureeDeVie(personaliseTest);
        System.out.print("Vérification de l'écart-type espèce\n");
        testerEcartTypeEspece(personaliseTest);
        System.out.print("Vérification de la majorité\n");
        testerMajorite(personaliseTest);
        System.out.print("Vérification de est marin\n");
        testerMarin(personaliseTest);
        System.out.print("Vérification du nombre d'enfants\n");
        testerNbEnfants(personaliseTest);
        System.out.print("Vérification du nom\n");
        testerNom(personaliseTest);
        System.out.print("Vérification de la portée d'action\n");
        testerPorteeAction(personaliseTest);
        System.out.print("Vérification de la portée de vision\n");
        testerPorteeVision(personaliseTest);
        System.out.print("Vérification de la satiété max\n");
        testerSatieteMAx(personaliseTest);
        System.out.print("Vérification du taux de reproduction\n");
        testerTauxReproduction(personaliseTest);
        System.out.print("Vérification de la vitesse\n");
        testerVitesse(personaliseTest);
        System.out.print("Vérification de est volant\n");
        testerVolant(personaliseTest);
    }
}
