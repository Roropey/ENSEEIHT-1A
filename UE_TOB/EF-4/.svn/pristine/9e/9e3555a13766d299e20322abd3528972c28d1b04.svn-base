package Ressources;

import Utile.*;
import java.util.*;

public class Arbuste extends Ressource{

    private int nbBaie;
    private List<Baie> listeBaie;
    /** Constructeur d'un arbuste dont la position est aléatoire dans un intervalle
     * @param min_x absicisse minimale de l'arbuste
     * @param max_x absicisse maximale de l'arbuste
     * @param min_y ordonnée minimale de l'arbuste
     * @param max_y ordonnée maximale de l'arbuste
     */
    public Arbuste(int min_x, int max_x, int min_y, int max_y){
        super(min_x, max_x, min_y, max_y,"Arbuste",7,Categorie.plante);
        this.nbBaie = (new Random()).nextInt(6);
        this.listeBaie = new ArrayList<Baie>();
        for (int i = 0; i<this.nbBaie; i++){
            this.listeBaie.add(new Baie(this.position.getX(),this.position.getY()));
        }
    }

    /** Constructeur d'un arbuste personnalisable dont la position connue
     * @param x absicisse de l'arbuste (>=0)
     * @param y ordonnée de l'arbuste (>=0)
     * @param nom nom de l'arbuste
     * @param nutrition valeur nutritionnaire de l'arbuste
     * @param categorie catégorie de l'arbuste
     */
    public Arbuste(int x, int y){
        super(x, y, "Arbuste",7,Categorie.plante);
        this.nbBaie = (new Random()).nextInt(6);
        this.listeBaie = new ArrayList<Baie>();
        for (int i = 0; i<this.nbBaie; i++){
            this.listeBaie.add(new Baie(this.position.getX(),this.position.getY()));
        }
    }

    /** Permet d'avoir le nombre de baies dans l'arbuste
     * @return le nombre de baies
     */
     public int getNbBaies(){
        return this.nbBaie;
    }

    /** Action de faire manger l'arbre en commançant par ses baies
     * @return si l'arbuste existait avant d'être mangé
     */
    @Override
    public boolean estMangee(){

        if (this.nbBaie > 0){
            Baie baieMangee = listeBaie.remove(this.nbBaie-1);
            baieMangee.estMangee();
            this.nbBaie--;
        } 
        if (this.nbBaie == 0) {
            this.existe = false;
        }
        return (this.nbBaie > 0);
    }

}