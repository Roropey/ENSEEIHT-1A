package Tests;

import Espece.Dauphin;
import Utile.*;
import Espece.Etat;
import Environement.*;

public class TestDauphin {
    public static void testerNom(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getNom(), "Dauphin", "Problème nom");
    }
    
    public static void testerDureeDeVie(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getDureeDeVie(), 40, "Problème durée de vie");
    }

    /*public static void testerComestible(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getComestible(), "Dauphin", texte: "Problème nom");
    }*/

    public static void testerTauxReproduction(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getTauxReproduction(2), 0, "Problème taux reproduction mineur");
        Assert.assertEquals(dauphinTest.getTauxReproduction(10), 7, "Problème taux reproduction majeur");
    }

    public static void testerVitesse(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getVitesse(), 0, "Problème vitesse default");
        dauphinTest.setVitesse(Etat.Normal);
        Assert.assertEquals(dauphinTest.getVitesse(), 2, "Problème vitesse normal");
        dauphinTest.setVitesse(Etat.Apeure);
        Assert.assertEquals(dauphinTest.getVitesse(), 3, "Problème vitesse apeure");
        dauphinTest.setVitesse(Etat.EnChasse);
        Assert.assertEquals(dauphinTest.getVitesse(), 3, "Problème vitesse en chasse");
        dauphinTest.setVitesse(Etat.Blesse);
        Assert.assertEquals(dauphinTest.getVitesse(), 1, "Problème vitesse blesse");
    }

    /*public static void testerMortalite(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getMortalite(Environement.Prairie), 0, "Problème mortalite");
    }*/

    public static void testerMajorite(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getMajorite(), 8, "Problème majorité");
    }

    public static void testerEcartTypeEspece(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getEcartTypeEspece(), 2, "Problème écart-type espèce");
    }

    public static void testerPorteeAction(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getPorteeAction(), 3, "Problème portée action");
    }

    public static void testerPorteeVision(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getPorteeVision(), 4, "Problème portée vision");
    }

    public static void testerSatieteMAx(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getSatieteMax(), 100, "Problème satiété max");
    }

    /*public static void testerFerveurSeuil(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getFerveurSeuil(), 0, "Problème ferveur seuil");
    }*/

    /*public static void testerValeurNutritive(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getValeurNutritive(), 0, "Problème valeur nutritive");
    }*/

    public static void testerNbEnfants(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getNbEnfantsMin(), 0, "Problème nombre enfants min");
        Assert.assertEquals(dauphinTest.getNbEnfantsMax(), 1, "Problème nombre enfants max");
    }

    public static void testerVolant(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getEstVolant(), false, "Problème est volant");
    }

    public static void testerMarin(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getEstMarin(), true, "Problème est marin");
    }

    public static void testerCategorie(Dauphin dauphinTest) {
        Assert.assertEquals(dauphinTest.getCategorie(), Categorie.moyenAnimal, "Problème catégorie");
    }

    public static void main(String[] args) {
        System.out.println("Création dauphin de test\n");
        Dauphin dauphinTest = new Dauphin();
        System.out.print("Vérification de la catégorie\n");
        testerCategorie(dauphinTest);
        System.out.print("Vérification de la durée de vie\n");
        testerDureeDeVie(dauphinTest);
        System.out.print("Vérification de l'écart-type espèce\n");
        testerEcartTypeEspece(dauphinTest);
        System.out.print("Vérification de la majorité\n");
        testerMajorite(dauphinTest);
        System.out.print("Vérification de est marin\n");
        testerMarin(dauphinTest);
        System.out.print("Vérification du nombre d'enfants\n");
        testerNbEnfants(dauphinTest);
        System.out.print("Vérification du nom\n");
        testerNom(dauphinTest);
        System.out.print("Vérification de la portée d'action\n");
        testerPorteeAction(dauphinTest);
        System.out.print("Vérification de la portée de vision\n");
        testerPorteeVision(dauphinTest);
        System.out.print("Vérification de la satiété max\n");
        testerSatieteMAx(dauphinTest);
        System.out.print("Vérification du taux de reproduction\n");
        testerTauxReproduction(dauphinTest);
        System.out.print("Vérification de la vitesse\n");
        testerVitesse(dauphinTest);
        System.out.print("Vérification de est volant\n");
        testerVolant(dauphinTest);
    }
}
