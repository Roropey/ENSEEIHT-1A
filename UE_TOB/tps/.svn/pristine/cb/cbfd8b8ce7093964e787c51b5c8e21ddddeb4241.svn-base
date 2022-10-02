package allumettes;

public class Arbitre {
	
	private Joueur j1;
	private Joueur j2;
	
	public Arbitre(Joueur j1, Joueur j2) {
		this.j1 = j1;
		this.j2 = j2;
	}
	
	public void arbitrer(Jeu jeu) {
		boolean finPartie = true;
		do {
			try {
				faireJouer(jeu, new JeuProcuration(jeu), this.j1);
				if (jeu.getNombreAllumettes() == 0) {
					afficherFin(this.j1,this.j2);
					break;
				}
				
				faireJouer(jeu, new JeuProcuration(jeu), this.j2);
				if (jeu.getNombreAllumettes() == 0) {
					afficherFin(this.j2,this.j1);
					break;
				}
				
			} catch (OperationInterditeException e) {
				System.out.println(e.getMessage());
				break;
			}
		} while (finPartie);
	}
	
	private void faireJouer(Jeu jeuReel, Jeu jeuProc, Joueur j){
		do {
			try {
				System.out.println("Allumettes restantes : "+jeuReel.getNombreAllumettes());
				int n = j.getPrise(jeuProc);
				afficherPrise(j, n);
				jeuReel.retirer(n);	
				System.out.println();
				break;
			} catch (OperationInterditeException e) {
				throw new OperationInterditeException("Abandon de la partie car "+j.getNom()+" triche !");
			} catch (CoupInvalideException e) {
				System.out.println("Impossible ! Nombre invalide : "+e.getCoup()+" ("+e.getProbleme()+")");
			}
			System.out.println();
		}while (true);
	}
	
	private void afficherPrise (Joueur j, int prise) {
		System.out.print(j.getNom()+" prend "+prise+" allumette");
		if (prise <2) {
			System.out.println(".");
		} else {
			System.out.println("s.");
		}
	}
	
	private void afficherFin(Joueur perdant, Joueur gagnant) {
		System.out.println(perdant.getNom()+" perd !");
		System.out.println(gagnant.getNom()+" gagne !");
	}
	
	public void arbitrerConfiant(Jeu jeu) {
		do {
			faireJouer(jeu, jeu, this.j1);
			if (jeu.getNombreAllumettes() == 0) {
				afficherFin(this.j1,this.j2);
				break;
			}
			
			faireJouer(jeu, jeu, this.j2);
			if (jeu.getNombreAllumettes() == 0) {
				afficherFin(this.j2,this.j1);
				break;
			}
				
						
		} while (true);
	}
}
