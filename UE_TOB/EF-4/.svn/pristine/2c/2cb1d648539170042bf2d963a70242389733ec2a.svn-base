package Tests;

import org.junit.*;
import Environement.Environnement;
import Ressources.*;
import Utile.*;

public class TestEnvironnementJUnit {
    
    protected Environnement environnementTest;

    @Before
    public void setUp(){
        this.environnementTest = new Environnement(100,200,"Test",35,40);
    }

    @Test
    public void testAttribut(){
        assertTrue(this.environnementTest.getNom().equals("Test"));
        int[] caracteristiques = environnementTest.getCaracteristique();
        assertEquals(caracteristiques[0],35);
        assertEquals(caracteristiques[1],40);
        int[] dimensions = this.environnementTest.getDimensions();
        assertEquals(dimensions[1],100);
        assertEquals(dimensions[2],200);
    }

    @Test(expected=ValeurInterditeException.class)
    public void testRobustesseX(){
        Environnement impossibleX = new Environnement(-100,200,"Problème X",40,40);
    }

    @Test(expected=ValeurInterditeException.class)
    public void testRobustesseY(){
        Environnement impossibleY = new Environnement(100,-200,"Problème Y",60,40);
    }

    @Test(expected=ValeurInterditeException.class)
    public void testRobustesseTropHumide(){
        Environnement impossibleTropH = new Environnement(100,200,"Problème trop humide",200,40);
    }

    @Test(expected=ValeurInterditeException.class)
    public void testRobustessePasAssezHumide(){
        Environnement impossiblePasAssezH = new Environnement(100,200,"Problème pas assez humide",-10,40);
    }

    @Test(expected=ValeurInterditeException.class)
    public void testRobustesseTropFertile(){
        Environnement impossibleTropF = new Environnement(100,200,"Problème trop fertile",50,110);
    }

    @Test(expected=ValeurInterditeException.class)
    public void testRobustessePasAssezFertile(){
        Environnement impossiblePasAssezF = new Environnement(100,200,"Problème pas assez fertile",10,-40);
    }
}