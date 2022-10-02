#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>

#define MAX_PAUSES 10

void handler(int num_sign){
        printf("\nProcessus %d\nSignal %d\n", getpid(), num_sign);
        fork();
}


int main (int argc, char *argv[]){
        int nbPauses;
        nbPauses = 0;
        for (int i = 1; i <= NSIG; i++)
    	{signal (i, handler);}
        fork();
        printf("Processus de pid %d\n",getpid());
        for (nbPauses = 0; nbPauses < MAX_PAUSES; nbPauses++){
                pause();
                printf("pid = %d - NbPauses = %d\n", getpid(), nbPauses);

        };
        return EXIT_SUCCESS;
}
