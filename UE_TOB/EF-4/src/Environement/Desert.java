package Environement;



public class Desert extends Environnement {

    /** Constructeur d'un désert
     * @param x taille absicisse du désert (>=0)
     * @param y taille ordonnée du désert (>=0)
     */
    public Desert(int x, int y){
       super(x,y,"Désert",0,10,20);
    }

}