package Tests;

import org.junit.*;
import Ressources.Cactus;
import Utile.*;

public class TestCactusJUnit {

    protected Cactus cactusTestConnu;
    protected Cactus cactusTestAleatoire;

    @Before
    public void setUp(){
        this.cactusTestConnu = new Cactus(4,10.5);
        this.cactusTestAleatoire = new Cactus(10.5,50,20,30);
    }

    @Test
    public void testerPosition(){
        Position positionConnue = this.cactusTestConnu.getPosition();
        Position positionAleatoire = this.cactusTestAleatoire.getPosition();
        assertEquals(positionConnue.getX(),4);
        assertEquals(positionConnue.getY(),10.6);
        assertTrue((positionAleatoire.getX()>=10.5)&(positionAleatoire.getX()<=50));
        assertTrue((positionAleatoire.getY()>=20)&(positionAleatoire.getY()<=30));
    }
    
    @Test
    public void testerNutrition(){
        assertEquals(this.cactusTestConnu.getValeurNutritive(),3);
        assertEquals(this.cactusTestAleatoire.getValeurNutritive(),3);
    }

    @Test
    public void testerNom(){
        assertTrue(this.cactusTestConnu.getNom().equals("Cactus"));
        assertTrue(this.cactusTestAleatoire.getNom().equals("Cactus"));
    }

    @Test
    public void testerCategorie(){
        assertEquals(this.cactusTestConnu.getCategorie(),Categorie.plante);
        assertEquals(this.cactusTestAleatoire.getCategorie(),Categorie.plante);
    }

}