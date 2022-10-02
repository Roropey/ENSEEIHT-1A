package Affichage;
import javax.swing.*;
import java.awt.*;
import javax.swing.event.*;
import javax.swing.text.JTextComponent;

import java.util.List;


import java.awt.event.*;
import java.util.*;
import java.util.concurrent.Flow;

public class Menu {
    JPanel panelMenu;
    public Menu(Choix choix, JFrame fenetre){
        panelMenu = new JPanel(){
            {setOpaque(false);}
        };
        JLabel Titre = new JLabel("Simulateur d'evolution");
        Titre.setForeground(Color.WHITE);
        int tailleCreer_x = 400;
        int tailleCreer_y = 125;
        ImageIcon ImageCreer =new ImageIcon(new ImageIcon("Affichage/commencer.png").getImage().getScaledInstance(tailleCreer_x, tailleCreer_y, Image.SCALE_DEFAULT));
        JLabel Creer = new JLabel(ImageCreer,JLabel.CENTER);
        Creer.setForeground(Color.BLUE);
        panelMenu.setLayout(null);

        panelMenu.add(Titre);
        panelMenu.add(Creer);
        int taille_panel_x = 1280;
        int taille_panel_y = 720;
        panelMenu.setPreferredSize(new Dimension(taille_panel_x,taille_panel_y));
        Titre.setBounds(taille_panel_x/2-100, 10, 200, 100);
        Creer.setBounds(3*taille_panel_x/4 - tailleCreer_x/2,taille_panel_y/2-tailleCreer_y/2,tailleCreer_x,tailleCreer_y);
        Creer.addMouseListener(new MouseListener() {

            @Override
            public void mouseClicked(MouseEvent e) {
                // TODO Auto-generated method stub
                choix.choixPanel.setVisible(true);
                panelMenu.setVisible(false);
                fenetre.pack();
            }

            @Override
            public void mouseEntered(MouseEvent e) {
                // TODO Auto-generated method stub
                ImageIcon creerHoverBoutton =new ImageIcon(new ImageIcon("Affichage/commencer_hover.png").getImage().getScaledInstance(tailleCreer_x, tailleCreer_y, Image.SCALE_DEFAULT));
                Creer.setIcon(creerHoverBoutton);
                
            }

            @Override
            public void mouseExited(MouseEvent e) {
                // TODO Auto-generated method stub
                Creer.setIcon(ImageCreer);
                
            }

            @Override
            public void mousePressed(MouseEvent e) {
                // TODO Auto-generated method stub
                
            }

            @Override
            public void mouseReleased(MouseEvent e) {
                // TODO Auto-generated method stub
                
            }
        });
    }
}
