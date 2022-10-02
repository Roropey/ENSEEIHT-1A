
public class EnsembleChaine implements Ensemble{
	protected Cellule premier;
	
	public EnsembleChaine() {
		this.premier = null;
	}
	public EnsembleChaine(int x) {
		this.premier = new Cellule(x);		
	}
	
	public int cardinal() {
		if (this.premier == null) {
			return 0;
		}
		else {
			return this.premier.cardinal()+1;
		}
	}
	
	public boolean estVide() {
		return (this.premier == null);
	}
	
	public boolean contient(int x) {
		Cellule cellule = this.premier;
		while (cellule != null && cellule.getElement() != x) {
			cellule = cellule.getSuivant();
		}
		return (cellule != null && cellule.getElement() == x);
	}
	
	public void ajouter(int x) {
		
		if (this.estVide()) {
			this.premier = new Cellule(x);
		} else {
			Cellule cellule = this.premier;
			while (cellule.getSuivant() != null && cellule.getElement() != x) {
				cellule = cellule.getSuivant();
			}
			if (cellule.getSuivant() == null && cellule.getElement() != x) {
				cellule.setSuivant(new Cellule(x));
			}
		}
	}
	
	public void supprimer(int x) {
		assert (!this.estVide());
		if (this.premier.getElement()==x) {
			if (this.premier.getSuivant() == null) {
				this.premier = null;
			} else {
				this.premier.setSuivant(this.premier.getSuivant().getSuivant());
				this.premier.setElement(this.premier.getSuivant().getElement());
			}
		} else {
			Cellule cellule = this.premier;
			while (cellule.getSuivant() != null) {
				if (cellule.getSuivant().getElement() == x) {
					if (cellule.getSuivant().getSuivant() != null) {
						cellule.setElement(cellule.getSuivant().getElement());
						cellule.setSuivant(cellule.getSuivant().getSuivant());
					} else {
						cellule.setSuivant(null);
					}
				} else {
					cellule = cellule.getSuivant();
				}
			}
		}
		
	}
}


