package Affichage;

import java.awt.Graphics;
import java.util.Map;
import java.util.Observable;
import java.util.Observer;
import java.util.Random;

import Espece.Espece;
import Espece.Individu;
import Espece.Sardine;
import Espece.Loup;
import Espece.Aigle;
import Espece.Mouton;
import Espece.Dauphin;

import Simulation.Simulation;
import Utile.Position;

public class ajouterSimu {
    private Map<String, Espece> espPerso;
    public ajouterSimu(Simulation simu, MapObervable mapEspece, Map<String, Espece> espPerso){
        this.espPerso = espPerso;
        String mapstring = mapEspece.getMap().toString().substring(1,mapEspece.getMap().toString().length()-1);
        String[] liste = mapstring.split(", ");
        simu.getIndividus().clear();

        for (String especenbre : liste){
            String nom = especenbre.split("=")[0];
            int nombre = Integer.parseInt(especenbre.split("=")[1]);
            Espece espece = findEspece(nom);
            int x_centre = simu.getEnvironnement().getDimensions()[0]/2;
            int y_centre = simu.getEnvironnement().getDimensions()[1]/2;
            for (int i = 0;i<nombre;i++){
                Random random = new Random();
                int x, y, type;
                if (i%20 == 0){
                    do{
                        x_centre = random.nextInt(simu.getEnvironnement().getDimensions()[0]);
                        y_centre = random.nextInt(simu.getEnvironnement().getDimensions()[1]);
                        x = x_centre;
                        y = y_centre;
                        type = simu.getEnvironnement().getType(new Position(x,y));
                    }while(espece.getEstMarin() ? type>=0 : type<0 && !espece.getEstVolant());
                }else{
                    do{
                        x = x_centre + random.nextInt(10) ;
                        y = y_centre + random.nextInt(10);
                        if (x < 0 || y <0 || x>=simu.getEnvironnement().getDimensions()[0] || y>=simu.getEnvironnement().getDimensions()[1] ){
                            x = random.nextInt(simu.getEnvironnement().getDimensions()[0]);
                            y = random.nextInt(simu.getEnvironnement().getDimensions()[1]);
                        }
                        type = simu.getEnvironnement().getType(new Position(x,y));
                    }while(espece.getEstMarin() ? type>=0 : type<0 && !espece.getEstVolant());
                }

                
                Individu indiv = new Individu(espece,  new Position(x, y));
                
                simu.ajouterIndividu(indiv);
            }
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
