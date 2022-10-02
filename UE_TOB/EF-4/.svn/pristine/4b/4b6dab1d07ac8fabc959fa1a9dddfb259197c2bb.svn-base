
package Affichage;

import javax.swing.*;

import Espece.Espece;

import java.awt.*;
import java.util.Map;


public 
class ImagePanel extends JPanel {

  private Image img;
    {setOpaque(false);}
  public ImagePanel(String img) {
    this(new ImageIcon(img).getImage());
  }

  public ImagePanel(Image img) {
    this.img = img;
    Dimension size = new Dimension(img.getWidth(null), img.getHeight(null));
    setPreferredSize(size);
    setMinimumSize(size);
    setMaximumSize(size);
    setSize(size);
  }

  public void paintComponent(Graphics g) {
    g.drawImage(img, 0, 0, null);
  }

}
