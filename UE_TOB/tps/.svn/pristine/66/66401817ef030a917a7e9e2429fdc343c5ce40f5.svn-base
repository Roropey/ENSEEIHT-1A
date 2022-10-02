
public class Cellule {
	private int element;
	private Cellule suivant;
	
	public Cellule (int x, Cellule celluleSuivante) {
		this.element = x;
		this.suivant = celluleSuivante;				
	}
	
	public Cellule(int x) {
		this (x, null);
	}
	
	public int cardinal() {
		if (suivant == null) {
			return 0;
		} else {
			return suivant.cardinal() + 1;
		}
	}

	public int getElement() {
		return element;
	}

	public void setElement(int element) {
		this.element = element;
	}

	public Cellule getSuivant() {
		return suivant;
	}

	public void setSuivant(Cellule suivant) {
		this.suivant = suivant;
	}
	
	
}
