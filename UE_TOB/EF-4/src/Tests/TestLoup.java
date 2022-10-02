package Tests;

import Espece.Loup;
import Utile.*;
import Espece.Etat;
import Environement.*;

public class TestLoup {

    public static void testerNom(Loup loupTest) {
        Assert.assertEquals(loupTest.getNom(), "Loup", "Problème nom");
    }
    
    public static void testerDureeDeVie(Loup loupTest) {
        Assert.assertEquals(loupTest.getDureeDeVie(), 14, "Problème durée de vie");
    }

    /*public static void testerComestible(Loup loupTest) {
        Assert.assertEquals(loupTest.getComestible(), "Loup", texte: "Problème nom");
    }*/

    public static void testerTauxReproduction(Loup loupTest) {
        Assert.assertEquals(loupTest.getTauxReproduction(2), 0, "Problème taux reproduction mineur");
        Assert.assertEquals(loupTest.getTauxReproduction(5), 7, "Problème taux reproduction majeur");
    }

    public static void testerVitesse(Loup loupTest) {
        Assert.assertEquals(loupTest.getVitesse(), 0, "Problème vitesse default");
        loupTest.setVitesse(Etat.Normal);
        Assert.assertEquals(loupTest.getVitesse(), 2, "Problème vitesse normal");
        loupTest.setVitesse(Etat.Apeure);
        Assert.assertEquals(loupTest.getVitesse(), 3, "Problème vitesse apeure");
        loupTest.setVitesse(Etat.EnChasse);
        Assert.assertEquals(loupTest.getVitesse(), 3, "Problème vitesse en chasse");
        loupTest.setVitesse(Etat.Blesse);
        Assert.assertEquals(loupTest.getVitesse(), 1, "Problème vitesse blesse");
    }

    /*public static void testerMortalite(Loup loupTest) {
        Assert.assertEquals(loupTest.getMortalite(Environement.Prairie), 0, "Problème mortalite");
    }*/

    public static void testerMajorite(Loup loupTest) {
        Assert.assertEquals(loupTest.getMajorite(), 3, "Problème majorité");
    }

    public static void testerEcartTypeEspece(Loup loupTest) {
        Assert.assertEquals(loupTest.getEcartTypeEspece(), 2, "Problème écart-type espèce");
    }

    public static void testerPorteeAction(Loup loupTest) {
        Assert.assertEquals(loupTest.getPorteeAction(), 4, "Problème portée action");
    }

    public static void testerPorteeVision(Loup loupTest) {
        Assert.assertEquals(loupTest.getPorteeVision(), 3, "Problème portée vision");
    }

    public static void testerSatieteMAx(Loup loupTest) {
        Assert.assertEquals(loupTest.getSatieteMax(), 100, "Problème satiété max");
    }

    /*public static void testerFerveurSeuil(Loup loupTest) {
        Assert.assertEquals(loupTest.getFerveurSeuil(), 0, "Problème ferveur seuil");
    }*/

    /*public static void testerValeurNutritive(Loup loupTest) {
        Assert.assertEquals(loupTest.getValeurNutritive(), 0, "Problème valeur nutritive");
    }*/

    public static void testerNbEnfants(Loup loupTest) {
        Assert.assertEquals(loupTest.getNbEnfantsMin(), 0, "Problème nombre enfants min");
        Assert.assertEquals(loupTest.getNbEnfantsMax(), 1, "Problème nombre enfants max");
    }

    public static void testerVolant(Loup loupTest) {
        Assert.assertEquals(loupTest.getEstVolant(), false, "Problème est volant");
    }

    public static void testerMarin(Loup loupTest) {
        Assert.assertEquals(loupTest.getEstMarin(), false, "Problème est marin");
    }

    public static void testerCategorie(Loup loupTest) {
        Assert.assertEquals(loupTest.getCategorie(), Categorie.moyenAnimal, "Problème catégorie");
    }

    public static void main(String[] args) {
        System.out.println("Création loup de test\n");
        Loup loupTest = new Loup();
        System.out.print("Vérification de la catégorie\n");
        testerCategorie(loupTest);
        System.out.print("Vérification de la durée de vie\n");
        testerDureeDeVie(loupTest);
        System.out.print("Vérification de l'écart-type espèce\n");
        testerEcartTypeEspece(loupTest);
        System.out.print("Vérification de la majorité\n");
        testerMajorite(loupTest);
        System.out.print("Vérification de est marin\n");
        testerMarin(loupTest);
        System.out.print("Vérification du nombre d'enfants\n");
        testerNbEnfants(loupTest);
        System.out.print("Vérification du nom\n");
        testerNom(loupTest);
        System.out.print("Vérification de la portée d'action\n");
        testerPorteeAction(loupTest);
        System.out.print("Vérification de la portée de vision\n");
        testerPorteeVision(loupTest);
        System.out.print("Vérification de la satiété max\n");
        testerSatieteMAx(loupTest);
        System.out.print("Vérification du taux de reproduction\n");
        testerTauxReproduction(loupTest);
        System.out.print("Vérification de la vitesse\n");
        testerVitesse(loupTest);
        System.out.print("Vérification de est volant\n");
        testerVolant(loupTest);
    }
}
