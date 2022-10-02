package allumettes;

public class Arbitre {

	private Joueur j1;
	private Joueur j2;

	public Arbitre(Joueur j1, Joueur j2) {
		this.j1 = j1;
		this.j2 = j2;
	}

	public void arbitrer(Jeu jeu) {
		boolean j1Perd = false;
		while (jeu.getNombreAllumettes() != 0) {
			try {
				this.demanderJoueur(jeu, new JeuProc(jeu), this.j1);
				if (jeu.getNombreAllumettes() != 0) {
					this.demanderJoueur(jeu, new JeuProc(jeu), this.j2);
				} else {
					afficherFin(j1, j2);
					j1Perd = true;
				}
			} catch (OperationInterditeException e) {
				throw new OperationInterditeException(e.getMessage());
			}
		}
		if (!j1Perd) {
			afficherFin(j2, j1);
		}
	}

	private void afficherFin(Joueur perdant, Joueur gagnant) {
		System.out.println(perdant.getNom() + " perd !");
		System.out.println(gagnant.getNom() + " gagne !");
	}

	private void demanderJoueur(Jeu vraiJeu, Jeu jeuJoueurs, Joueur j) {
		boolean bonnePrise = false;
		int n = 0;
		while (!bonnePrise) {
			try {
				System.out.println("Nombre d'allumettes restantes : " 
							+ vraiJeu.getNombreAllumettes());
				n = j.getPrise(jeuJoueurs);
				afficherPrise(j, n);
				vraiJeu.retirer(n);
				bonnePrise = true;
				System.out.println();
			} catch (CoupInvalideException e) {
				System.out.println(e.getMessage());
			} catch (OperationInterditeException e) {
				throw new OperationInterditeException("Abandon de la partie car " 
						+ j.getNom() + " triche !");
			}
		}
	}

	private void afficherPrise(Joueur j, int n) {
		if (n < 2) {
			System.out.print(j.getNom() + " prend " + n + " allumette.");
		} else {
			System.out.print(j.getNom() + " prend " + n + " allumettes.");
		}
	}

	public void arbitrerConfiant(Jeu jeu) {
		boolean j1Perd = false;
		while (jeu.getNombreAllumettes() != 0) {
			this.demanderJoueur(jeu, jeu, this.j1);
			if (jeu.getNombreAllumettes() != 0) {
				this.demanderJoueur(jeu, jeu, this.j2);
			} else {
				afficherFin(j1, j2);
				j1Perd = true;
			}
		}
		if (!j1Perd) {
			afficherFin(j2, j1);
		}
	}


}
