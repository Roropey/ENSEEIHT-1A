package Espece;

import java.awt.Color;
import java.util.ArrayList;
import java.util.List;

import Environement.Environnement;
import Utile.Categorie;
import Utile.Comestible;

public class Aigle implements Espece {

    private String Nom = "Aigle";
    private int Majorite = 4;
    private double ecartTypeEspece = 0.1;
    private int porteeAction = 5;
    private int porteeVision = 5;
    private double vitesse;
    private int vieMax = 32;
    private int satieteMax = 100;
    private List<Categorie> comestible;
    private int ferveurSeuil;
    private int nbEnfantsMin = 0;
    private int nbEnfantsMax = 4;
    private int valeurNutritive;
    private boolean estVolant = true;
    private boolean estMarin = false;
    private Categorie categorie = Categorie.petitAnimal;
    private Color couleur = Color.YELLOW;

    public Aigle() {
        Nom = "Aigle";
        Majorite = 4;
        ecartTypeEspece = 0.2;
        porteeAction = 5;
        porteeVision = 5;
        vitesse = 30;
        vieMax = 32;
        satieteMax = 100;
        comestible = new ArrayList<Categorie>();
        comestible.add(Categorie.petitAnimal);
        comestible.add(Categorie.fruit);
        ferveurSeuil = 10;
        nbEnfantsMin = 0;
        nbEnfantsMax = 4;
        valeurNutritive = 25;
        estVolant = true;
        estMarin = false;
        categorie = Categorie.petitAnimal;
        couleur = Color.YELLOW;
    }

    @Override
    public String getNom() {
        return this.Nom;
    }

    @Override
    public int getDureeDeVie() {
        return this.vieMax;
    }

    @Override
    public List<Categorie> getComestible() {
        return this.comestible;
    }

    @Override
    public double getTauxReproduction(int Age) {
        if (Age > this.Majorite) {
            return 2;
        } else {
            return 0;
        }
    }

    @Override
    public double getMortalite(Environnement environement) {
        /*switch (environement) {
            //TODO compléter les différents environnements
            case Prairie : return 0;

            case
        }*/
        return 0;
    }

    @Override
    public int getMajorite() {
        return this.Majorite;
    }

    @Override
    public double getEcartTypeEspece() {
        return this.ecartTypeEspece;
    }

    @Override
    public int getPorteeAction() {
        return this.porteeAction;
    }

    @Override
    public int getPorteeVision() {
        return this.porteeVision;
    }

    @Override
    public int getSatieteMax() {
        return this.satieteMax;
    }

    @Override
    public int getFerveurSeuil() {
        return this.ferveurSeuil;
    }

    @Override
    public int getValeurNutritive() {
        return this.valeurNutritive;
    }

    @Override
    public int getNbEnfantsMin() {
        return this.nbEnfantsMin;
    }

    @Override
    public int getNbEnfantsMax() {
        return this.nbEnfantsMax;
    }

    @Override
    public double setVitesse(Etat etat) {
        switch (etat) {

            case Apeure :
                return 4;
            
            case EnChasse :
                return 6;

            case Blesse :
                return 3;

            case Normal :
                return 4;

            default : System.out.print("Erreur Etat");
            return 0;
        }
    }

    @Override
    public double getVitesse() {
        return this.vitesse;
    }

    @Override
    public boolean getEstVolant() {
        return this.estVolant;
    }

    @Override
    public boolean getEstMarin() {
        return this.estMarin;
    }

    @Override
    public Categorie getCategorie() {
        return this.categorie;
    }

    @Override
    public Color getColor() {
        return this.couleur;
    }
    
}
