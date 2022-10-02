package editeur.commande;

import editeur.Ligne;

public class CommandeAfficherLigne extends CommandeLigne {

	/** Initialiser la ligne sur laquelle travaille
	 * cette commande.
	 * @param l la ligne
	 */
	//@ requires l != null;	// la ligne doit être définie
	public CommandeAfficherLigne(Ligne l) {
		super(l);
	}

	public void executer() {
		ligne.afficher();
	}

	public boolean estExecutable() {
		return true;
	}

}
