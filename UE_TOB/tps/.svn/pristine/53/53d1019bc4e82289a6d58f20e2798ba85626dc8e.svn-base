
public class EnsembleOrdonneChaine extends EnsembleChaine implements EnsembleOrdonne{
	
	@Override public void ajouter (int x) {
		Cellule cellule = this.premier;
		while (cellule != null && cellule.getElement() != x && cellule.getElement() < x) {
			cellule = cellule.getSuivant();
		}
		if (cellule.getElement() != x) {
			cellule = new Cellule(x,cellule);
		}
	}
	
	@Override public void supprimer (int x) {
		Cellule cellule = this.premier;
		while (cellule != null && cellule.getElement() < x) {
			if (cellule.getElement() == x) {
				if (cellule.getSuivant() != null) {
					cellule.setElement(cellule.getSuivant().getElement());
					cellule.setSuivant(cellule.getSuivant().getSuivant());
				} else {
					cellule = null;
				}
			} else {
				cellule = cellule.getSuivant();
			}
		}
	}
	
	@Override public boolean contient(int x) {
		Cellule cellule = this.premier;
		while (cellule != null && cellule.getElement() != x && cellule.getElement() < x) {
			cellule = cellule.getSuivant();
		}
		return (cellule != null && cellule.getElement() < x && cellule.getElement() == x);
	}
	
	public int plusPetit() {
		assert(!this.estVide());
		return this.premier.getElement();
	}
}
