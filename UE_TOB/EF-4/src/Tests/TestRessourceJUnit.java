package Tests;

import org.junit.*;
import Ressources.Ressource;
import Utile.*;

public class TestRessourceJUnit {

    protected Ressource ressourceTestConnu;
    protected Ressource ressourceTestAleatoire;

    @Before
    public void setUp(){
        this.ressourceTestConnu = new Ressource(5,6.6,"test connu", 10, Categorie.plante);
        this.ressourceTestAleatoire = new Ressource(10.5,50,20,30,"test aléatoire", 5, Categorie.fruit);
    }

    @Test
    public void testerPosition(){
        Position positionConnue = this.ressourceTestConnu.getPosition();
        Position positionAleatoire = this.ressourceTestAleatoire.getPosition();
        assertEquals(positionConnue.getX(),5);
        assertEquals(positionConnue.getY(),6.6);
        assertTrue((positionAleatoire.getX()>=10.5)&(positionAleatoire.getX()<=50));
        assertTrue((positionAleatoire.getY()>=20)&(positionAleatoire.getY()<=30));
    }
    
    @Test
    public void testerNutrition(){
        assertEquals(this.ressourceTestConnu.getValeurNutritive(),10);
        assertEquals(this.ressourceTestAleatoire.getValeurNutritive(),5);
    }

    @Test
    public void testerNom(){
        assertTrue(this.ressourceTestConnu.getNom().equals("test connu"));
        assertTrue(this.ressourceTestAleatoire.getNom().equals("test aléatoire"));
    }

    @Test
    public void testerCategorie(){
        assertEquals(this.ressourceTestConnu.getCategorie(),Categorie.plante);
        assertEquals(this.ressourceTestAleatoire.getCategorie(),Categorie.fruit);
    }

    @Test
    public void testerExisteMangee(){
        assertTrue(this.ressourceTestConnu.getExiste());
        assertTrue(this.ressourceTestConnu.estMangee());
        assertFalse(this.ressourceTestConnu.getExiste());
        assertFalse(this.ressourceTestConnu.estMangee());
    }

    @Test
    public void testerExisteMeurt(){
        assertTrue(this.ressourceTestAleatoire.getExiste());
        this.ressourceTestAleatoire.meurt();
        assertFalse(this.ressourceTestAleatoire.getExiste());
    }

    @Test(expected=ValeurInterditeException.class)
    public void testRobustesseX(){
        Ressource impossibleX = new Ressource(-1,6.6,"Problème X", 10, Categorie.plante);
    }

    @Test(expected=ValeurInterditeException.class)
    public void testRobustesseY(){
        Ressource impossibleY = new Ressource(1,-6.6,"Problème Y", 10, Categorie.plante);
    }

    @Test(expected=ValeurInterditeException.class)
    public void testRobustesseMinX(){
        Ressource impossibleMinX = new Ressource(-5,50,20,30,"Problème min X", 5, Categorie.fruit);
    }

    @Test(expected=ValeurInterditeException.class)
    public void testRobustesseMinY(){
        Ressource impossibleMinY = new Ressource(5,50,-20,30,"Problème min Y", 5, Categorie.fruit);
    }

    @Test(expected=ValeurInterditeException.class)
    public void testRobustesseMinMaxX(){
        Ressource impossibleMinMaxX = new Ressource(5,1,20,30,"Problème min>max X", 5, Categorie.fruit);
    }

    @Test(expected=ValeurInterditeException.class)
    public void testRobustesseMinMaxY(){
        Ressource impossibleMinMaxY = new Ressource(5,50,20,3,"Problème min>max Y", 5, Categorie.fruit);
    }

}