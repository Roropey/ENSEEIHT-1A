package editeur.commande;

import editeur.Ligne;

public class CommandeSupprimerSousCurseur extends CommandeLigne {

	/** Initialiser la ligne sur laquelle travaille
	 * cette commande.
	 * @param l la ligne
	 */
	//@ requires l != null;	// la ligne doit être définie
	public CommandeSupprimerSousCurseur(Ligne l) {
		super(l);
	}

	public void executer() {
		ligne.supprimer();
	}

	public boolean estExecutable() {
		return 0 < ligne.getLongueur();
	}

}
