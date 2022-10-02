package Tests;

import Ressources.Arbre;
import Utile.*;

public class TestArbre {

    public static void testerPosition(Arbre arbreTestConnu, Arbre arbreTestAleatoire){
        Position positionConnue = arbreTestConnu.getPosition();
        Position positionAleatoire = arbreTestAleatoire.getPosition();
        Assert.assertEquals(positionConnue.getX(),4.0,"Problème Connu X");
        Assert.assertEquals(positionConnue.getY(),10.5,"Problème Connu Y");
        Assert.assertGreater(positionAleatoire.getX(),10.5,"Problème Aléatoire X borne inf");
        Assert.assertGreater(50,positionAleatoire.getX(),"Problème Aléatoire X borne sup");
        Assert.assertGreater(positionAleatoire.getY(),20,"Problème Aléatoire Y borne inf");
        Assert.assertGreater(30,positionAleatoire.getY(),"Problème Aléatoire Y borne sup");
    }

    public static void testerNutrition(Arbre arbreTestConnu, Arbre arbreTestAleatoire){
        Assert.assertEquals(arbreTestConnu.getValeurNutritive(),10,"Problème Connu valeur nutritive");
        Assert.assertEquals(arbreTestAleatoire.getValeurNutritive(),10,"Problème Aléatoire valeur nutritive");
    }

    public static void testerNom(Arbre arbreTestConnu, Arbre arbreTestAleatoire){
        Assert.assertEquals(arbreTestConnu.getNom(),"Arbre","Problème Connue nom");
        Assert.assertEquals(arbreTestAleatoire.getNom(),"Arbre","Problème Aléatoire nom");
    }

    public static void testerCategorie(Arbre arbreTestConnu, Arbre arbreTestAleatoire){
        Assert.assertEquals(arbreTestConnu.getCategorie(),Categorie.plante,"Problème Connue catégorie");
        Assert.assertEquals(arbreTestAleatoire.getCategorie(),Categorie.plante,"Problème Aléatoire catégorie");
    }

    public static void testerNbPommes(Arbre arbreTestConnu, Arbre arbreTestAleatoire){
        int nbArbreConnu = arbreTestConnu.getNbPommes();
        int nbArbreAleatoire = arbreTestAleatoire.getNbPommes();
        System.out.print("L'arbre dont la position est connue a "+nbArbreConnu+" pomme(s)\nL'arbre dont la position est aléatoire a "+nbArbreAleatoire+" pomme(s)\n");
        Assert.assertGreater(nbArbreConnu,0,"Problème Connue nombre pomme borne inférieur");
        Assert.assertGreater(6,nbArbreConnu,"Problème Connue nombre pomme borne supérieur");
        Assert.assertGreater(nbArbreAleatoire,0,"Problème Aléatoire nombre pomme borne inférieur");
        Assert.assertGreater(6,nbArbreAleatoire,"Problème Aléatoire nombre pomme borne supérieur");
    }

    public static void testerEstMangee(Arbre arbreTestConnu, Arbre arbreTestAleatoire){
        int nbArbreConnu = arbreTestConnu.getNbPommes();
        int nbArbreAleatoire = arbreTestAleatoire.getNbPommes();
        int i = 0;
        while(arbreTestConnu.estMangee()){
            i++;
            Assert.assertEquals(arbreTestConnu.getNbPommes()+i,nbArbreConnu,"Nombre pomme connu problème");
        }
        Assert.assertFalse(arbreTestConnu.estMangee(),"Problème arbre connu encore mangeable");

        i = 0;
        while(arbreTestAleatoire.estMangee()){
            i++;
            Assert.assertEquals(arbreTestAleatoire.getNbPommes()+i,nbArbreAleatoire,"Nombre pomme aléatoire problème");
        }
        Assert.assertFalse(arbreTestAleatoire.estMangee(),"Problème arbre aléatoire encore mangeable");
    }
    

    public static void main (String[] args){
         
        System.out.print("Création arbres de test\n");
        Arbre arbreTestConnu = new Arbre(4,10);
        Arbre arbreTestAleatoire = new Arbre(10,50,20,30);
        System.out.print("Vérification des positions\n");
        testerPosition(arbreTestConnu, arbreTestAleatoire);
        System.out.print("Vérification des valeurs nutritionnaires\n");
        testerNutrition(arbreTestConnu, arbreTestAleatoire);
        System.out.print("Vérification des noms\n");
        testerNom(arbreTestConnu, arbreTestAleatoire);
        System.out.print("Vérification des catégories\n");
        testerCategorie(arbreTestConnu, arbreTestAleatoire);
        System.out.print("Vérification de la présence de pomme(s)\n");
        testerNbPommes(arbreTestConnu, arbreTestAleatoire);
        System.out.print("Vérification estMangee() avec des pommes dans les arbres\n");
        testerEstMangee(arbreTestConnu, arbreTestAleatoire);
        System.out.print("Tous les tests ont réussis\n");
    }

}