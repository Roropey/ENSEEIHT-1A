package allumettes;

public class JeuProcuration implements Jeu{
	
	private Jeu jeu;
	
	public JeuProcuration(Jeu jeu) {
		this.jeu = jeu;
	}
	
	public int getNombreAllumettes() {
		return this.jeu.getNombreAllumettes();
	}

	public void retirer(int nbPrises) throws CoupInvalideException  {
		this.jeu.retirer(nbPrises);
		throw new OperationInterditeException("Le joueur triche !");
	}
		
}
