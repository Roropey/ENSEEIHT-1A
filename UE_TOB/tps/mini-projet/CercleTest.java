import java.awt.Color;
import org.junit.*;
import static org.junit.Assert.*;

/**
  * Classe de test (incomplète) de la classe Cercle.
  * @author	Romain Peyremorte <romain.peyremorte@enseeiht.fr>
  */
public class CercleTest {

	// précision pour les comparaisons réelle
	public final static double EPSILON = 0.001;

	// Les points du sujet
	private Point C, D, E;

	// Les cercles du sujet
	private Cercle C2, C2bis, C3;

	@Before public void setUp() {
		// Construire les points
		C = new Point(4, 1);
		D = new Point(8, 1);
		E = new Point(10, 4);

		// Construire les cercles
		C2 = new Cercle(C, D);
		C2bis = new Cercle(C, D, Color.green);
		C3 = Cercle.creerCercle(D, E);
	}

	/** Vérifier si deux points ont mêmes coordonnées.
	  * @param p1 le premier point
	  * @param p2 le deuxième point
	  */
	static void memesCoordonnees(String message, Point p1, Point p2) {
		assertEquals(message + " (x)", p1.getX(), p2.getX(), EPSILON);
		assertEquals(message + " (y)", p1.getY(), p2.getY(), EPSILON);
	}

	@Test public void testerE12C2() {
		memesCoordonnees("E12 : Centre de C2 incorrect",
				new Point((D.getX() + C.getX())/2.0,(D.getY() + C.getY())/2.0),
				C2.getCentre());
		assertEquals("E12 : Diamètre de C2 incorrect",
				C.distance(D), C2.getDiametre(), EPSILON);
		assertEquals("E12 : Rayon de C2 incorrect",
				C.distance(D)/2, C2.getRayon(), EPSILON);
		assertEquals(Color.blue, C2.getCouleur());
	}
	
	@Test public void testerE13C2bis() {
		memesCoordonnees("E13 : Centre de C2bis incorrect",
				new Point((D.getX() + C.getX())/2.0,(D.getY() + C.getY())/2.0),
				C2bis.getCentre());
		assertEquals("E13 : Diamètre de C2bis incorrect",
				C.distance(D), C2bis.getDiametre(), EPSILON);
		assertEquals("E13 : Rayon de C2bis incorrect",
				C.distance(D)/2, C2bis.getRayon(), EPSILON);
		assertEquals(Color.green, C2bis.getCouleur());
	}
	
	@Test public void testerE14C3() {
		memesCoordonnees("E14 : Centre de C3 incorrect",
				D, C3.getCentre());
		assertEquals("E14 : Diamètre de C3 incorrect",
				E.distance(D)*2, C3.getDiametre(), EPSILON);
		assertEquals("E14 : Rayon de C3 incorrect",
				E.distance(D), C3.getRayon(), EPSILON);
		assertEquals(Color.blue, C3.getCouleur());
	}

}
