package Tests;

import org.junit.*;
import Environement.Desert;
import Ressources.*;

public class TestDesertJUnit  {

    protected Desert desertTest;

    @Before
    public void setUp(){
        this.desertTest = new Desert(100,100);
    }

    @Test
    public void testerCaracteristique(){
        assertEquals(0,this.desertTest.getCaracteristique());
    }
    @Test
    public void testerApparition(){
        for (int i=0; i<=100; i++){
            List<Ressource> ressources = this.desertTest.apparaitre();
            assertGreater(25>=ressources.size());
            while (!(ressources.isEmpty())){
                Ressource ressource = ressources.remove(ressources.size()-1);
                assertFalse(ressource.getNom().equals("Arbre"));
                assertFalse(ressource.getNom().equals("Nenuphar"));
                assertFalse(ressource.getNom().equals("Algue")); 
            }
        }
    }
}
