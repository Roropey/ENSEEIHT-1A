package Affichage;

import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;
import javax.swing.*;
import javax.swing.Timer;
import javax.swing.border.Border;

import java.awt.*;

import Espece.Espece;
import Espece.Individu;
import Espece.Loup;
import Espece.Aigle;
import Espece.Dauphin;
import Espece.Mouton;
import Espece.Sardine;
import Ressources.Ressource;
import Simulation.Simulation;
import Utile.ValeurInterditeException;

import java.awt.event.*;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.TimeUnit;

public class Evolution{
    boolean fini;
    boolean debut;
    private static final Map<Integer, ImageIcon> images
        = new HashMap<Integer, ImageIcon>();
    static {
        images.put(0,new ImageIcon(new ImageIcon("Affichage/despeedspeed.png").getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT)));
        images.put(1,new ImageIcon(new ImageIcon("Affichage/despeed.png").getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT)));
        images.put(2,new ImageIcon(new ImageIcon("Affichage/play.png").getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT)));
        images.put(3,new ImageIcon(new ImageIcon("Affichage/speed.png").getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT)));
        images.put(4,new ImageIcon(new ImageIcon("Affichage/speedspeed.png").getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT)));
        images.put(5,new ImageIcon(new ImageIcon("Affichage/despeedspeedbleu.png").getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT)));
        images.put(6,new ImageIcon(new ImageIcon("Affichage/despeedbleu.png").getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT)));
        images.put(7,new ImageIcon(new ImageIcon("Affichage/playbleu.png").getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT)));
        images.put(8,new ImageIcon(new ImageIcon("Affichage/speedbleu.png").getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT)));
        images.put(9,new ImageIcon(new ImageIcon("Affichage/speedspeedbleu.png").getImage().getScaledInstance(50, 50, Image.SCALE_DEFAULT)));
    }

    public JLabel[] barButtons = new JLabel[5];
    public JPanel panelSimu = new JPanel();
    public MapObervable mapEspeces;
    JPanel[] listeEspeceParametre;
    JLabel[] nomEspece;
    JPanel listeIntermediare;
    JPanel listeEspeceJPanel;
    public JPanel evolution;
    public Border Line = BorderFactory.createLineBorder(Color.black,2);
    Simulation simu;
    Map<String, Espece> espPerso;
    public Clip clip;
    public Evolution(MapObervable mapEspeces, Simulation simu, Map<String, Espece> espPerso){
        this.espPerso = espPerso;
        this.mapEspeces = mapEspeces;
        this.listeEspeceParametre = new JPanel[mapEspeces.size()];
        this.nomEspece = new JLabel[mapEspeces.size()];
        this.simu = simu;
        this.debut = true;
        fini= false;
		panelSimu.setLayout(new GridLayout(1,2));
        JPanel evolutiontemps = new JPanel();
        
        evolutiontemps.setLayout(new BorderLayout());
        EvolutionMap evolutionMap = new EvolutionMap(simu.getEnvironnement());

    
        evolution = new JPanel(null);
        
        
        evolution.add(evolutionMap);
        evolutionMap.setBounds(0, 0, simu.getEnvironnement().getDimensions()[0],simu.getEnvironnement().getDimensions()[1]);
        evolution.setPreferredSize(new Dimension(simu.getEnvironnement().getDimensions()[0],simu.getEnvironnement().getDimensions()[1]));
        mapEspeces.addObserver(new VueIndividu(evolution,simu,espPerso));
        evolutiontemps.add(evolution,BorderLayout.CENTER);
        
        JPanel temps = new JPanel();
        evolutiontemps.add(temps,BorderLayout.SOUTH);
        temps.setBackground(Color.LIGHT_GRAY);
        temps.setPreferredSize(new Dimension(300,60));

        
        for(int i = 0; i < barButtons.length; i++){
            barButtons[i] = new JLabel();
            barButtons[i].setIcon(images.get(i));
            barButtons[i].addMouseListener(new Clicklistener(i));
            

            temps.add(barButtons[i]);
            
        }
        
        this.panelSimu.add(evolutiontemps);  
        try {
            AudioInputStream audioIn = AudioSystem.getAudioInputStream(new File(
                    "Affichage/fichier.wav"));
            // Get a sound clip resource.
            clip = AudioSystem.getClip();
            // Open audio clip and load samples from the audio input stream.
            clip.open(audioIn);

        } catch (UnsupportedAudioFileException e1) {
            e1.printStackTrace();
        } catch (IOException e1) {
            e1.printStackTrace();
        } catch (LineUnavailableException e1) {
            e1.printStackTrace();
        }
        JPanel parametre = new JPanel();
        parametre.setBackground(Color.GRAY);
        JLabel TitreParametre = new JLabel("Parametres");
        parametre.setLayout(new BorderLayout());
        parametre.add(TitreParametre,BorderLayout.NORTH);
        

            listeIntermediare = new JPanel();
            mapEspeces.addObserver(new VueParametres(listeIntermediare,espPerso));
            
        
            parametre.add(listeIntermediare);  
        panelSimu.add(parametre);
    }
    

    
    private int interations = 1;
    private class Clicklistener implements MouseListener
    {
        private int i;
        
        public Clicklistener(int i){
           this.i=i;
        }
        @Override
        public void mouseClicked(MouseEvent e) {
            if(debut){
                clip.loop(Clip.LOOP_CONTINUOUSLY);
                debut = false;
            }
            barButtons[i].setIcon(images.get(i+5));
            for (int j = 0; j < 5; j++){
                if (j != i) {
                    barButtons[j].setIcon(images.get(j));
                }
            }
            int delay = 100;
            switch(i){
                case 0:
                    delay = 1000;
                    break;
                case 1:
                    delay = 500;
                    break;
                case 2:
                    delay = 100;
                    break;
                case 3:
                    delay = 50;
                    break;
                case 4:
                    delay = 25;
                    break;
                case 5:
                    delay = 10;
                    break;
            }
            new Timer(delay, new ActionListener(){

                @Override
                public void actionPerformed(ActionEvent e) {
                    if(!fini){
                        mapEspeces.clear();
                        simu.iterer();
                    }
                    
                    Map<Espece,Integer> especeNbre = new HashMap<>();
                    for (Individu iTest : simu.getIndividus()){
                        if ( especeNbre.get(iTest.getEspece()) != null){
                            especeNbre.put(iTest.getEspece(), especeNbre.get(iTest.getEspece())+1);
                        }else{
                            especeNbre.put(iTest.getEspece(), 1);
                        }
                        
                    }


                    for (Espece esp : especeNbre.keySet()){
                        mapEspeces.put(esp.getNom(), especeNbre.get(esp));
                        
                    }
                    if(especeNbre.size() == 0){
                        clip.close();
                        if(!fini){
                            
                            mapEspeces.reload();
                            fini =true;
                        }
                        
                       
                    }else{
                        mapEspeces.reload();
                    }
                    
                    interations++;
                }
                
            }).start();
            
            
        }
        @Override
        public void mouseEntered(MouseEvent e) {
            // TODO Auto-generated method stub

        }
        @Override
        public void mouseExited(MouseEvent e) {
            // TODO Auto-generated method stub
            
        }
        @Override
        public void mousePressed(MouseEvent e) {

            
        }
        @Override
        public void mouseReleased(MouseEvent e) {
        


            
        
            
        }
    }
}
