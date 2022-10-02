package Tests;


import Environement.Marecage;
import Ressources.*;

public class TestMarecageJUnit  {

    protected Marecage marecageTest;

    @Before
    public void setUp(){
        this.marecageTest = new Marecage(100,100);
    }

    @Test
    public void testerCaracteristique(){
        assertEquals(this.marecageTest.getCaracteristique(),75);
    }
    @Test
    public void testerApparition(){
        for (int i=0; i<=100; i++){
            List<Ressource> ressources = this.marecageTest.apparaitre();
            assertGreater(25>=ressources.size());
            while (!(ressources.isEmpty())){
                Ressource ressource = ressources.remove(ressources.size()-1);
                assertFalse(!(ressource.getNom().equals("Cactus")));
                assertFalse(!(ressource.getNom().equals("Arbuste"))); 
            }            
        }
    }
}
