package Tests;

import Espece.Sardine;
import Utile.*;
import Espece.Etat;
import Environement.*;

public class TestSardine {
    public static void testerNom(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getNom(), "Sardine", "Problème nom");
    }
    
    public static void testerDureeDeVie(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getDureeDeVie(), 15, "Problème durée de vie");
    }

    /*public static void testerComestible(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getComestible(), "Sardine", texte: "Problème nom");
    }*/

    public static void testerTauxReproduction(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getTauxReproduction(1), 0, "Problème taux reproduction mineur");
        Assert.assertEquals(sardineTest.getTauxReproduction(5), 7, "Problème taux reproduction majeur");
    }

    public static void testerVitesse(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getVitesse(), 0, "Problème vitesse default");
        sardineTest.setVitesse(Etat.Normal);
        Assert.assertEquals(sardineTest.getVitesse(), 2, "Problème vitesse normal");
        sardineTest.setVitesse(Etat.Apeure);
        Assert.assertEquals(sardineTest.getVitesse(), 3, "Problème vitesse apeure");
        sardineTest.setVitesse(Etat.EnChasse);
        Assert.assertEquals(sardineTest.getVitesse(), 3, "Problème vitesse en chasse");
        sardineTest.setVitesse(Etat.Blesse);
        Assert.assertEquals(sardineTest.getVitesse(), 1, "Problème vitesse blesse");
    }

    /*public static void testerMortalite(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getMortalite(Environement.Prairie), 0, "Problème mortalite");
    }*/

    public static void testerMajorite(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getMajorite(), 2, "Problème majorité");
    }

    public static void testerEcartTypeEspece(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getEcartTypeEspece(), 2, "Problème écart-type espèce");
    }

    public static void testerPorteeAction(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getPorteeAction(), 1, "Problème portée action");
    }

    public static void testerPorteeVision(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getPorteeVision(), 2, "Problème portée vision");
    }

    public static void testerSatieteMAx(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getSatieteMax(), 100, "Problème satiété max");
    }

    /*public static void testerFerveurSeuil(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getFerveurSeuil(), 0, "Problème ferveur seuil");
    }*/

    /*public static void testerValeurNutritive(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getValeurNutritive(), 0, "Problème valeur nutritive");
    }*/

    public static void testerNbEnfants(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getNbEnfantsMin(), 0, "Problème nombre enfants min");
        Assert.assertEquals(sardineTest.getNbEnfantsMax(), 100, "Problème nombre enfants max");
    }

    public static void testerVolant(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getEstVolant(), false, "Problème est volant");
    }

    public static void testerMarin(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getEstMarin(), true, "Problème est marin");
    }

    public static void testerCategorie(Sardine sardineTest) {
        Assert.assertEquals(sardineTest.getCategorie(), Categorie.petitAnimal, "Problème catégorie");
    }
    public static void main(String[] args) {
        System.out.println("Création sardine de test\n");
        Sardine sardineTest = new Sardine();
        System.out.print("Vérification de la catégorie\n");
        testerCategorie(sardineTest);
        System.out.print("Vérification de la durée de vie\n");
        testerDureeDeVie(sardineTest);
        System.out.print("Vérification de l'écart-type espèce\n");
        testerEcartTypeEspece(sardineTest);
        System.out.print("Vérification de la majorité\n");
        testerMajorite(sardineTest);
        System.out.print("Vérification de est marin\n");
        testerMarin(sardineTest);
        System.out.print("Vérification du nombre d'enfants\n");
        testerNbEnfants(sardineTest);
        System.out.print("Vérification du nom\n");
        testerNom(sardineTest);
        System.out.print("Vérification de la portée d'action\n");
        testerPorteeAction(sardineTest);
        System.out.print("Vérification de la portée de vision\n");
        testerPorteeVision(sardineTest);
        System.out.print("Vérification de la satiété max\n");
        testerSatieteMAx(sardineTest);
        System.out.print("Vérification du taux de reproduction\n");
        testerTauxReproduction(sardineTest);
        System.out.print("Vérification de la vitesse\n");
        testerVitesse(sardineTest);
        System.out.print("Vérification de est volant\n");
        testerVolant(sardineTest);
    }
}
