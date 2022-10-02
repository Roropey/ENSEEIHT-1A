package Tests;

import org.junit.*;
import Environement.Mer;
import Ressources.*;

public class TestMerJUnit  {

    protected Mer desertTest;

    @Before
    public void setUp(){
        this.merTest = new Mer(100,100);
    }

    @Test
    public void testerCaracteristique(){
        assertEquals(100,this.merTest.getCaracteristique());
    }
    @Test
    public void testerApparition(){
        for (int i=0; i<=100; i++){
            List<Ressource> ressources = this.merTest.apparaitre();
            assertGreater(25>=ressources.size());
            while (!(ressources.isEmpty())){
                Ressource ressource = ressources.remove(ressources.size()-1);
                assertFalse(ressource.getNom().equals("Arbre"));
                assertFalse(ressource.getNom().equals("Arbuste"));
                assertFalse(ressource.getNom().equals("Cactus")); 
                       
            }
        }
    }
}
