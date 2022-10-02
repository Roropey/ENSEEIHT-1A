import javax.swing.*;
import java.awt.*;
import javax.swing.event.*;
import java.awt.event.*;
import java.util.*;

/** Programmation d'un jeu de Morpion avec une interface graphique Swing.
  *
  * REMARQUE : Dans cette solution, le patron MVC n'a pas été appliqué !
  * On a un modèle (?), une vue et un contrôleur qui sont fortement liés.
  *
  * @author	Xavier Crégut
  * @version	$Revision: 1.4 $
  */

public class MorpionSwing{

	// les images à utiliser en fonction de l'état du jeu.
	private static final Map<ModeleMorpion.Etat, ImageIcon> images
		= new HashMap<ModeleMorpion.Etat, ImageIcon>();
	static {
		images.put(ModeleMorpion.Etat.VIDE, new ImageIcon("blanc.jpg"));
		images.put(ModeleMorpion.Etat.CROIX, new ImageIcon("croix.jpg"));
		images.put(ModeleMorpion.Etat.ROND, new ImageIcon("rond.jpg"));
	}
	
// Choix de réalisation :
// ----------------------
//
//  Les attributs correspondant à la structure fixe de l'IHM sont définis
//	« final static » pour montrer que leur valeur ne pourra pas changer au
//	cours de l'exécution.  Ils sont donc initialisés sans attendre
//  l'exécution du constructeur !

	private ModeleMorpion modele;	// le modèle du jeu de Morpion

//  Les éléments de la vue (IHM)
//  ----------------------------

	/** Fenêtre principale */
	private JFrame fenetre;

	/** Bouton pour quitter */
	private final JButton boutonQuitter = new JButton("Q");

	/** Bouton pour commencer une nouvelle partie */
	private final JButton boutonNouvellePartie = new JButton("N");

	/** Cases du jeu */
	private final JLabel[][] cases = new JLabel[3][3];

	/** Zone qui indique le joueur qui doit jouer */
	private final JLabel joueur = new JLabel();

	private final JMenuBar BarreMenu = new JMenuBar();
	
	private final JMenu menu = new JMenu("Jeu");
	
	private final JMenuItem menuNouvellePartie = new JMenuItem("Nouvelle Partie");
	private final JMenuItem menuQuitter = new JMenuItem("Quitter");
	
	private boolean etatPartie = true;
	
// Le constructeur
// ---------------

	/** Construire le jeu de morpion */
	public MorpionSwing() {
		this(new ModeleMorpionSimple());

	}

	/** Construire le jeu de morpion */
	public MorpionSwing(ModeleMorpion modele) {
		// Initialiser le modèle
		this.modele = modele;

		// Créer les cases du Morpion
		for (int i = 0; i < this.cases.length; i++) {
			for (int j = 0; j < this.cases[i].length; j++) {
				this.cases[i][j] = new JLabel();
			}
		}

		// Initialiser le jeu
		this.recommencer();

		// Construire la vue (présentation)
		//	Définir la fenêtre principale
		this.fenetre = new JFrame("Morpion");
		this.fenetre.setLocation(100, 200);
		this.fenetre.setLayout(new GridLayout(4,3));
		for (int i = 0; i < this.cases.length; i++) {
			for (int j = 0; j < this.cases[i].length; j++) {
				this.fenetre.add(this.cases[i][j]);
				this.cases[i][j].addMouseListener(new ActionTrace(i,j));
			}
		}

		
		this.menu.add(menuNouvellePartie);
		this.menuNouvellePartie.addActionListener(new ActionNouvellePartie());
		
		this.menu.add(menuQuitter);
		this.menuQuitter.addActionListener(new ActionQuitter());
		this.BarreMenu.add(menu);

		this.fenetre.setJMenuBar(BarreMenu);
		
		this.fenetre.add(this.boutonNouvellePartie);
		this.fenetre.add(this.joueur);
		this.fenetre.add(this.boutonQuitter);
		
		this.boutonNouvellePartie.addActionListener(new ActionNouvellePartie());
		this.boutonQuitter.addActionListener(new ActionQuitter());
		
		
		// Construire le contrôleur (gestion des événements)
		this.fenetre.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		// afficher la fenêtre
		this.fenetre.pack();			// redimmensionner la fenêtre
		this.fenetre.setVisible(true);	// l'afficher
	}

// Quelques réactions aux interactions de l'utilisateur
// ----------------------------------------------------
	
	public class ActionTrace extends MouseAdapter{
		
		int i;
		int j;
		
		public ActionTrace(int i, int j) {
			this.i = i;
			this.j = j;
		}
		
		public void mouseClicked(MouseEvent ev) {
			if (etatPartie) {
				try {
					ModeleMorpion.Etat joueurActuel = modele.getJoueur();
					modele.cocher(i,j);
					cases[i][j].setIcon(images.get(joueurActuel));
					if (modele.estTerminee()) {
						if (modele.estGagnee()) {
							System.out.println("La partie est terminée : joueur "+joueurActuel+" a gagné !\nVeuillez recommencer.");
						} else {
							System.out.println("La partie est terminée : partie nulle, aucun gagnant !\nVeuillez recommencer.");
						}
						
						etatPartie = false;
					} else {
						joueur.setIcon(images.get(modele.getJoueur()));
					}
				} catch (CaseOccupeeException e) {
					System.out.println(e.getMessage());
				}
			}
			
		}
		
	}
	
	public class ActionNouvellePartie implements ActionListener{
		public void actionPerformed(ActionEvent evt) {
			System.out.println("Nouvelle partie.");
			recommencer();
		}
	}
	
	public class ActionQuitter implements ActionListener {
		public void actionPerformed(ActionEvent evt) {
			System.out.println("Quitter");
			System.exit(0);
		}
	}
	
	/** Recommencer une nouvelle partie. */
	public void recommencer() {
		this.modele.recommencer();

		// Vider les cases
		for (int i = 0; i < this.cases.length; i++) {
			for (int j = 0; j < this.cases[i].length; j++) {
				this.cases[i][j].setIcon(images.get(this.modele.getValeur(i, j)));
			}
		}

		// Mettre à jour le joueur
		joueur.setIcon(images.get(modele.getJoueur()));
		etatPartie = true;
	}



// La méthode principale
// ---------------------

	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				new MorpionSwing();
			}
		});
	}

}
