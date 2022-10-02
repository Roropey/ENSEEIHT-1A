package Tests;


import Environement.*;
import Ressources.*;
import Utile.*;
import java.util.*;

public class TestDiffEnvironnements {
    
    public static void testerCaracteristique(Environnement environnementATeste, int[] caractersitiques){
        int[] caracteristiquesEnv = environnementATeste.getCaracteristique();
        Assert.assertEquals(caracteristiquesEnv[0],caractersitiques[0],"Problème humidité");
        Assert.assertEquals(caracteristiquesEnv[1],caractersitiques[1],"Problème fertilité");
    }
    
    public static void testerApparition(Environnement environnementATeste, int[] caractersitiques, List<String> ressourcesPossibles, List<String> ressourcesImpossibles){
        List<String> ressourceAquatique = Arrays.asList("Algue","Nénuphar");
        for (int i=1; i<=100; i++){
            List<Ressource> ressources = environnementATeste.apparaitre();
            Assert.assertGreater(caractersitiques[1],ressources.size(),"Problème taille liste ressource");
            while (!(ressources.isEmpty())){
                Ressource ressource = ressources.remove(ressources.size()-1);
                Assert.assertNotContains(ressourcesImpossibles,ressource.getNom(),"Problème ressource interdite : "+ressource.getNom());
                Assert.assertContains(ressourcesPossibles,ressource.getNom(), "Problème pas ressource possible : "+ressource.getNom());
                if(ressourceAquatique.contains(ressource.getNom())){
                    Assert.assertGreaterStrict(0,environnementATeste.getType(ressource.getPosition()),"Problème altitude et ressource "+ressource.getNom());
                }else{
                    Assert.assertGreater(environnementATeste.getType(ressource.getPosition()),0,"Problème altitude et ressource "+ressource.getNom());
                }
            }   
        }
    }

    public static void testerAltitudes(Environnement environnementATeste, List<Integer> listeAltitude){
        int[] dimensions = environnementATeste.getDimensions();
        for (int i = 1; i<=dimensions[0]; i++){
            for (int j = 1; j<=dimensions[1]; j++){
                
                Assert.assertContains(listeAltitude,environnementATeste.getType(new Position(i,j)),"Problème altitude : "+environnementATeste.getType(new Position(i,j)));
            }
        }
    }

    public static void lancerTests(Environnement environnementATeste, int[] caractersitiques, List<String> ressourcesPossibles, List<String> ressourcesImpossibles, List<Integer> listeAltitude) {
        System.out.print("Vérification de la caractéristique d'humidité\n");
        testerCaracteristique(environnementATeste,caractersitiques);
        System.out.print("Test d'apparition de 100 ressources\n");
        testerApparition(environnementATeste,caractersitiques,ressourcesPossibles,ressourcesImpossibles);
        System.out.print("Test altitude \n");
        testerAltitudes(environnementATeste,listeAltitude);
        System.out.print("Tous les tests de "+environnementATeste.getNom()+" ont réussis \n");
    }



    public static void main (String[] args){
        
        System.out.print("\nCréation mer de test\n\n");
        Mer merTest = new Mer(100,100);
        int[] caractersitiques={100,3};
        List<Integer> listeAltitude = new ArrayList<Integer>();
        listeAltitude.add(-3);
        listeAltitude.add(-2);
        listeAltitude.add(-1);
        List<String> listePossible = new ArrayList<String>();
        listePossible.add("Algue");
        listePossible.add("Nénuphar");
        List<String> listeImpossible = new ArrayList<String>();
        listeImpossible.add("Arbre");
        listeImpossible.add("Arbuste");
        listeImpossible.add("Cactus");
        lancerTests(merTest,caractersitiques,listePossible,listeImpossible,listeAltitude);

        System.out.print("\nCréation marécage de test\n\n");
        Marecage marecageTest = new Marecage(100,100); 
        caractersitiques[0] = 75;
        caractersitiques[1] = 20;
        listeAltitude.add(0);
        listePossible.add(listeImpossible.remove(0));
        lancerTests(marecageTest,caractersitiques,listePossible,listeImpossible,listeAltitude);

        System.out.print("\nCréation forêt de test\n\n");
        Foret foretTest = new Foret(100,100);
        caractersitiques[0] = 50;
        caractersitiques[1] = 60;
        listeAltitude.add(1);
        listeAltitude.add(2);
        listeAltitude.add(3);
        listeAltitude.add(4);
        listeAltitude.add(5);
        listePossible.add(listeImpossible.remove(0));
        listeImpossible.add(listePossible.remove(0));
        lancerTests(foretTest,caractersitiques,listePossible,listeImpossible,listeAltitude);

        System.out.print("\nCréation praire de test\n\n");
        Prairie prairieTest = new Prairie(100,100);
        caractersitiques[0] = 25;
        caractersitiques[1] = 15;
        listePossible.add(listeImpossible.remove(0));
        listeImpossible.add(listePossible.remove(0));
        lancerTests(prairieTest,caractersitiques,listePossible,listeImpossible,listeAltitude);

        System.out.print("\nCréation désert de test\n\n");
        Desert desertTest = new Desert(100,100);
        caractersitiques[0] = 0;
        caractersitiques[1] = 10;
        listePossible.add(listeImpossible.remove(0));
        listeImpossible.add(listePossible.remove(0));
        lancerTests(desertTest,caractersitiques,listePossible,listeImpossible,listeAltitude);


        System.out.print("\nTous les tests ont réussis\n\n");

    }

}