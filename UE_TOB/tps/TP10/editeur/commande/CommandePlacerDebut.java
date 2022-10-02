package editeur.commande;

import editeur.Ligne;

public class CommandePlacerDebut extends CommandeLigne {

	/** Initialiser la ligne sur laquelle travaille
	 * cette commande.
	 * @param l la ligne
	 */
	//@ requires l != null;	// la ligne doit être définie
	public CommandePlacerDebut(Ligne l) {
		super(l);
	}

	public void executer() {
		ligne.raz();
	}

	public boolean estExecutable() {
		return 0 < ligne.getLongueur();
	}

}
