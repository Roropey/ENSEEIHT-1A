package Affichage;
import javax.swing.*;
import java.awt.*;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;

import javax.swing.event.*;
import javax.swing.text.JTextComponent;

import Environement.Environnement;
import Environement.Prairie;
import Espece.Espece;
import Espece.Sardine;
import Espece.Loup;
import Espece.Aigle;
import Espece.Mouton;
import Espece.Dauphin;

public class VueParametres implements Observer {
    private JPanel EspeceJpanel;
    private Map<String, Espece> espPerso;
    public VueParametres(JPanel EspeceJpanel, Map<String, Espece> espPerso){
        this.EspeceJpanel = EspeceJpanel;
        this.espPerso = espPerso;
    }
    /*@Override
    public void update(Observable arg0, Object arg1) {
        
        
        if(simu.getIndividus().size() != 0){   
            String mapstring = arg1.toString().substring(1,arg1.toString().length()-1);
            String[] liste = mapstring.split(",");
            
            
            for (String especenbre : liste){
                String nom = especenbre.split("=")[0].replaceAll("\\s+", "");
                Espece espece = findEspece(nom);

                EspeceJpanel.add(new JLabel("Duree de vie :" + espece.getDureeDeVie()));
                EspeceJpanel.add(new JLabel("Taux de reproduction :" + espece.getTauxReproduction(espece.getMajorite()+1)));
                EspeceJpanel.add(new JLabel("Esperance de vie : " +espece.getDureeDeVie()));
                EspeceJpanel.add(new JLabel("Marin : " + (espece.getEstMarin()? "Oui ": "Non") ));
                EspeceJpanel.add(new JLabel("Volant : " + (espece.getEstVolant()? "Oui ": "Non") ));
            }
            
            EspeceJpanel.setVisible(false);
            EspeceJpanel.setVisible(true);
        }
    }*/
    @Override
    public void update(Observable arg0, Object arg1) {

        String mapstring = arg1.toString().substring(1,arg1.toString().length()-1);
        EspeceJpanel.removeAll();
    
        if (mapstring.length() !=0){
            String[] liste = mapstring.split(", ");
            
            JPanel intermediare = new JPanel();
            intermediare.setPreferredSize(new Dimension(600,600));
            int i = 0;
            JPanel[] parametreEsp = new JPanel[liste.length];
            for (String especenbre : liste){
                parametreEsp[i] = new JPanel();
                parametreEsp[i].setLayout(new GridLayout(16,1));
                String nom = especenbre.split("=")[0].replaceAll("\\s+", "");
                String nombre = especenbre.split("=")[1];
                Espece espece = findEspece(nom);
                parametreEsp[i].add(new JLabel(espece.getNom()+" Nombre : "+nombre));

                parametreEsp[i].add(new JLabel("Duree de vie :" + espece.getDureeDeVie()));
                parametreEsp[i].add(new JLabel("Taux de reproduction :" + espece.getTauxReproduction(espece.getMajorite()+1)));
                parametreEsp[i].add(new JLabel("Esperance de vie : " +espece.getDureeDeVie()));
                parametreEsp[i].add(new JLabel("Marin : " + (espece.getEstMarin()? "Oui ": "Non ") ));
                parametreEsp[i].add(new JLabel("Volant : " + (espece.getEstVolant()? "Oui ": "Non ") ));
                parametreEsp[i].add(new JLabel("Majorite : " + espece.getMajorite()));
                parametreEsp[i].add(new JLabel("Ecart type : " + espece.getEcartTypeEspece()));
                parametreEsp[i].add(new JLabel("Portee d'action : " + espece.getPorteeAction()));
                parametreEsp[i].add(new JLabel("Portee de la vision : " + espece.getPorteeVision()));
                parametreEsp[i].add(new JLabel("Satiete maximum : " + espece.getSatieteMax()));
                parametreEsp[i].add(new JLabel("Ferveur seuille : " + espece.getFerveurSeuil()));
                parametreEsp[i].add(new JLabel("Valeur nutritive : " + espece.getValeurNutritive()));
                parametreEsp[i].add(new JLabel("Nombre d'enfants : " + espece.getNbEnfantsMin() + "-" + espece.getNbEnfantsMax()));
                parametreEsp[i].add(new JLabel("Vitesse : " + espece.getVitesse()));
                
                intermediare.add(parametreEsp[i]);

                
            }

        EspeceJpanel.add(intermediare);
       }else{
        
        JLabel fin = new JLabel("FIN");
        EspeceJpanel.setLayout(new BorderLayout());
        EspeceJpanel.add(fin,BorderLayout.CENTER);

       }
       

        
    }
    private Espece findEspece(String str){
        switch (str){
            case "Sardine" :
                return new Sardine();
            case "Aigle" : 
                return new Aigle();
            case "Dauphin" : 
                return new Dauphin();
            case "Mouton" : 
                return new Mouton();
            case "Loup" : 
                return new Loup();
            default : return espPerso.get(str);
        }
    };

}