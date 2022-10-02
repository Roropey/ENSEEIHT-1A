package Simulation;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Random;

import Environement.Environnement;
import Ressources.Ressource;
import Utile.Position;
import Espece.Espece;
import Espece.Individu;

public class Simulation {

    private Environnement environnement;
    private ArrayList<Individu> individus;
    private ArrayList<Ressource> ressources;
    //private File fichierEvolution;
    //private FileWriter writerEvo;
    private int nbIteration;
    private int itmax = 100;

    public Simulation(Environnement env) {
        this.environnement = env;
        this.ressources = new ArrayList<Ressource>();
        this.individus = new ArrayList<Individu>();
        this.nbIteration = 0;
        //int nbessai = 0;
        //fichierEvolution = new File("evolutionGlobale.txt");
        //try {
        //    while(!fichierEvolution.createNewFile()) {
        //        nbessai ++;
        //        fichierEvolution = new File("mon_test" + nbessai + ".txt"); 
        //    } 
        //    writerEvo = new FileWriter(fichierEvolution);
        //} catch (Exception e) {
        //    System.out.println("Erreur lors de la création de evolutionGlobale.txt");
        //}
    }

    public void ajouterIndividu(Individu indiv) {
        this.individus.add(indiv);
    }

    public void ajouterIndividu(Collection<Individu> indiv) {
        this.individus.addAll(indiv);
    }

    public void ajouterRessource(Ressource ress) {
        this.ressources.add(ress);
    }

    public void ajouterRessource(Collection<Ressource> ress) {
        this.ressources.addAll(ress);
    }

    public ArrayList<Individu> getIndividus() {
        return this.individus;
    }

    public ArrayList<Ressource> getRessources() {
        return this.ressources;
    }

    public Environnement getEnvironnement() {
        return this.environnement;
    }

    public void setEnvironnement(Environnement env){

    }

    public int getNombreIndividu() {
        return this.individus.size();
    }

    public int getNombreIndividu(Espece e) {
        int nb = 0;
        for (Individu i : individus) {
            if (i.getEspece() == e) {
                nb ++;
            }
        }
        return nb;
    }

    private void interactions() {
        ArrayList<Individu> individusMaj = new ArrayList<Individu>();
        individusMaj.addAll(individus);

        ArrayList<Individu> individusATester = new ArrayList<Individu>();
        ArrayList<Individu> individusTestes = new ArrayList<Individu>();

        ArrayList<Ressource> ressourcesMaj= new ArrayList<Ressource>();

        ArrayList<Individu> nouvIndivs = new ArrayList<Individu>();

        for (Individu i : individus) {
            individusTestes.add(i);
            individusATester.clear();
            individusATester.addAll(individusMaj);
            individusATester.removeAll(individusTestes);
            boolean aMange = false;

            for (Individu j : individusATester) {
                if (i.estAPorteeAction(j.getPosition()) && !j.estMort()) {
                    if (i.aFaim() && i.peutManger(j)) {
                        i.mange(j);
                        aMange = true;

                    } else if (j.aFaim() && j.peutManger(i)) {
                        j.mange(i);
                        
                    } else if ((i.getEspece() == j.getEspece()) && (i.getSex() != j.getSex())) {
                        if(individusMaj.size()<500){
                            nouvIndivs = i.seReproduit(j);
                            if (nouvIndivs != null) {
                                individusMaj.addAll(nouvIndivs);
                            }
                        }
                    }

                    if (i.estMort()) {
                        individusMaj.remove(i);
                    } else if (j.estMort()) {
                        individusMaj.remove(j);
                    }
                }
            }

            ressourcesMaj.clear();
            ressourcesMaj.addAll(this.ressources);

            for (Ressource r : this.ressources) {
                if (i.estAPorteeAction(r.getPosition()) && i.aFaim() && !aMange && i.peutManger(r)) {
                    i.mange(r);
                    aMange = true;
                }
                if (!r.getExiste()) {
                    ressourcesMaj.remove(r);
                }
            }
            this.ressources.clear();
            this.ressources.addAll(ressourcesMaj);
        }
        individus = individusMaj;
    }

    private boolean estValide(Position deplacement, Individu i) {
        int type = environnement.getType(deplacement); // -1 = eau, 0 = sol
        return i.getEspece().getEstMarin() ? type<0 : type>=0 || i.getEspece().getEstVolant();
    }

