package allumettes;

public interface Strategie {

	/** Obtenir un nombre d'allumettes à retirer. */
	int getPrise(Jeu jeu);
}
