package Espece;

import java.util.ArrayList;
import java.util.List;
import java.awt.Color;

import Environement.Environnement;
import Utile.Categorie;
import Utile.Comestible;

public class Dauphin implements Espece {

    private String Nom;
    private int Majorite;
    private double ecartTypeEspece;
    private int porteeAction;
    private int porteeVision;
    private double vitesse;
    private int vieMax;
    private int satieteMax;
    private List<Categorie> comestible;
    private int ferveurSeuil;
    private int nbEnfantsMin;
    private int nbEnfantsMax;
    private int valeurNutritive;
    private boolean estVolant;
    private boolean estMarin;
    private Categorie categorie;
    private Color couleur;

    public Dauphin() {
        Nom = "Dauphin";
        Majorite = 8;
        ecartTypeEspece = 0.2;
        porteeAction = 3;
        porteeVision = 4;
        vitesse = 12;
        vieMax = 40;
        satieteMax = 100;
        comestible = new ArrayList<Categorie>();
        comestible.add(Categorie.petitAnimal);
        comestible.add(Categorie.fruit);
        ferveurSeuil = 40;
        nbEnfantsMin = 0;
        nbEnfantsMax = 1;
        valeurNutritive = 40;
        estVolant = false;
        estMarin = true;
        categorie = Categorie.moyenAnimal;
        couleur = new Color(51,193,255);
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
            return 7;
        } else {
            return 0;
        }
    }

    @Override
    public double setVitesse(Etat etat) {
        switch (etat) {

            case Apeure :
                return 3;
            
            case EnChasse :
                return 3;

            case Blesse :
                return 1;

            case Normal :
                return 2;

            default : System.out.print("Erreur Etat");
            return 0;
        }

    }

    @Override
    public double getMortalite(Environnement environement) {
        //Tu ne peux pas faire ceci 
        /*switch (environement) {
            //TODO compléter les différents environnements
            case Prairie : return 100;

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
