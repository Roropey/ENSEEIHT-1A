package allumettes;

public class JeuProc implements Jeu {

	private Jeu jeu;

	public JeuProc(Jeu jeu) {
		this.jeu = jeu;
	}
	
	public int getNombreAllumettes() {
		return jeu.getNombreAllumettes();
	}

	public void retirer(int nbPrise) throws CoupInvalideException {
		throw new OperationInterditeException("Le joueur triche.");
	}
}