    private boolean bougerCible(Position cible, Individu i) {
        int it = 0;
        Position courte = i.deplacerVers(cible, this.environnement.getDimensions());
        if (new Random().nextDouble()<0.98){
            if (estValide(courte, i)) {
                i.deplacerA(courte);
            } else {
                int x, y;
                Random random = new Random();
                do{
                    x = random.nextInt(this.environnement.getDimensions()[0]);
                    y = random.nextInt(this.environnement.getDimensions()[1]);

                    courte = new Position(x, y);
                }while(!estValide(courte, i));
                Position tirage;
            
                
                    do {
                        tirage = i.getPositionPotentielle(this.environnement.getDimensions());
                        if (cible.distance(tirage)<cible.distance(courte) && estValide(tirage, i)) {
                            courte = tirage;
                        }
                        it++;
                    } while (it<this.itmax);
                    if (it >= this.itmax) {
                        return false;
                    } else {
                        i.deplacerA(courte);
                        
                    }


            }
        }else{
            int x, y;
            Random random = new Random();
            do{
                x = random.nextInt(this.environnement.getDimensions()[0]);
                y = random.nextInt(this.environnement.getDimensions()[1]);

                courte = new Position(x, y);
            }while(!estValide(courte, i));
            i.deplacerA(courte);
        }
        return true;
    }
    // deplacement sans la vision, ancienne version

    private void deplacement() {
        ArrayList<Individu> individusMaj = new ArrayList<Individu>();
        individusMaj.addAll(this.individus);
        for (Individu i : individus) {
            Position test;
            do{
                test = i.getPositionPotentielle(this.environnement.getDimensions());
            }while(!estValide(test,i));
            i.deplacerA(test);
              
            i.iterer();
            if (i.estMort()) {
                individusMaj.remove(i);
            }
            individus = individusMaj;
        }
    }

    private void deplacementVision() {
        ArrayList<Individu> individusATester = new ArrayList<Individu>();
        individusATester.addAll(this.individus);
        ArrayList<Individu> individusMaj = new ArrayList<Individu>();
        individusMaj.addAll(this.individus);
        double distCible = -1;
        double distLocal = -2;
        boolean aCible = false;
        Position cible = new Position(0, 0);

        for (Individu i : individus) {
            boolean aBouge = false;
            
            if (i.aFaim()) {
                for (Ressource r : ressources) {
                    if (i.peutManger(r) && i.estAPorteeVision(r.getPosition())) {
                        distLocal = i.getPosition().distance(r.getPosition());
                        if (!aCible || distLocal < distCible && estValide(cible, i)) {
                            distCible = distLocal;
                            cible = r.getPosition();
                            aCible = true;
                        } 
                    }
                }

                if (aCible) {
                    aBouge = bougerCible(cible, i);
                }
            }

            individusATester.remove(i);

            if (!aBouge) {
                for (Individu j : individusATester) {
                    if (i.estAPorteeVision(j.getPosition())) {
                        if (i.aFaim()) {
                            if (i.peutManger(j)) {
                                distCible = i.getPosition().distance(j.getPosition());
                                if (!aCible || distLocal < distCible && estValide(cible, i)) {
                                    distCible = distLocal;
                                    cible = j.getPosition();
                                    aCible = true;
                                }
                            }

                        } else if (i.estEnChaleur() && (i.getEspece() == j.getEspece()) &&
                         (i.getSex() != j.getSex()) && j.estEnChaleur()) {
                            distCible = i.getPosition().distance(j.getPosition());
                            if (!aCible || distLocal < distCible && estValide(cible, i)) {
                                distCible = distLocal;
                                cible = j.getPosition();
                                aCible = true;
                            }
                        }
                    }
                }

                if (aCible) {
                    aBouge = bougerCible(cible, i);
                }
            } 

            if (!aBouge) {
                int it = 0;
                while (!aBouge && it<this.itmax) {

                    cible = i.getPositionPotentielle(this.environnement.getDimensions());
                    if (estValide(cible, i)) {
                        i.deplacerA(cible);
                        aBouge = true;
                        
                    }
                    it++;
                } 
            }

            i.iterer();

            if (i.estMort()) {
            individusMaj.remove(i);
            }
        }
        individus = individusMaj;
    }

    //private void ecrireRapport() {
    //    try {
    //        writerEvo.write(this.nbIteration + ", " + "\n");
    //    } catch(Exception e) {
    //        System.out.println("Erreur lors de l'ecriture dans le fichier.\n");
    //    }
    //}

    public void iterer() {
        this.nbIteration ++;

        deplacementVision();

        interactions();

        List<Ressource> nouvellesRessources = environnement.apparaitre();
        // si environnnement pas modifié: retour de .apparaitre qui doit etre une array
        //Ressource nouvellesRessources = environnement.apparaitre();
        if (nouvellesRessources != null) {
            ressources.addAll(nouvellesRessources);
            //ressources.add(nouvellesRessources);
        }

        //ecrireRapport();
    }
}
