package Tests;

import org.junit.*;

import Utile.*;
import Espece.*;

public class TestIndividuJUnit {
    // Initialisation des variables utilisees
    protected Individu i1, i2, i3, i4;
    protected Loup loup;
    protected Sardine sardine;

    protected Position p1, p2, p3;
    protected double v1, v2, v3;

    protected int vieMax;
    protected int satieteMax;
    protected int ferveurSeuil;
    protected int valeurNutritive;


    // Initialisation des tests
    @Before
    public void setUp(){
        this.p1 = new Position(1, 1);
        this.p2 = new Position(1, 1);
        this.p3 = new Position(100, 100);
        this.v1 = 9.0;
        this.v2 = 1.0;
        this.v3 = this.v2;
        this.vieMax = 100;
        this.satieteMax = 100;
        this.ferveurSeuil = 10;
        this.valeurNutritive = 10;
        this.i1 = new Individu(loup, 10, 10, p1, v1, vieMax, 4, ferveurSeuil, valeurNutritive);
        this.i2 = new Individu(loup, 10, 10, p2, v2, vieMax, satieteMax, ferveurSeuil, valeurNutritive);
        this.i3 = new Individu(loup, 10, 10, p3, v3, vieMax, satieteMax, ferveurSeuil, valeurNutritive);
        this.i4 = new Individu(sardine, 10, 10, p1, v1, vieMax, satieteMax, ferveurSeuil, valeurNutritive);
    }

    // Tests
    @Test
    public void testConstructeurGetteur(){
        assertTrue(this.i1.getCategorie().equals(Loup.getCategorie));
        assertTrue(this.i1.getDureeDeVie() == vieMax);
        assertTrue(this.i1.getEspece().equals(loup));
        assertTrue(this.i1.getEsperanceDeVie() == vieMax);
        assertTrue(this.i1.getFerveurSeuil() == ferveurSeuil);
        assertTrue(this.i1.getPorteeAction() == 10);
        assertTrue(this.i1.getPorteeVision() == 10);
        assertTrue(this.i1.getPosition().equals(p1));
        assertTrue(this.i1.getSatiete() == satieteMax);
        assertTrue(this.i1.getSatieteMax() == satieteMax);
        assertTrue(this.i1.getSex() == true || this.i1.getSex() == false);
        assertTrue(this.i1.getValeurNutritive() == valeurNutritive);
        assertTrue(this.i1.getVitesse() == v1);
    }

    @Test
    public void testVie (){
        int dureeDeVieAvant = this.i1.getDureeDeVie();
        this.i1.reduireVie();
        assertTrue(this.i1.getDureeDeVie() < dureeDeVieAvant);

        assertTrue(this.i1.estMort() == false);
        this.i1.meurt();
        assertTrue(this.i1.estMort() == true);
    }

    @Test
    public void testPortee(){
        assertTrue(this.i1.estAPorteeAction(this.i2.getPosition()));
        assertTrue(this.i1.estAPorteeVision(this.i2.getPosition()));
    } 
    @Test
    public void testIterer(){
        //TODO test de la deroissance de la vie et de la satiete, croissance ferveur
        int ferveurAvant = this.i1.getFerveur();
        int satieteAvant = this.i1.getSatiete();
        int vieAvant = this.i1.getDureeDeVie();

        this.i1.iterer(2);

        assertTrue(this.i1.getFerveur() < ferveurAvant);
        assertTrue(this.i1.getSatiete() < satieteAvant);
        assertTrue(this.i1.getDureeDeVie() < vieAvant);
    }
    @Test
    public void testDeplacement(){
        //TODO test de deplacerDe et deplacerVers
        int[] dimension;
        dimension[0] = 200;
        dimension[1] = 200;

        Position position = this.i1.getPosition();

        this.i1.deplacerDe(1, 1);
        assertFalse(this.i1.getPosition().equals((position)));
        
        position = this.i1.getPosition();
        this.i1.deplacer(dimension);
        assertFalse(this.i1.getPosition().equals(position));

        position = i1.getPosition();
        this.i1.deplacerVers(p3);
        assertFalse(this.i1.getPosition().equals(position));
    }
    @Test
    public void testSatiete(){
        //TODO test de aFaim, peutManger, mange, reduireSatiete
    }
    @Test
    public void testReproduction(){
        //TODO test de se reproduit
    }
    @Test
    public void testCategorie(){
        //TODO test de getCategorie
    } 
}
