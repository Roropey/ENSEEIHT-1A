package allumettes;

public class StrategieTricheur implements Strategie {
	
	public int getPrise(Jeu jeu) {
		System.out.println("[Je triche...]");
		try {
			int triche = jeu.getNombreAllumettes() - 2; //triche pour correspondre à l'exemple
			while (triche > 0) {
				jeu.retirer(Integer.min(triche,Jeu.PRISE_MAX));
				triche = triche - Jeu.PRISE_MAX;
			}
			
			System.out.println("[Allumettes restantes : "
						+ jeu.getNombreAllumettes() + "]");
		} catch (CoupInvalideException e) {
			System.out.println("[Plus assez d'allumettes pour tricher]");
		}
		return 1;
	}
	
	public String toString() {
		return "tricheur";
	}
}