package Affichage;

import javax.swing.*;
import javax.swing.*;
import java.awt.*;
import java.util.Map;

import javax.swing.event.*;
import javax.swing.text.JTextComponent;

import Espece.Espece;

public class VueEspeceFenetre {
    private JPanel listeEspeceJPanel;
    public VueEspeceFenetre(MapObervable mapEspece, Map<String, Espece> espPerso){
        this.listeEspeceJPanel = new JPanel(){
            {setOpaque(false);}
        };;
        this.listeEspeceJPanel.setLayout(new GridLayout(mapEspece.size(),1));
        mapEspece.addObserver(new VueEspece(listeEspeceJPanel, espPerso));
    }

    public JPanel getPanel(){
        return this.listeEspeceJPanel;
    }
}
