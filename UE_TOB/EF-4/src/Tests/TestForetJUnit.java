package Tests;

import org.junit.*;
import Environement.Foret;
import Ressources.*;

public class TestForetJUnit  {

    protected Foret foretTest;

    @Before
    public void setUp(){
        this.foretTest = new Foret(100,100);
    }

    @Test
    public void testerCaracteristique(){
        assertEquals(50,this.foretTest.getCaracteristique());
    }
    @Test
    public void testerApparition(){
        for (int i=0; i<=100; i++){
            List<Ressource> ressources = this.foretTest.apparaitre();
            assertGreater(25>=ressources.size());
            while (!(ressources.isEmpty())){
                Ressource ressource = ressources.remove(ressources.size()-1);
                assertFalse(ressource.getNom().equals("Cactus"));
                assertFalse(ressource.getNom().equals("Algue"));
            }
        }
    }
}
