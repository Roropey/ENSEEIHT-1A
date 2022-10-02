import java.util.List;
public class GroupeAgenda extends AgendaAbstrait{

	private List<AgendaAbstrait> ListeAgenda;
	
	public GroupeAgenda(String nom) {
		super(nom);
		
	}

	public void ajouter(AgendaAbstrait Agenda) {
		this.ListeAgenda.add(Agenda);
	}
	
	@Override
	public void enregistrer(int creneau, String rdv) throws OccupeException, IllegalArgumentException {
		
		for (AgendaAbstrait agenda : ListeAgenda) {
			try {
				agenda.getRendezVous(creneau);
				throw new OccupeException();
			} catch (LibreException e) {
				;;
			}
		}
		for (AgendaAbstrait agenda : ListeAgenda) {
			agenda.enregistrer(creneau, rdv);
		}
		
	}

	@Override
	public boolean annuler(int creneau) {
		boolean modifie_general = false;
		for (AgendaAbstrait agenda : ListeAgenda) {
			boolean modifie_agenda = agenda.annuler(creneau);
			if (modifie_agenda) {
				modifie_general = true;
			}
		}
		return modifie_general;
	}

	@Override
	public String getRendezVous(int creneau) throws LibreException, IllegalArgumentException {
		// TODO Auto-generated method stub
		return null;
	}

}
