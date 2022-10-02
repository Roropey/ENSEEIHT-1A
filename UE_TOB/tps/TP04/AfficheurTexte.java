import afficheur.Afficheur;

/** Dessine un schéma sous forme textuelle
 * * @author  Romain Peyremorte
 */
public class AfficheurTexte implements Afficheur{
	
	/** Afficher un cercle
	 * @param x abscisse du centre cercle
	 * @param y ordonnée du centre cercle
	 * @param rayon rayon du cercle
	 * @param c couleur du cercle
	 */
	public void dessinerCercle (double x, double y, double rayon, java.awt.Color c) {
		System.out.println("Cercle {");
		System.out.println("\t centre_x = " + x);
		System.out.println("\t centre_y = " + y);
		System.out.println("\t rayon = " + rayon);
		System.out.println("\t couleur = " + c);
		System.out.println("}");
	}
	
	/** Afficher un segment entre deux points
	 * @param x1 abscisse du premier point
	 * @param y1 ordonnée du premier point
	 * @param x2 abscisse du second point
	 * @param y2 ordonnée du second point
	 * @param c couleur du segment
	 */
	public void dessinerLigne (double x1, double y1, double x2, double y2, java.awt.Color c) {
		System.out.println("Ligne {");
		System.out.println("\t x1 = " + x1);
		System.out.println("\t y1 = " + y1);
		System.out.println("\t x2 = " + x2);
		System.out.println("\t y2 = " + y2);
		System.out.println("\t couleur = " + c);
		System.out.println("}");
	}
	
	/** Afficher un point
	 * @param x abscisse du point
	 * @param y ordonnée du point
	 * @param c couleur du point
	 */
	public void dessinerPoint (double x, double y, java.awt.Color c) {
		System.out.println("Point {");
		System.out.println("\t x = " + x);
		System.out.println("\t y = " + y);
		System.out.println("\t couleur = " + c);
		System.out.println("}");
	}
		
	/** Afficher un texte
	 * @param x abscisse du texte
	 * @param y ordonnée du texte
	 * @param texte texte à afficher
	 * @param c couleur du texte
	 */
	public void dessinerTexte (double x, double y, java.lang.String texte, java.awt.Color c) {
		System.out.println("Texte {");
		System.out.println("\t x = " + x);
		System.out.println("\t y = " + y);
		System.out.println("\t valeur = \"" + texte + "\"");
		System.out.println("\t couleur = " + c);
		System.out.println("}");

	}
}
