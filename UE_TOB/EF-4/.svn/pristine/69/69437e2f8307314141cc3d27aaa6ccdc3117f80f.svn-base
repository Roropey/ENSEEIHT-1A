package Environement;

import Utile.*;
import Ressources.*;
import java.util.*;

public class Environnement {


    protected int taille_x;
    protected int taille_y;
    protected String nom;
    private int tauxHumidite; 
    private int fertilite;
    protected int[][] altitudes; // varie entre 5 et -1

    /*exemple de composition : 
     - H = 0 désert
     - H = 25 prairie
     - H = 50 forêt
     - H = 75 marécage
     - H = 100 mer
    */

    public Environnement(int x, int y, String nom, int hum, int fertilite, int proportionMontagne){
        if ((x<=0) | (y<=0) | (hum<0) | (hum>100) | (fertilite <0) | (fertilite > 100) | (proportionMontagne <0) | (proportionMontagne > 100)){
            throw new ValeurInterditeException("Valeurs d'entrée non valide.\nDoit avoir x >= 0, y >= 0 et 0 <= Humidité <= 100.\n");
        } else {
            this.taille_x = x;
            this.taille_y = y;
            this.nom = nom;
            this.tauxHumidite = hum;
            this.fertilite = fertilite;
            this.altitudes = new int[x+1][y+1];

            Random aleatoireConstructeur = new Random();

            for (int i = 0; i<proportionMontagne; i++){
                this.ajoutMontagne(aleatoireConstructeur.nextInt(taille_x)-300, aleatoireConstructeur.nextInt(taille_y)-300, aleatoireConstructeur.nextInt(300)+400, aleatoireConstructeur.nextInt(300)+400);
            } 
            for(int i = 0;i<hum/2;i++){
                this.ajoutPE(aleatoireConstructeur.nextInt(taille_x)-100, aleatoireConstructeur.nextInt(taille_y)-100, aleatoireConstructeur.nextInt(200)+100, aleatoireConstructeur.nextInt(200)+100);
            }
            this.rendrepropre();
            
        }
    }

    // Methodes Generales
    public int[] getDimensions(){
        int[] dimensions = {this.taille_x,this.taille_y};
        return dimensions;
    }

    public String getNom(){
        return this.nom;
    }

    public int[] getCaracteristique(){
        int[] carac = {this.tauxHumidite,this.fertilite};
        return carac;
    }

    public int getType(Position position){
        return this.altitudes[position.getX()][position.getY()];
    }

    public List<Ressource> apparaitre(){
        int alea_F = ((new Random()).nextInt(this.fertilite));
        List<Ressource> listeRessources = new ArrayList<Ressource>();
        int i = 0;
        while(i<alea_F){
            double alea_H = ((new Random()).nextInt(50)-25) + (this.tauxHumidite);
            if (alea_H < 12.5){
                Cactus cactus = new Cactus(0,this.taille_x,0,this.taille_y);
                if (this.altitudes[cactus.getPosition().getX()][cactus.getPosition().getY()] == 0){
                    listeRessources.add(cactus);
                    i++;
                }
                //apparition élément propre  désert, par exemple cactus 
            } else if (alea_H < 37.5){
                Arbuste arbuste = new Arbuste(0,this.taille_x,0,this.taille_y);
                if ((this.altitudes[arbuste.getPosition().getX()][arbuste.getPosition().getY()] == 0)||(this.altitudes[arbuste.getPosition().getX()][arbuste.getPosition().getY()] == 1)){
                    listeRessources.add(arbuste);
                    i++;
                }
                //apparition élément propre à la prairie, par exemple arbuste
            } else if (alea_H <= 62.5){
                Arbre arbre = new Arbre (0, this.taille_x,0,this.taille_y);
                if ((this.altitudes[arbre.getPosition().getX()][arbre.getPosition().getY()] >= 0)&&(this.altitudes[arbre.getPosition().getX()][arbre.getPosition().getY()] <= 3)){
                    listeRessources.add(arbre);
                    i++;
                }
                //apparition élément propre à la forêt
            } else if (alea_H <= 87.5){
                Nenuphar nenuphar = new Nenuphar(0,this.taille_x,0,this.taille_y);
                if (this.altitudes[nenuphar.getPosition().getX()][nenuphar.getPosition().getY()] == -3){
                    listeRessources.add(nenuphar);
                    i++;
                }
                //apparition élément propre aux marécage, par exemple sable nénuphare
            } else {
                Algue algue = new Algue(0,this.taille_x,0,this.taille_y);
                if (this.altitudes[algue.getPosition().getX()][algue.getPosition().getY()] == -3){
                    listeRessources.add(algue);
                    i++;
                }
                //apparition élément propre à la mer, par exemple algue (uniquement mangeable par poisson)
            }
        }
        return listeRessources;
    }


