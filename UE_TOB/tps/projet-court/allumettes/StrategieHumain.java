package allumettes;
import java.util.Scanner;

public class StrategieHumain implements Strategie {
	
	private static Scanner humain = new Scanner(System.in);
	private String nom;
	
	public StrategieHumain(String nom) {
		this.nom = nom;
	}
	
	public int getPrise(Jeu jeu) {
		int prise;
		do {
			try {
				String entreeJoueur = humain.nextLine();
				System.out.print(this.nom + ", combien d'allumettes ? ");
				if (entreeJoueur.contentEquals("triche")) {
					try {
						jeu.retirer(1);
						System.out.println("[Une allumette en moins, plus que "+jeu.getNombreAllumettes()+". Chut !]");
					} catch (CoupInvalideException e) {
						System.out.println("[Pas assez d'allumettes pour tricher.]");
					}
				} else {
					prise = Integer.parseInt(entreeJoueur);
					break;
				}
			} catch (NumberFormatException e) {
				System.out.println("Vous devez donner un entier.");
			}
		} while (true);
		return prise;
	}
	
	public String toString() {
		return "humain";
	}
}
