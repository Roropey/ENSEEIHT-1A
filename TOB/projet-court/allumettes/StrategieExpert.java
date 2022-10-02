package allumettes;

public class StrategieExpert implements Strategie {

	public int getPrise(Jeu jeu) {
		int prise;
		switch (jeu.getNombreAllumettes()) {
		case 1:
		case 2:
		case 5:
		case 6:
			prise = 1;
			break;
		case 3:
		case 7:
			prise = 2;
			break;
		default:
			prise = 3;
		}
		return prise;
	}

}
