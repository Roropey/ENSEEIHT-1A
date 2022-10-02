package allumettes;

public class StrategieTricheur implements Strategie {

	public int getPrise(Jeu jeu) {
		try {
			int triche = jeu.getNombreAllumettes() - 2;
			System.out.println("[Je triche...]");
			jeu.retirer(triche);
			System.out.println("[Allumettes restantes : "
						+ jeu.getNombreAllumettes() + "]");
		} catch (CoupInvalideException e) {
			System.out.println("[Plus assez d'allumettes pour tricher]");
		}
		return 1;
	}
}
