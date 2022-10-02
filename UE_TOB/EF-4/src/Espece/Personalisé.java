package Espece;

import java.util.ArrayList;
import java.util.List;
import java.awt.Color;

import Environement.Environnement;
import Utile.Comestible;
import Utile.Categorie;

public class Personalisé implements Espece {

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
    
    public Personalisé(String Nom, int Majorite, double ecartTypeEspece, int porteeAction,
        int porteeVision, double vitesse, int vieMax, int satieteMax, List<Categorie> comestibles,
        int ferveurSeuil, int nbEnfantsMin, int nbEnfantsMax, int valeurNutritive, boolean estVolant,
        boolean estMarin, Categorie categorie, Color couleur) {
            this.Nom = Nom;
            this.Majorite = Majorite;
            this.ecartTypeEspece = ecartTypeEspece;
            this.porteeAction = porteeAction;
            this.porteeVision = porteeVision;
            this.vitesse = vitesse;
            this.vieMax = vieMax;
            this.satieteMax = satieteMax;
            this.comestible = new ArrayList<Categorie>();
            this.comestible.addAll(comestibles);
            this.ferveurSeuil = ferveurSeuil;
            this.nbEnfantsMin  = nbEnfantsMin;
            this.nbEnfantsMax = nbEnfantsMax;
            this.valeurNutritive = valeurNutritive;
            this.estVolant = estVolant;
            this.estMarin = estMarin;
            this.categorie = categorie;
            this.couleur = couleur;
        }
    @Override
    public String getNom() {
        return this.Nom;
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
    public double getVitesse() {
        return this.vitesse;
    }

    @Override
    public int getDureeDeVie() {
        return this.vieMax;
    }

    @Override
    public int getSatieteMax() {
        return this.satieteMax;
    }

    @Override
    public List<Categorie> getComestible() {
        return this.comestible;
    }

    @Override
    public int getFerveurSeuil() {
        return this.ferveurSeuil;
    }

    @Override
    public double getTauxReproduction(int Age) {
        return this.nbEnfantsMax;
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
    public int getValeurNutritive() {
        return this.valeurNutritive;
    }

    @Override
    public double setVitesse(Etat etat) {
        switch (etat) {
            case Apeure :
                return this.vitesse+1;
            case Blesse :
                return this.vitesse-1;
            case EnChasse :
                return this.vitesse+1;
            case Normal :
                return this.vitesse;
            default :
                return this.vitesse;
        }
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
	public double getMortalite(Environnement environement) {
		return 0;
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
