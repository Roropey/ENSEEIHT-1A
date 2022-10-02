package Tests;

import org.junit.*;
import Ressources.Nenuphar ;
import Utile.*;

public class TestNenupharJUnit {

    protected Nenuphar nenupharTestConnu;
    protected Nenuphar nenupharTestAleatoire;

    @Before
    public void setUp(){
        this.nenupharTestConnu = new Nenuphar(4,10.5);
        this.nenupharTestAleatoire = new Nenuphar(10.5,50,20,30);
    }

    @Test
    public void testerPosition(){
        Position positionConnue = this.nenupharTestConnu.getPosition();
        Position positionAleatoire = this.nenupharTestAleatoire.getPosition();
        assertEquals(positionConnue.getX(),4);
        assertEquals(positionConnue.getY(),10.6);
        assertTrue((positionAleatoire.getX()>=10.5)&(positionAleatoire.getX()<=50));
        assertTrue((positionAleatoire.getY()>=20)&(positionAleatoire.getY()<=30));
    }
    
    @Test
    public void testerNutrition(){
        assertEquals(this.nenupharTestConnu.getValeurNutritive(),2);
        assertEquals(this.nenupharTestAleatoire.getValeurNutritive(),2);
    }

    @Test
    public void testerNom(){
        assertTrue(this.nenupharTestConnu.getNom().equals("Nénuphar"));
        assertTrue(this.nenupharTestAleatoire.getNom().equals("Nénuphar"));
    }

    @Test
    public void testerCategorie(){
        assertEquals(this.nenupharTestConnu.getCategorie(),Categorie.plante);
        assertEquals(this.nenupharTestAleatoire.getCategorie(),Categorie.plante);
    }

}