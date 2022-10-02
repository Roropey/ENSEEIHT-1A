package allumettes;

import org.junit.*;
import static org.junit.Assert.*;

public class TestStrategieRapide {
		
	@Test
	public void TestBonChoix() {
		Joueur j1 = new Joueur("j1",new StrategieRapide());
		Joueur j2 = new Joueur("j2",new StrategieRapide());
		Jeu jeu = new JeuReel();
		try {
			assertTrue("Jeu mal lancer",jeu.getNombreAllumettes()==13);
			jeu.retirer(j1.getPrise(jeu));
			assertTrue("Joueur 1 mal jouer", jeu.getNombreAllumettes()==10);
			jeu.retirer(j2.getPrise(jeu));
			assertTrue("Joueur 2 mal jouer", jeu.getNombreAllumettes()==7);
			jeu.retirer(j1.getPrise(jeu));
			assertTrue("Joueur 1 mal jouer", jeu.getNombreAllumettes()==4);
			jeu.retirer(j2.getPrise(jeu));
			assertTrue("Joueur 2 mal jouer", jeu.getNombreAllumettes()==1);
			jeu.retirer(j1.getPrise(jeu));
			assertTrue("Joueur 1 mal jouer", jeu.getNombreAllumettes()==0);
		} catch (CoupInvalideException e) {
			
		}
	}
}
