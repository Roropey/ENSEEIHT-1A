package allumettes;
import java.util.Scanner;

public class StrategieHumain implements Strategie {

	private static Scanner utilisateur = new Scanner(System.in);
	private String nom;

	public StrategieHumain(String name) {
		this.nom = name;
	}

	public int getPrise(Jeu jeu) {
		boolean estEntier = false;
		int n = 1;
		while (!estEntier) {
			try {
				String nextPrise = utilisateur.nextLine();
				if (nextPrise == "triche") {
					if (jeu.getNombreAllumettes() > 1) {
						System.out.print("[Une allumette en moins, "
								+ "plus que 4. Chut !]");
					} else {
						System.out.print("[Pas assez d'allumettes "
								+ "pour tricher.]");
					}
				} else {
					System.out.print(this.nom + ", combien d'allumettes ? ");
					n = Integer.parseInt(nextPrise);
					estEntier = true;
				}
			} catch (NumberFormatException e) {
				System.out.print("Vous devez donner un entier.");
			}
		}
		return n;
	}

}
