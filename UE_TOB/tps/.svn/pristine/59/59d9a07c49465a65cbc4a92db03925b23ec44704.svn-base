package allumettes;

import java.util.Random;

public class StrategieNaif implements Strategie {
	
	public int getPrise(Jeu jeu) {
		final Random nombre = new Random();
		return 1 + nombre.nextInt(Integer.min(jeu.getNombreAllumettes(),Jeu.PRISE_MAX));
	}
	
	public String toString() {
		return "naif";
	}
}
