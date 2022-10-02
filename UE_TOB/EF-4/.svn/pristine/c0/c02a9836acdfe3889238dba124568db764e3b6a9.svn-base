package Tests;

import Espece.Mouton;
import Utile.*;
import Espece.Etat;
import Environement.*;

public class TestMouton {
    public static void testerNom(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getNom(), "Mouton", "Problème nom");
    }
    
    public static void testerDureeDeVie(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getDureeDeVie(), 11, "Problème durée de vie");
    }

    /*public static void testerComestible(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getComestible(), "Mouton", texte: "Problème nom");
    }*/

    public static void testerTauxReproduction(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getTauxReproduction(0), 0, "Problème taux reproduction mineur");
        Assert.assertEquals(moutonTest.getTauxReproduction(5), 7, "Problème taux reproduction majeur");
    }

    public static void testerVitesse(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getVitesse(), 0, "Problème vitesse default");
        moutonTest.setVitesse(Etat.Normal);
        Assert.assertEquals(moutonTest.getVitesse(), 1, "Problème vitesse normal");
        moutonTest.setVitesse(Etat.Apeure);
        Assert.assertEquals(moutonTest.getVitesse(),2, "Problème vitesse apeure");
        moutonTest.setVitesse(Etat.EnChasse);
        Assert.assertEquals(moutonTest.getVitesse(), 1, "Problème vitesse en chasse");
        moutonTest.setVitesse(Etat.Blesse);
        Assert.assertEquals(moutonTest.getVitesse(), 0, "Problème vitesse blesse");
    }

    /*public static void testerMortalite(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getMortalite(Environement.Prairie), 0, "Problème mortalite");
    }*/

    public static void testerMajorite(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getMajorite(), 1, "Problème majorité");
    }

    public static void testerEcartTypeEspece(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getEcartTypeEspece(), 2, "Problème écart-type espèce");
    }

    public static void testerPorteeAction(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getPorteeAction(), 1, "Problème portée action");
    }

    public static void testerPorteeVision(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getPorteeVision(), 2, "Problème portée vision");
    }

    public static void testerSatieteMAx(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getSatieteMax(), 100, "Problème satiété max");
    }

    /*public static void testerFerveurSeuil(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getFerveurSeuil(), 0, "Problème ferveur seuil");
    }*/

    /*public static void testerValeurNutritive(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getValeurNutritive(), 0, "Problème valeur nutritive");
    }*/

    public static void testerNbEnfants(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getNbEnfantsMin(), 0, "Problème nombre enfants min");
        Assert.assertEquals(moutonTest.getNbEnfantsMax(), 1, "Problème nombre enfants max");
    }

    public static void testerVolant(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getEstVolant(), false, "Problème est volant");
    }

    public static void testerMarin(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getEstMarin(), false, "Problème est marin");
    }

    public static void testerCategorie(Mouton moutonTest) {
        Assert.assertEquals(moutonTest.getCategorie(), Categorie.moyenAnimal, "Problème catégorie");
    }
    public static void main(String[] args) {
        System.out.println("Création mouton de test\n");
        Mouton moutonTest = new Mouton();
        System.out.print("Vérification de la catégorie\n");
        testerCategorie(moutonTest);
        System.out.print("Vérification de la durée de vie\n");
        testerDureeDeVie(moutonTest);
        System.out.print("Vérification de l'écart-type espèce\n");
        testerEcartTypeEspece(moutonTest);
        System.out.print("Vérification de la majorité\n");
        testerMajorite(moutonTest);
        System.out.print("Vérification de est marin\n");
        testerMarin(moutonTest);
        System.out.print("Vérification du nombre d'enfants\n");
        testerNbEnfants(moutonTest);
        System.out.print("Vérification du nom\n");
        testerNom(moutonTest);
        System.out.print("Vérification de la portée d'action\n");
        testerPorteeAction(moutonTest);
        System.out.print("Vérification de la portée de vision\n");
        testerPorteeVision(moutonTest);
        System.out.print("Vérification de la satiété max\n");
        testerSatieteMAx(moutonTest);
        System.out.print("Vérification du taux de reproduction\n");
        testerTauxReproduction(moutonTest);
        System.out.print("Vérification de la vitesse\n");
        testerVitesse(moutonTest);
        System.out.print("Vérification de est volant\n");
        testerVolant(moutonTest);
    }
}
