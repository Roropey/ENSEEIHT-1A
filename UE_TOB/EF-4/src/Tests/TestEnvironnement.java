package Tests;

import Environement.Environnement;
import Utile.*;

public class TestEnvironnement {
    
        
    public static void testAttribut(){
        Environnement environnementTest = new Environnement(100,200,"Test",35,40,5);
        Assert.assertEquals(environnementTest.getNom(),"Test","Problème nom environnement");
        int[] caracteristiques = environnementTest.getCaracteristique();
        Assert.assertEquals(caracteristiques[0],35,"Problème caractéristique humidité environnement");
        Assert.assertEquals(caracteristiques[1],40,"Problème caractéristique fertilité environnement");
        int[] dimensions = environnementTest.getDimensions();
        Assert.assertEquals(dimensions[0],100,"Problème première dimension");
        Assert.assertEquals(dimensions[1],200,"Problème deuxième dimension");
    }

    
    public static void testRobustesseX(){
        try {
            Environnement impossibleX = new Environnement(-100,200,"Problème X",40,40,5);
            throw new Echec("Attention environnement à dimension négative créée !");
        } catch(ValeurInterditeException e) {
            ;;
        }
        
    }

    public static void testRobustesseY(){
        try {
            Environnement impossibleY = new Environnement(100,-200,"Problème Y",60,40,5);
            throw new Echec("Attention environnement à dimension négative créée !");
        } catch(ValeurInterditeException e) {
            ;;
        }
        
    }

    public static void testRobustesseTropHumide(){
        try {
            Environnement impossibleTropH = new Environnement(100,200,"Problème trop humide",200,40,5);
            throw new Echec("Attention environnement trop humide créé !");
        } catch(ValeurInterditeException e) {
            ;;
        }
        
        
    }

    public static void testRobustessePasAssezHumide(){
        try {
            Environnement impossiblePasAssezH = new Environnement(100,200,"Problème pas assez humide",-10,40,5);
            throw new Echec("Attention environnement pas assez humide créé !");
        } catch(ValeurInterditeException e) {
            ;;
        }
        
    }

    public static void testRobustesseTropFertile(){
        try {
            Environnement impossibleTropF = new Environnement(100,200,"Problème trop fertile",50,200,5);
            throw new Echec("Attention environnement trop fertile créé !");
        } catch(ValeurInterditeException e) {
            ;;
        }
        
        
    }

    public static void testRobustessePasAssezFertile(){
        try {
            Environnement impossiblePasAssezF = new Environnement(100,200,"Problème pas assez fertile",50,-50,5);
            throw new Echec("Attention environnement pas assez fertile créé !");
        } catch(ValeurInterditeException e) {
            ;;
        }
        
    }

    public static void testRobustesseTropMontagneux(){
        try {
            Environnement impossibleTropM = new Environnement(100,200,"Problème trop fertile",50,2,101);
            throw new Echec("Attention environnement trop fertile créé !");
        } catch(ValeurInterditeException e) {
            ;;
        }
        
        
    }

    public static void testRobustessePasAssezMontagneux(){
        try {
            Environnement impossiblePasAssezM = new Environnement(100,200,"Problème pas assez fertile",50,5,-10);
            throw new Echec("Attention environnement pas assez fertile créé !");
        } catch(ValeurInterditeException e) {
            ;;
        }
        
    }


    public static void main (String[] args){
        System.out.print("Tests construction environnement\n");
        testAttribut();
        System.out.print("Test robustesse dimension x\n");
        testRobustesseX();
        System.out.print("Test robustesse dimension y\n");
        testRobustesseY();
        System.out.print("Test robustesse humidité\n");
        testRobustesseTropHumide();
        testRobustessePasAssezHumide();
        System.out.print("Test robustesse fertile\n");
        testRobustesseTropFertile();
        testRobustessePasAssezFertile();
        System.out.print("Tous les tests réussis\n");


    }    
}