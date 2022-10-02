package allumettes;

public class JeuSimple implements Jeu {

	private int nombreAllumettes;

	public JeuSimple(int nbAllumettes) {
		this.nombreAllumettes = nbAllumettes;
	}
	
	public JeuSimple() {
		this(13);
	}

	public int getNombreAllumettes() {
		return this.nombreAllumettes;
	}

	public String toString() {
		return "Nombre d'allumettes restantes : " + this.nombreAllumettes;
	}

	public void retirer(int nbPrises) throws CoupInvalideException {
		int nbAllumettes = this.nombreAllumettes;
		if (nbPrises < 1) {
			throw new CoupInvalideException(nbPrises, "<1");
		} else if (nbPrises > PRISE_MAX) {
			throw new CoupInvalideException(nbPrises, ">" + Jeu.PRISE_MAX);
		} else if (nbPrises > nbAllumettes) {
			throw new CoupInvalideException(nbPrises, ">" + nbAllumettes);
		} else {
			this.nombreAllumettes = nbAllumettes - nbPrises;
		}
	}

}
