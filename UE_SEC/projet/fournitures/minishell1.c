#include "readcmd.c"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <string.h>

int main(int argc, char *argv[]){
              

        while (1){ //Boucle infini
                
                struct cmdline * cmd_lue;
                cmd_lue = readcmd(); // lecture de la ligne de commande

                int pid = fork(); // création du fils


                if (pid == -1) { // vérification de la bonne création du fils
                        printf("Erreur fork\n");
                        exit(1);
                }


                if (pid==0){
                        int bonne_exec = execvp(cmd_lue->seq[0][0], cmd_lue->seq[0]);
                        return EXIT_SUCCESS;

                        // Code normalement non-execute
                        if (bonne_exec == 0) {
                                printf("Bonne execution\n");
                        } else {
                                printf("Mauvaise execution\n");
                        }
                } else {
                        printf("Affichage par le père\n");
                }

        }
}

