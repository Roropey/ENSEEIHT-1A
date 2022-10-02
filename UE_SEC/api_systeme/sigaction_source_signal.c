#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h> 

/* traitant sigaction, avec récupération du pid de l'émetteur du signal */
void sigaction_sig (int num_sig, siginfo_t *siginfo, void * notused) {
	int emetteur;
	
	// récupérer le numéro du porcessus qui a envoyé le signal
	emetteur = siginfo->si_pid;
	
	printf("Processus %d a recu le signal %d envoye par le processus %d \n", getpid(), num_sig, emetteur);
}

/* traitant qui peut être utilisé en modifiant l'initialisation de sigaction */
void handler_sig (int num_sig) {
	printf("Processus %d a recu le signal %d\n", getpid(), num_sig);
}

/* Programme principal 
 * un père crée un fils et s'endort pendant 120 secondes 
 * le fils se termine après 3 secondes environs ==> envoi de SIGCHLD au père 
 * le père traite (traitant sigaction dessus) SIGCHLD, SIGINT, SIGTSTP et SIGCONT : 
 * afficahge du numéro du signal reçu et du pid de l'émetterur 
 * A tester avec CtrlC, CtrlZ, et envoie des signaux depuis un autre terminal */

int main() {
	struct sigaction s;
	
	int pid, retval, duree_sommeil = 120;
	
	/* Il est très important d'initialiser sa_flags, éventuellement avec 0 */
	s.sa_flags = SA_SIGINFO; // pour récupérer les infos dans siginfo
	s.sa_sigaction = sigaction_sig;

    /* On utilise soit sa_sigaction ou sa_handler */
	// s.sa_handler = handler_sig;
	
	retval = sigaction(SIGINT, &s, NULL);   // 3eme paramètre à NULL, car on ne
	retval = sigaction(SIGTSTP, &s, NULL);  // souhaite pas récupérer l'ancien
	retval = sigaction(SIGCONT, &s, NULL);  // sigaction
	retval = sigaction(SIGCHLD, &s, NULL);
	
	if(retval < 0) { 
		perror("sigaction failed"); 
	} 
	
	pid = fork();
	switch (pid) {
		case -1 :
			printf("Erreur fork\n"); exit(1);
		case 0 : //fils 
			sleep(3);
			exit(0); 	
				
		default : //pere 
			printf("Je suis le processus %d et j'ai cree un fils de numéro %d\n", getpid(), pid);
			printf("Je m'endors pendant %d secondes et je traite les signaux SIGINT, SIGTSTP,  SIGCONT et SIGCHLD\n", duree_sommeil);

			int duree=0;
			do {
				sleep(1);  	// sleep est arrêté par la réception d'un signal
							// on ne peut donc pas utiliser sleep(duree_sommeil)
				duree++;
			} while (duree < duree_sommeil);
	}
	return 0;
}
