package Ressources;

import Utile.*;
import java.util.*;

public class Arbre extends Ressource{
    
    private int nbPommes;
    private List<Pomme> listePomme;

    /** Constructeur d'un arbre dont la position est aléatoire dans un intervalle
     * @param min_x absicisse minimale de l'arbre
     * @param max_x absicisse maximale de l'arbre
     * @param min_y ordonnée minimale de l'arbre
     * @param max_y ordonnée maximale de l'arbre
     */
    public Arbre(int min_x, int max_x, int min_y, int max_y){
        super(min_x, max_x, min_y, max_y,"Arbre",10,Categorie.plante);
        this.nbPommes = (new Random()).nextInt(6);
        this.listePomme = new ArrayList<Pomme>();
        for (int i = 0; i<this.nbPommes; i++){
            this.listePomme.add(new Pomme(this.position.getX(),this.position.getY()));
        }
    }

    /** Constructeur d'un arbre personnalisable dont la position connue
     * @param x absicisse de l'arbre (>=0)
     * @param y ordonnée de l'arbre (>=0)
     * @param nom nom de l'arbre
     * @param nutrition valeur nutritionnaire de l'arbre
     * @param categorie catégorie de l'arbre
     */
    public Arbre(int x, int y){
        super(x, y, "Arbre",10,Categorie.plante);
        this.nbPommes = (new Random()).nextInt(6);
        this.listePomme = new ArrayList<Pomme>();
        for (int i = 0; i<this.nbPommes; i++){
            this.listePomme.add(new Pomme(this.position.getX(),this.position.getY()));
        }
    }

    /** Permet d'avoir le nombre de pommes dans l'arbre
     * @return le nombre de pommes
     */
    public int getNbPommes(){
        return this.nbPommes;
    }

    /** Action de faire manger l'arbre en commançant par ses pommes
     * @return si l'arbre existait avant d'être mangé
     */
    @Override
    public boolean estMangee(){
        if (this.nbPommes > 0){
            Pomme pommeMangee = listePomme.remove(this.nbPommes-1);
            pommeMangee.estMangee();
            this.nbPommes--;
        } 
        if (this.nbPommes == 0) {
            this.existe = false;
        }
        return (this.nbPommes > 0);
    }
}