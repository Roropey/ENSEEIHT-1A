package allumettes;
import java.util.Random;

public class StrategieNaif implements Strategie {

	private Random nombre;

	public StrategieNaif() {
		this.nombre = new Random();
	}

	public int getPrise(Jeu jeu) {
		int priseMax = Integer.min(jeu.getNombreAllumettes(), Jeu.PRISE_MAX);
		return 1 + this.nombre.nextInt(priseMax);
	}

}
