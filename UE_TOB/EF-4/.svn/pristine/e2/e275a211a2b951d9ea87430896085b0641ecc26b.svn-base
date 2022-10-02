package Affichage;

import javax.print.DocFlavor.URL;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;
import javax.swing.*;

import java.awt.*;
import javax.swing.event.*;
import javax.swing.text.JTextComponent;

import Utile.ValeurInterditeException;
import Environement.Desert;
import Environement.Environnement;
import Environement.Foret;
import Environement.Marecage;
import Environement.Mer;
import Environement.Prairie;
import Espece.Espece;
import Espece.Loup;
import Simulation.Simulation;
import Utile.Position;

import java.util.List;


import java.awt.event.*;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.Flow;
import java.util.concurrent.TimeUnit;

public class SimulationSwing {
    private JFrame fenetre = new JFrame();
    public SimulationSwing(MapObervable mapEspece){
        Map<String, Espece> espPerso = new HashMap<>();
        VueEspeceFenetre vueEspeceFenetre = new VueEspeceFenetre(mapEspece, espPerso);
        Map<String,Environnement> envPerso = new HashMap<>();
       
        this.fenetre = new JFrame("Simulateur d'evolution");


		// Construire le contrôleur (gestion des événements)
		this.fenetre.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        ImageIcon background =new ImageIcon(new ImageIcon("Affichage/simulation.png").getImage().getScaledInstance(1280, 720, Image.SCALE_DEFAULT));
        ImagePanel panel = new ImagePanel(background.getImage());

        fenetre.setContentPane(panel);
       
        //Creation du Panel Simulation     
        try {
            //Creatio, du panel Choix
            Choix choix = new Choix(mapEspece, espPerso, fenetre);
            choix.choixEspece.add(vueEspeceFenetre.getPanel());
            ImageIcon lancerBoutton =new ImageIcon(new ImageIcon("Affichage/lancer.png").getImage().getScaledInstance(250, 67, Image.SCALE_DEFAULT));
            JLabel Lancer = new JLabel(lancerBoutton);
            Lancer.addMouseListener(new MouseListener() {

                private Environnement findEnvironnement(String selectedValue) {
                    switch(selectedValue){
                        case "Mer" :
                            return new Mer(640, 640);
                        case "Marecage": 
                            return new Marecage(640, 640);
                        case "Forêt" :
                            return new Foret(640, 640);
                        case "Desert" :
                            return new Desert(640, 640);
                        case "Prairie" :
                        default :
                            return new Prairie(640, 640);
                    }
                }

                @Override
                public void mouseClicked(MouseEvent e) {
                    // TODO Auto-generated method stub
                    if(choix.listeEnvironnement.getSelectedValue() != null){
                        Environnement env = findEnvironnement(choix.listeEnvironnement.getSelectedValue());
                        Simulation simu = new Simulation(env);
                        if(mapEspece.size() != 0){
                            ajouterSimu aSimu = new ajouterSimu(simu,mapEspece,espPerso);
                            Evolution evolution = new Evolution(mapEspece, simu, espPerso);
                            
                            panel.add(evolution.panelSimu);
                            evolution.panelSimu.setVisible(true);
                            choix.choixPanel.setVisible(false);
                            
                            
                            fenetre.pack();
                        }

                    }
                }

                @Override
                public void mouseEntered(MouseEvent e) {
                    // TODO Auto-generated method stub
                    ImageIcon lancerHoverBoutton =new ImageIcon(new ImageIcon("Affichage/lancer_hover.png").getImage().getScaledInstance(250, 67, Image.SCALE_DEFAULT));
                    Lancer.setIcon(lancerHoverBoutton);
                }

                @Override
                public void mouseExited(MouseEvent e) {
                    // TODO Auto-generated method stub
                    Lancer.setIcon(lancerBoutton);
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
            
           
            choix.choixPanel.add(Lancer,BorderLayout.SOUTH);
            Lancer.setPreferredSize(new Dimension(100,100));
            Menu menu = new Menu(choix, fenetre);
            panel.add(choix.choixPanel);
            panel.add(menu.panelMenu);
            choix.choixPanel.setVisible(false);
            fenetre.setResizable(false);
        } catch (ValeurInterditeException e) {
            System.out.println(e.getMessage());
        }
        


        
        
        
        //Creation du panel Menu
		// afficher la fenêtre

		fenetre.pack();			// redimmensionner la fenêtre

		fenetre.setVisible(true);	// l'afficher

    }
    public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
                MapObervable mapEspece = new MapObervable();
				new SimulationSwing(mapEspece);
			}
		});
	}
}
