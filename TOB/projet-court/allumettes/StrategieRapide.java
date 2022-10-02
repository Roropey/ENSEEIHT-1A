package allumettes;

public class StrategieRapide implements Strategie {

	public int getPrise(Jeu jeu) {
		return Integer.min(jeu.getNombreAllumettes(), Jeu.PRISE_MAX);
	}
}
