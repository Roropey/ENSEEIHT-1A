import afficheur.*;
import java.awt.Color;

/** Construire le schéma proposé dans le sujet de TP avec des points,
  * et des segments.
  *
  * @author	Xavier Crégut
  * @version	$Revision: 1.7 $
  */
public class ExempleSchema1 {

	/** Construire le schéma et le manipuler.
	  * Le schéma est affiché.
	  * @param args les arguments de la ligne de commande
	  */
	public static void main(String[] args)
	{
		// Créer les trois segments
		Point p1 = new Point(3, 2);
		Point p2 = new Point(6, 9);
		Point p3 = new Point(11, 4);
		Segment s12 = new Segment(p1, p2);
		Segment s23 = new Segment(p2, p3);
		Segment s31 = new Segment(p3, p1);

		// Créer le barycentre
		double sx = p1.getX() + p2.getX() + p3.getX();
		double sy = p1.getY() + p2.getY() + p3.getY();
		Point barycentre = new Point(sx / 3, sy / 3);

		// Afficher le schéma
		System.out.println("Le schéma est composé de : ");
		s12.afficher();		System.out.println();
		s23.afficher();		System.out.println();
		s31.afficher();		System.out.println();
		barycentre.afficher();	System.out.println();
		
		// Créer l'écran et le svg
		Ecran e = new Ecran("ExempleSchema1",600,400,20);
		AfficheurSVG svg = new AfficheurSVG("ExempleSchema1","Affichage du schéma 1",600,400);
		AfficheurTexte txt = new AfficheurTexte();
		
		// Dessiner les éléments
		p1.dessiner(e);
		p1.dessiner(svg);
		p1.dessiner(txt);
		p2.dessiner(e);
		p2.dessiner(svg);
		p2.dessiner(txt);
		p3.dessiner(e);	
		p3.dessiner(svg);
		p3.dessiner(txt);
		s12.dessiner(e);
		s12.dessiner(svg);
		s12.dessiner(txt);
		s23.dessiner(e);
		s23.dessiner(svg);
		s23.dessiner(txt);
		s31.dessiner(e);
		s31.dessiner(svg);
		s31.dessiner(txt);
		barycentre.dessiner(e);
		barycentre.dessiner(svg);
		barycentre.dessiner(txt);
		
		// Translater le schéma
		s12.translater(4, -3);
		s23.translater(4, -3);
		s31.translater(4, -3);
		barycentre.translater(4, -3);
		
		// Dessiner les éléments
		p1.dessiner(e);
		p1.dessiner(svg);
		p1.dessiner(txt);
		p2.dessiner(e);
		p2.dessiner(svg);
		p2.dessiner(txt);
		p3.dessiner(e);	
		p3.dessiner(svg);
		p3.dessiner(txt);
		s12.dessiner(e);
		s12.dessiner(svg);
		s12.dessiner(txt);
		s23.dessiner(e);
		s23.dessiner(svg);
		s23.dessiner(txt);
		s31.dessiner(e);
		s31.dessiner(svg);
		s31.dessiner(txt);
		barycentre.dessiner(e);
		barycentre.dessiner(svg);
		barycentre.dessiner(txt);
		
		// Ecrire le fichier svg
		svg.ecrire("ExempleSchema1.svg");
	}

}
