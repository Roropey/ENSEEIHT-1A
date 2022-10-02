#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/wait.h>
#include <string.h>
#include <fcntl.h>

#define BUFSIZE 32

int main (int argc, char *argv[]){
        int status;
        int p[2];
        int pid = fork();
        if (pid < 0){
                printf("Erreur fork\n");
                exit(1);
        }

        if (pid == 0){
                printf("Exec fils\n");
                int entier;
                read(p[0],&entier,sizeof(int));
                printf("l'entier lu par le fils : %d\n",entier);
                close(p[0]);
                exit(EXIT_SUCCESS);
                
        } else {
                printf("Exec père\n");
                int retour = pipe(p);
                if (retour == -1){
                        printf("Erreur pipe\n");
                        exit(1);
                }
                int entier = 10;
                write(p[1], &entier, sizeof(int));
                printf("Attente fils\n");
                wait(&status);
                close(p[1]);
                exit(EXIT_SUCCESS);
        }
}
