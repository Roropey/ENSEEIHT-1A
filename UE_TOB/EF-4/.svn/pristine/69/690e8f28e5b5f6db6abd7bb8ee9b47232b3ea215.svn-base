package Tests;

import org.junit.*;
import Ressources.Arbre;
import Utile.*;

public class TestArbreJUnit {

    protected Arbre arbreTestConnu;
    protected Arbre arbreTestAleatoire;

    @Before
    public void setUp(){
        this.arbreTestConnu = new Arbre(4,10.5);
        this.arbreTestAleatoire = new Arbre(10.5,50,20,30);
    }

    @Test
    public void testerPosition(){
        Position positionConnue = this.arbreTestConnu.getPosition();
        Position positionAleatoire = this.arbreTestAleatoire.getPosition();
        assertEquals(positionConnue.getX(),4);
        assertEquals(positionConnue.getY(),10.6);
        assertTrue((positionAleatoire.getX()>=10.5)&(positionAleatoire.getX()<=50));
        assertTrue((positionAleatoire.getY()>=20)&(positionAleatoire.getY()<=30));
    }
    
    @Test
    public void testerNutrition(){
        assertEquals(this.arbreTestConnu.getValeurNutritive(),10);
        assertEquals(this.arbreTestAleatoire.getValeurNutritive(),10);
    }

    @Test
    public void testerNom(){
        assertTrue(this.arbreTestConnu.getNom().equals("Arbre"));
        assertTrue(this.arbreTestAleatoire.getNom().equals("Arbre"));
    }

    @Test
    public void testerCategorie(){
        assertEquals(this.arbreTestConnu.getCategorie(),Categorie.plante);
        assertEquals(this.arbreTestAleatoire.getCategorie(),Categorie.plante);
    }

    @Test
    public void testerNbPommes(){
        int nbArbreConnu = this.arbreTestConnu.getNbPommes();
        int nbArbreAleatoire = this.arbreTestAleatoire.getNbPommes();
        assertTrue(nbArbreConnu>=0);
        assertTrue(6>=nbArbreConnu);
        assertTrue(nbArbreAleatoire>=0);
        assertTrue(6>=nbArbreAleatoire);
    }

    @Test
    public void testerEstMangee(){
        int nbArbreConnu = this.arbreTestConnu.getNbPommes();
        int nbArbreAleatoire = this.arbreTestAleatoire.getNbPommes();
        int i = 0;
        while(arbreTestConnu.estMangee()){
            i++;
            assertEquals(arbreTestConnu.getNbPommes()+i,nbArbreConnu);
        }
        assertFalse(arbreTestConnu.estMangee());

        i = 0;
        while(arbreTestAleatoire.estMangee()){
            i++;
            assertEquals(arbreTestAleatoire.getNbPommes()+i,nbArbreAleatoire);
        }
        assertFalse(arbreTestAleatoire.estMangee());

        
    }

}