package Affichage;

import javax.swing.*;

import Espece.*;

import java.awt.*;
import java.util.Map;


public class JCanvasRessources extends JPanel{
    /*private int x;
    private int y;
    public JCanvasRessources(int x, int y){
        this.x = x;
        this.y = y;
    }*/
    public void paint(Graphics g) {
        super.paint(g);
        g.setColor(new Color(0,150,0));
        /*g.fillRect(0,2,1,6);
        g.fillRect(1,1,1,8);
        g.fillRect(2,0,6,10);
        g.fillRect(8,1,1,8);
        g.fillRect(9,2,1,6);*/
        g.fillRect(0,0,5,5);



    }

}
