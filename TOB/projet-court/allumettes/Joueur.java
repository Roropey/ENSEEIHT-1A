package allumettes;


public class Joueur {

	private String name;
	private Strategie strat;

	public Joueur(String nom, Strategie strategie) {
		this.name = nom;
		this.strat = strategie;
	}

	public String getNom() {
		return this.name;
	}

	public int getPrise(Jeu jeu) {
		System.out.println();
		return this.strat.getPrise(jeu);
	}

}
