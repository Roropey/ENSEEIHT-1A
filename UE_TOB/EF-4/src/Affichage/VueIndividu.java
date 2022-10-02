package Affichage;

import java.awt.Dimension;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;

import javax.swing.JLabel;
import javax.swing.JPanel;

import Espece.Espece;
import Espece.Individu;
import Ressources.Ressource;
import Simulation.Simulation;
import Utile.ValeurInterditeException;

public class VueIndividu implements Observer {
    private JPanel EvolutionJpanel;
    private Simulation simu;
    private Map<String, Espece> espPerso;
    public VueIndividu(JPanel EvolutionJpanel, Simulation simu, Map<String, Espece> espPerso){
        this.EvolutionJpanel = EvolutionJpanel;
        this.simu = simu;
        this.espPerso = espPerso;
    }
    @Override
    public void update(Observable arg0, Object arg1) {
        // TODO Auto-generated method stub
        EvolutionJpanel.removeAll();

        if( simu.getIndividus().size() != 0){   
            for (Individu iTest : simu.getIndividus()){
                String nom = iTest.getEspece().getNom();
                JCanvasEspece IndividuSwing = new JCanvasEspece(nom,espPerso);
                
                EvolutionJpanel.add(IndividuSwing);
                IndividuSwing.setBounds((int) iTest.getPosition().getX(),(int) iTest.getPosition().getY(),5,5);

            }
        }
        
        if (simu.getRessources().size() != 0) {
            for (Ressource ressource : simu.getRessources()){
                try {
                    JCanvasRessources resSwing = new JCanvasRessources();
                    EvolutionJpanel.add(resSwing);
                    resSwing.setBounds((int) ressource.getPosition().getX(),(int) ressource.getPosition().getY(),5,5);               
                } catch (ValeurInterditeException e) {
                    
                }

                
            }
        }
        
        EvolutionMap evolutionMap = new EvolutionMap(simu.getEnvironnement());
        EvolutionJpanel.add(evolutionMap);
        EvolutionJpanel.setVisible(false);
        EvolutionJpanel.setVisible(true);
        evolutionMap.setBounds(0, 0, simu.getEnvironnement().getDimensions()[0],simu.getEnvironnement().getDimensions()[1]);
        


        
    }    
}