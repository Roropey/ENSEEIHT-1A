/** Tester le polymorphisme (principe de substitution) et la liaison
 * dynamique.
 * @author	Xavier Crégut
 * @version	1.5
 */
public class TestPolymorphisme {

	/** Méthode principale */
	public static void main(String[] args) {
		// Créer et afficher un point p1
		Point p1 = new Point(3, 4);	// Est-ce autorisé ? Pourquoi ? Oui, c'est la création d'un objet de classe Point
		p1.translater(10,10);		// Quel est le translater exécuté ? Le translater de la classe Point
		System.out.print("p1 = "); p1.afficher (); System.out.println ();
										// Qu'est ce qui est affiché ? "p1 = (13,14)"

		// Créer et afficher un point nommé pn1
		PointNomme pn1 = new PointNomme (30, 40, "PN1");
										// Est-ce autorisé ? Pourquoi ? Oui, c'est la création d'un objet de classe PointNomme
		pn1.translater (10,10);		// Quel est le translater exécuté ? Le translater de lac classe Point
		System.out.print ("pn1 = "); pn1.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ? "pn1 = PN1 : (40,50)"

		// Définir une poignée sur un point
		Point q;

		// Attacher un point à q et l'afficher
		q = p1;				// Est-ce autorisé ? Pourquoi ? Oui car p1 et q sont de la même classe
		System.out.println ("> q = p1;");
		System.out.print ("q = "); q.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ? "q = (13,14)"

		// Attacher un point nommé à q et l'afficher
		q = pn1;			// Est-ce autorisé ? Pourquoi ? Oui par substitution
		System.out.println ("> q = pn1;");
		System.out.print ("q = "); q.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ? "q = PN1 : (40,50)"

		// Définir une poignée sur un point nommé
		PointNomme qn;

		// Attacher un point à q et l'afficher
		//qn = p1;			// Est-ce autorisé ? Pourquoi ? Non, car p1 ne suffit pas à définir un PointNomme (pas assez d'attribut)
		System.out.println ("> qn = p1;");
		//System.out.print ("qn = "); qn.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ? Rien

		// Attacher un point nommé à qn et l'afficher
		qn = pn1;			// Est-ce autorisé ? Pourquoi ? Oui, car qn et pn1 de même classe
		System.out.println ("> qn = pn1;");
		System.out.print ("qn = "); qn.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ? "qn = (40,50)"

		double d1 = p1.distance (pn1);	// Est-ce autorisé ? Pourquoi ? Oui car procédure commune
		System.out.println ("distance = " + d1);

		double d2 = pn1.distance (p1);	// Est-ce autorisé ? Pourquoi ? Oui car procédure commune
		System.out.println ("distance = " + d2);

		double d3 = pn1.distance (pn1);	// Est-ce autorisé ? Pourquoi ? Oui car procédure commune
		System.out.println ("distance = " + d3);

		System.out.println ("> qn = q;");
		//qn = q;				// Est-ce autorisé ? Pourquoi ? Non, car p1 ne suffit pas à définir un PointNomme (pas assez d'attribut)
		System.out.print ("qn = "); qn.afficher(); System.out.println ();
										// Qu'est ce qui est affiché ? "q = PN1 : (40,50)"

		System.out.println ("> qn = (PointNomme) q;");
		qn = (PointNomme) q;		// Est-ce autorisé ? Pourquoi ? Oui car lors de l'écriure de q, des attributs PointNomme ont été rattaché à ce dernier
		System.out.print ("qn = "); qn.afficher(); System.out.println ();

		System.out.println ("> qn = (PointNomme) p1;");
		//qn = (PointNomme) p1;		// Est-ce autorisé ? Pourquoi ? Non car il manque des attributs spécifiques à PointNomme non défini
		System.out.print ("qn = "); qn.afficher(); System.out.println ();
	}

}
