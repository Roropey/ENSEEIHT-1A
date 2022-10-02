/** L'exception Echec permet de signaler l'erreur fonctionnelle d'un test.
 * @author	Xavier Crégut
 * @version	$Revision: 1.1 $
 */
package Utile;

public class Echec extends Error {
	public Echec() {
		super("Assert non vérfié");
	}
	public Echec(String message) {
		super(message);
	}
}
