package Ressources;

import Utile.*;

public class Nenuphar extends Ressource{

    /** Constructeur d'un nénuphar dont la position est aléatoire dans un intervalle
     * @param min_x absicisse minimale du nénuphar
     * @param max_x absicisse maximale du nénuphar
     * @param min_y ordonnée minimale du nénuphar
     * @param max_y ordonnée maximale du nénuphar
     */
    public Nenuphar(int min_x, int max_x, int min_y, int max_y){
        super(min_x, max_x, min_y, max_y,"Nénuphar",2,Categorie.plante);
    }

    /** Constructeur d'un nénuphar personnalisable dont la position connue
     * @param x absicisse du nénuphar (>=0)
     * @param y ordonnée du nénuphar (>=0)
     * @param nom nom du nénuphar
     * @param nutrition valeur nutritionnaire du nénuphar
     * @param categorie catégorie du nénuphar
     */
    public Nenuphar(int x, int y){
        super(x, y,"Nénuphar",2,Categorie.plante);
    }

}