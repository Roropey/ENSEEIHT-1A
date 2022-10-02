#include <stdio.h>    /* entrées/sorties */
#include <unistd.h>   /* primitives de base : fork, ...*/
#include <stdlib.h>   /* exit */

#define MAX_PAUSES 10     /* nombre d'attentes maximum */

int main(int argc, char *argv[]) {
	int nbPauses;
	
	nbPauses = 0;
	printf("Processus de pid %d\n", getpid());
	for (nbPauses = 0 ; nbPauses < MAX_PAUSES ; nbPauses++) {
		pause();		// Attente d'un signal
		printf("pid = %d - NbPauses = %d\n", getpid(), nbPauses);
    } ;
    return EXIT_SUCCESS;
}
