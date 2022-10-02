package editeur;

import editeur.commande.*;
import menu.*;

/** Un éditeur pour une ligne de texte.  Les commandes de
 * l'éditeur sont accessibles par un menu.
 *
 * @author	Xavier Crégut
 * @version	1.6
 */
public class EditeurLigne {

	/** La ligne de notre éditeur */
	private Ligne ligne;

	/** Le menu principal de l'éditeur */
	private Menu menuPrincipal;
		// Remarque : Tous les éditeurs ont le même menu mais on
		// ne peut pas en faire un attribut de classe car chaque
		// commande doit manipuler la ligne propre à un éditeur !

	/** Initialiser l'éditeur à partir de la lign à éditer. */
	public EditeurLigne(Ligne l) {
		ligne = l;

		// Créer le menu principal
		menuPrincipal = new Menu("Menu principal", new CommandeAfficherLigne(ligne));
		Menu sousMenuDeplacement = new Menu("Deplacement curseur", new CommandeAfficherLigne(ligne));
		Menu sousMenuModification = new Menu("Modification ligne", new CommandeAfficherLigne(ligne));
		sousMenuModification.ajouter("Ajouter un texte en fin de ligne",
					new CommandeAjouterFin(ligne));
		sousMenuDeplacement.ajouter("Placer le curseur au début de la ligne",
					new CommandePlacerDebut(ligne));
		sousMenuDeplacement.ajouter("Avancer le curseur d'un caractère",
					new CommandeCurseurAvancer(ligne));
		sousMenuDeplacement.ajouter("Reculer le curseur d'un caractère",
					new CommandeCurseurReculer(ligne));
		sousMenuModification.ajouter("Supprimer le caractère sous le curseur", new CommandeSupprimerSousCurseur(ligne));
		menuPrincipal.ajouter("Déplacer le curseur", sousMenuDeplacement);
		menuPrincipal.ajouter("Modifier la ligne", sousMenuModification);
	}

	public void editer() {
		do {

			menuPrincipal.executer();

		} while (! menuPrincipal.estQuitte());
	}

}
