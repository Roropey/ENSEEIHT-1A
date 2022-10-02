package Tests;

import org.junit.*;
import Ressources.Algue ;
import Utile.*;

public class TestAlgueJUnit {

    protected Algue algueTestConnu;
    protected Algue algueTestAleatoire;

    @Before
    public void setUp(){
        this.algueTestConnu = new Algue(4,10.5);
        this.algueTestAleatoire = new Algue(10.5,50,20,30);
    }

    @Test
    public void testerPosition(){
        Position positionConnue = this.algueTestConnu.getPosition();
        Position positionAleatoire = this.algueTestAleatoire.getPosition();
        assertEquals(positionConnue.getX(),4);
        assertEquals(positionConnue.getY(),10.6);
        assertTrue((positionAleatoire.getX()>=10.5)&(positionAleatoire.getX()<=50));
        assertTrue((positionAleatoire.getY()>=20)&(positionAleatoire.getY()<=30));
    }
    
    @Test
    public void testerNutrition(){
        assertEquals(this.algueTestConnu.getValeurNutritive(),5);
        assertEquals(this.algueTestAleatoire.getValeurNutritive(),5);
    }

    @Test
    public void testerNom(){
        assertTrue(this.algueTestConnu.getNom().equals("Nénuphar"));
        assertTrue(this.algueTestAleatoire.getNom().equals("Nénuphar"));
    }

    @Test
    public void testerCategorie(){
        assertEquals(this.algueTestConnu.getCategorie(),Categorie.plante);
        assertEquals(this.algueTestAleatoire.getCategorie(),Categorie.plante);
    }

}