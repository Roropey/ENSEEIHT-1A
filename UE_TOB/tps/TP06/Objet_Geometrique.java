import java.awt.Color;

/** Elément géométrique
 *
 * @author  Romain Peyremorte
 */
public abstract class Objet_Geometrique {

	private Color couleur;	// couleur du point
	
	public Objet_Geometrique(Color couleur) {
		this.couleur = couleur;
	}
	
	abstract public void afficher();
	
	abstract public void dessiner (afficheur.Afficheur afficheur);
	
	abstract public void translater(double dx, double dy);
	
//  Gestion de la couleur

	/** Obtenir la couleur du point.
	 * @return la couleur du point
	 */
	//@ pure
	public Color getCouleur() {
		return this.couleur;
	}

	/** Changer la couleur du point.
	  * @param nouvelleCouleur nouvelle couleur
	  */
	public void setCouleur(Color nouvelleCouleur) {
		this.couleur = nouvelleCouleur;
	}
}
