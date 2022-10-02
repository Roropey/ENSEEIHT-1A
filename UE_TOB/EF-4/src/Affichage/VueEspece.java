package Affichage;
import javax.swing.*;
import java.awt.*;
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

import java.util.List;


import java.awt.event.*;
import java.util.*;
import java.util.concurrent.Flow;

public class VueEspece implements Observer {
    private JPanel Panel;
    private Map<String, Espece> espPerso;
    public VueEspece(JPanel Panel, Map<String, Espece> espPerso){
        this.Panel = Panel;
        this.espPerso = espPerso;
    }
    @Override
    public void update(Observable arg0, Object arg1) {
        String mapstring = arg1.toString().substring(1,arg1.toString().length()-1);
        Panel.removeAll();
    
        if (mapstring.length() !=0){
            String[] liste = mapstring.split(",");
            
            for (String especenbre : liste){
                String nom = especenbre.split("=")[0].replaceAll("\\s+", "");
                String nombre = especenbre.split("=")[1];
                Espece espece = findEspece(nom);
                Panel.add(new JLabel(espece.getNom()+" Nombre : "+nombre));
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
