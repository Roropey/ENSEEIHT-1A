package Tests;

import org.junit.*;
import Ressources.Pomme ;
import Utile.*;

public class TestPommeJUnit {

    protected Pomme pommeTestConnu;
    protected Pomme pommeTestAleatoire;

    @Before
    public void setUp(){
        this.pommeTestConnu = new Pomme(4,10.5);
        this.pommeTestAleatoire = new Pomme(10.5,50,20,30);
    }

    @Test
    public void testerPosition(){
        Position positionConnue = this.pommeTestConnu.getPosition();
        Position positionAleatoire = this.pommeTestAleatoire.getPosition();
        assertEquals(positionConnue.getX(),4);
        assertEquals(positionConnue.getY(),10.6);
        assertTrue((positionAleatoire.getX()>=10.5)&(positionAleatoire.getX()<=50));
        assertTrue((positionAleatoire.getY()>=20)&(positionAleatoire.getY()<=30));
    }
    
    @Test
    public void testerNutrition(){
        assertEquals(this.pommeTestConnu.getValeurNutritive(),2);
        assertEquals(this.pommeTestAleatoire.getValeurNutritive(),2);
    }

    @Test
    public void testerNom(){
        assertTrue(this.pommeTestConnu.getNom().equals("Pomme"));
        assertTrue(this.pommeTestAleatoire.getNom().equals("Pomme"));
    }

    @Test
    public void testerCategorie(){
        assertEquals(this.pommeTestConnu.getCategorie(),Categorie.fruit);
        assertEquals(this.pommeTestAleatoire.getCategorie(),Categorie.fruit);
    }

}