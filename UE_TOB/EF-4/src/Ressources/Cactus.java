package Ressources;

import Utile.*;

public class Cactus extends Ressource{

    /** Constructeur d'un cactus dont la position est aléatoire dans un intervalle
     * @param min_x absicisse minimale du cactus
     * @param max_x absicisse maximale du cactus
     * @param min_y ordonnée minimale du cactus
     * @param max_y ordonnée maximale du cactus
     */
    public Cactus (int min_x, int max_x, int min_y, int max_y){
        super(min_x, max_x, min_y, max_y,"Cactus",3,Categorie.plante);
    }

    /** Constructeur d'un cactus personnalisable dont la position connue
     * @param x absicisse du cactus (>=0)
     * @param y ordonnée du cactus (>=0)
     * @param nom nom du cactus
     * @param nutrition valeur nutritionnaire du cactus
     * @param categorie catégorie du cactus
     */
    public Cactus (int x, int y){
        super(x, y, "Cactus",3,Categorie.plante);
    }

}