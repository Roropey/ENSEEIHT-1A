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

        char texte_pere[] = "PERE\n";
        int taille_pere = strlen(texte_pere);
        char texte_fils[] = "FILS\n";
        int taille_fils = strlen(texte_fils);

        char fichier[] = "temp.txt";

                
        int pid_fils = fork();

        if (pid_fils <0){
                printf("Erreur fork\n");
                exit(1);
        }

        if (pid_fils == 0){
                int fic = open(fichier, O_RDWR | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
                if (fic < 0) {
                        printf("Erreur ouverture %s\n",fichier);                
                        perror("Message");
                        exit(1);
                }

                for (int i = 0; i<10;i++){
                        int ecrit = write(fic,texte_fils,taille_fils);
                        if (ecrit<0){
                                printf("Erreur écriture\n");
                                perror("Message");
                                exit(1);
                        }
                        sleep(1);
                }
                int fermeture = close(fic);

        if (fermeture<0){
                printf("Erreur fermeture %s\n",fichier);
                perror("Message");
                exit(1);
        }
        } else {
                int fic = open(fichier, O_RDWR | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
                if (fic < 0) {
                        printf("Erreur ouverture %s\n",fichier);                
                        perror("Message");
                        exit(1);
                }

                for (int i = 0; i<10;i++){
                        int ecrit = write(fic,texte_pere,taille_pere);
                        if (ecrit<0){
                                printf("Erreur écriture\n");
                                perror("Message");
                                exit(1);
                        }
                        sleep(1);

                }
                wait(&status);
                int fermeture = close(fic);

        if (fermeture<0){
                printf("Erreur fermeture %s\n",fichier);
                perror("Message");
                exit(1);
        }
        }
        
        
        

}
