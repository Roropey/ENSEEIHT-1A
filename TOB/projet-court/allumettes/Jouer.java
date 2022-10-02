package allumettes;

/** Lance une partie des 13 allumettes en fonction des arguments fournis
 * sur la ligne de commande.
 * @author	Xavier Crégut
 * @version	$Revision: 1.5 $
 */
public class Jouer {

	/** Lancer une partie. En argument sont donnés les deux joueurs sous
	 * la forme nom@stratégie.
	 * @param args la description des deux joueurs
	 */
	public static void main(String[] args) {
		try {
			verifierNombreArguments(args);
			lancerPartie(args);

		} catch (ConfigurationException e) {
			System.out.println();
			System.out.println("Erreur : " + e.getMessage());
			afficherUsage();
			System.exit(1);
		} catch (OperationInterditeException e) {
			System.out.println(e.getMessage());
		}
	}

	private static void verifierNombreArguments(String[] args) {
		final int nbJoueurs = 2;
		if (args.length < nbJoueurs) {
			throw new ConfigurationException("Trop peu d'arguments : "
					+ args.length);
		}
		if (args.length > nbJoueurs + 1) {
			throw new ConfigurationException("Trop d'arguments : "
					+ args.length);
		}
	}

	/** Afficher des indications sur la manière d'exécuter cette classe. */
	public static void afficherUsage() {
		System.out.println("\n" + "Usage :"
				+ "\n\t" + "java allumettes.Jouer joueur1 joueur2"
				+ "\n\t\t" + "joueur est de la forme nom@stratégie"
				+ "\n\t\t" + "strategie = naif | rapide | expert | humain | tricheur"
				+ "\n"
				+ "\n\t" + "Exemple :"
				+ "\n\t" + "	java allumettes.Jouer Xavier@humain "
					   + "Ordinateur@naif"
				+ "\n"
				);
	}

	private static void lancerPartie(String[] arguments) throws ConfigurationException {
		Joueur j1 = determinerJoueur(arguments[0]);
		Joueur j2 = determinerJoueur(arguments[1]);
		Arbitre arbitre = new Arbitre(j1, j2);
		JeuSimple jeu = new JeuSimple();

		if (arguments.length == 2) {
			arbitre.arbitrer(jeu);
		} else if (arguments.length == 3) {
			if (arguments[0] == "-confiant") {
				arbitre.arbitrerConfiant(jeu);
			} else {
				throw new ConfigurationException("Le premier argument n'est pas conforme.");
			}
		}
	}

	private static Joueur determinerJoueur(String joueur) throws ConfigurationException {
		try {
			String[] joueurTab = joueur.split("@");
			Strategie s = determinerStrategie(joueurTab[0], joueurTab[1]);
			return new Joueur(joueurTab[0], s);
		} catch (IndexOutOfBoundsException e) {
			throw new ConfigurationException("Absence du symbole @ pour le joueur : "
					+ joueur);
		}
	}

	private static Strategie determinerStrategie(String nom, String strategie)
			throws ConfigurationException {
		Strategie s;
		switch (strategie) {
		case "humain":
			s = new StrategieHumain(nom);
			break;
		case "expert":
			s = new StrategieExpert();
			break;
		case "rapide":
			s = new StrategieRapide();
			break;
		case "tricheur":
			s = new StrategieTricheur();
			break;
		case "naif":
			s = new StrategieNaif();
			break;
		default:
				throw new ConfigurationException("Aucune strategie ne correspond au joueur "
						+ nom + ".");
		}
		return s;
	}

}