    public void rendrepropre(){
        for(int i = 0;i<taille_x;i++){
            for(int j = 0;j<taille_y;j++){
                if (i+2<taille_x && j+2<taille_y && i-2 >0 && j-2>0) {
                    
                    this.altitudes[i][j] = Math.abs(
                        this.altitudes[i-2][j+2]+ this.altitudes[i-1][j+2]+ this.altitudes[i][j+2]+ this.altitudes[i+1][j+2]+this.altitudes[i+2][j+2]+
                        this.altitudes[i-2][j+1]+ this.altitudes[i-1][j+1]+ this.altitudes[i][j+1]+ this.altitudes[i+1][j+1]+this.altitudes[i+2][j+1]+
                        this.altitudes[i-2][j] + this.altitudes[i-1][j]+ this.altitudes[i][j]+ this.altitudes[i+1][j]+this.altitudes[i+2][j]+
                        this.altitudes[i-2][j-1]+ this.altitudes[i-1][j-1] + this.altitudes[i][j-1]+ this.altitudes[i+1][j-1]+this.altitudes[i+2][j-1]+
                        this.altitudes[i-2][j-2]+ this.altitudes[i-1][j-2] + this.altitudes[i][j-2]+ this.altitudes[i+1][j-2]+ this.altitudes[i+2][j-2]
                        )
                        > Math.abs(this.altitudes[i][j]*6) ? this.altitudes[i][j] : 0;
                    
                }else{
                    this.altitudes[i][j] = 0;
                }
            }
        }
        for(int i = 0;i<taille_x;i++){
            for(int j = 0;j<taille_y;j++){
                if (i+2<taille_x && j+2<taille_y && i-2 >0 && j-2>0) {
                int moyenne = (
                
                    this.altitudes[i-2][j+2]+ this.altitudes[i-1][j+2]+ this.altitudes[i][j+2]+ this.altitudes[i+1][j+2]+this.altitudes[i+2][j+2]+
                    this.altitudes[i-2][j+1]+ this.altitudes[i-1][j+1]+ this.altitudes[i][j+1]+ this.altitudes[i+1][j+1]+this.altitudes[i+2][j+1]+
                    this.altitudes[i-2][j] + this.altitudes[i-1][j]+ this.altitudes[i][j]+ this.altitudes[i+1][j]+this.altitudes[i+2][j]+
                    this.altitudes[i-2][j-1]+ this.altitudes[i-1][j-1] + this.altitudes[i][j-1]+ this.altitudes[i+1][j-1]+this.altitudes[i+2][j-1]+
                    this.altitudes[i-2][j-2]+ this.altitudes[i-1][j-2] + this.altitudes[i][j-2]+ this.altitudes[i+1][j-2]+ this.altitudes[i+2][j-2]
                    )/25;
                this.altitudes[i][j] =  moyenne < 0 ? -2 : moyenne;
                }else{
                    this.altitudes[i][j] = this.altitudes[i == 0 ? i+1 : i-1 ][j == 0 ? j+1 : j-1];
                }
            }
        }
    }

    public void ajoutPE(int x, int y, int width, int height){
        Random aleatoireConstructeur = new Random();
        
        for(int i = 0;i<width;i++){
            for(int j = 0;j<height;j++){
                if (x+i>= 0 && y+j>=0 && y+j<this.altitudes.length && x+i <this.altitudes[0].length){
                    this.altitudes[x+i][y+j] = aleatoireConstructeur.nextDouble() < normales(width,height,i,j) ? -3 : this.altitudes[x+i][y+j];
                }
                
            }
        }   
    }
    public void ajoutMontagne(int x, int y, int width, int height){
        Random aleatoireConstructeur = new Random();
        for (int k = 1;k<6;k++){
            int decX = (int) (width/2*(1-1/Math.pow(1.7, k)));
            int decY = (int) (height/2*(1-1/Math.pow(1.7, k)));
            for(int i = 0;i<width/Math.pow(1.7, k);i++){
                for(int j = 0;j<height/Math.pow(1.7, k);j++){

                    if (x+i+decX>= 0 && y+j+decY>=0 && y+j+decY<this.altitudes.length && x+i+decX <this.altitudes[0].length){

                        this.altitudes[x+i +decX][y+j+decY] =  aleatoireConstructeur.nextDouble() < normales(width/Math.pow(1.7, k),height/Math.pow(1.7, k),i,j) ? k: this.altitudes[x+i +decX][y+j+decY];
                    }
                        
                }
                    
            }
        }   
    }
    private double normales(double width, double height, double i, double j){
        double normI = Math.exp(-1/(18*width)*(i-width/2)*(i-width/2)); 
        double normJ = Math.exp(-1/(18*height)*(j-height/2)*(j-height/2)); 
        return normI*normJ;
    }
}
