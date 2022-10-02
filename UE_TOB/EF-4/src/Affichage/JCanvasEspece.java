package Affichage;

import javax.swing.*;

import Espece.*;

import java.awt.*;
import java.util.Map;


public class JCanvasEspece extends JPanel{
    private String nom;
    private Map<String, Espece> espPerso;
    public JCanvasEspece(String nom,Map<String, Espece> espPerso) {
        this.nom = nom;
        this.espPerso = espPerso;
    }

    public void paint(Graphics g) {
        super.paint(g);
        g.setColor(findEspece(nom).getColor());
        g.fillRect(0,0,5,5);

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
