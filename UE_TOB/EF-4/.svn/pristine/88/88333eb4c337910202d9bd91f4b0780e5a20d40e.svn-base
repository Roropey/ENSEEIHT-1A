package Espece;


import java.util.List;
import java.awt.Color;

import Environement.Environnement;
import Utile.Comestible;
import Utile.Categorie;

public interface Espece {

    // Methodes simulation

    // Methodes Generales
    String getNom();
    int getMajorite();
    double getEcartTypeEspece();
    int getPorteeAction();
    int getPorteeVision();
    int getDureeDeVie();
    int getSatieteMax();
    List<Categorie> getComestible();
    int getFerveurSeuil();
    int getValeurNutritive();
    Categorie getCategorie();
    Color getColor();
    

    // a voir + tard
    //Methodes Comportement
        // vis-à-vis de ses pairs
        // vis-à-vis des autres

    //Methodes Reproduction
    double getTauxReproduction(int Age);
    int getNbEnfantsMin();
    int getNbEnfantsMax();


    //Methodes Deplacement
    double setVitesse(Etat etat);
    double getVitesse();

    //Taux de mortalité en fonction de l'environnement
    double getMortalite(Environnement environement);

    boolean getEstVolant();

    boolean getEstMarin();

    
}
