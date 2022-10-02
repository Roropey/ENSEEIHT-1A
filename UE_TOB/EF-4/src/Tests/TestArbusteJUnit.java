package Tests;

import org.junit.*;
import Ressources.Arbuste;
import Utile.*;

public class TestArbusteJUnit {

    protected Arbuste arbusteTestConnu;
    protected Arbuste arbusteTestAleatoire;

    @Before
    public void setUp(){
        this.arbusteTestConnu = new Arbuste(4,10.5);
        this.arbusteTestAleatoire = new Arbuste(10.5,50,20,30);
    }

    @Test
    public void testerPosition(){
        Position positionConnue = this.arbusteTestConnu.getPosition();
        Position positionAleatoire = this.arbusteTestAleatoire.getPosition();
        assertEquals(positionConnue.getX(),4);
        assertEquals(positionConnue.getY(),10.6);
        assertTrue((positionAleatoire.getX()>=10.5)&(positionAleatoire.getX()<=50));
        assertTrue((positionAleatoire.getY()>=20)&(positionAleatoire.getY()<=30));
    }
    
    @Test
    public void testerNutrition(){
        assertEquals(this.arbusteTestConnu.getValeurNutritive(),7);
        assertEquals(this.arbusteTestAleatoire.getValeurNutritive(),7);
    }

    @Test
    public void testerNom(){
        assertTrue(this.arbusteTestConnu.getNom().equals("Arbuste"));
        assertTrue(this.arbusteTestAleatoire.getNom().equals("Arbuste"));
    }

    @Test
    public void testerCategorie(){
        assertEquals(this.arbusteTestConnu.getCategorie(),Categorie.plante);
        assertEquals(this.arbusteTestAleatoire.getCategorie(),Categorie.plante);
    }

    @Test
    public void testerNbBaies(){
        int nbArbusteConnue = this.arbusteTestConnu.getNbBaies();
        int nbArbusteAleatoire = this.arbusteTestAleatoire.getNbBaies();
        assertTrue(nbArbusteConnue>=0);
        assertTrue(6>=nbArbusteConnue);
        assertTrue(nbArbusteAleatoire>=0);
        assertTrue(6>=nbArbusteAleatoire);
    }

    @Test
    public void testerEstMangee(){
        int nbArbusteConnue = this.arbusteTestConnu.getNbBaies();
        int nbArbusteAleatoire = this.arbusteTestAleatoire.getNbBaies();
        int i = 0;
        while(arbusteTestConnu.estMangee()){
            i++;
            assertEquals(arbusteTestConnu.getNbBaies()+i,nbArbusteConnue);
        }
        assertFalse(arbusteTestConnu.estMangee());

        i = 0;
        while(arbusteTestAleatoire.estMangee()){
            i++;
            assertEquals(arbusteTestAleatoire.getNbBaies()+i,nbArbusteAleatoire);
        }
        assertFalse(arbusteTestAleatoire.estMangee());
        
    }

}