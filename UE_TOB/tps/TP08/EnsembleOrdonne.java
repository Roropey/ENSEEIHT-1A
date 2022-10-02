/** Définition d'un ensemble d'entier ordonné. */
public interface EnsembleOrdonne extends Ensemble{
	
	/** Obtenir le plus élément de l'ensemble.
	 * @return plus petit élément de l'ensemble  */
	/*@ pure helper @*/ int plusPetit();

}