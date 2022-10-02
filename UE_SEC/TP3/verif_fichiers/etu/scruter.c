#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/wait.h>
#include <string.h>
#include <fcntl.h>
int main (int argc, char *argv[]){
       
        int status_ecrt;
        char fichier[] = "temp";
        
        //création fichier

        int crea = open(fichier, O_CREAT, S_IRUSR | S_IWUSR);
        if (crea < 0) {
                printf("Erreur création %s\n",fichier);
                perror("Message");
                exit(1);
        }
        int ferm_creat = close(crea);
        if (ferm_creat < 0) {
                printf("Erreur fermeture de la création %s\n",fichier);
                perror("Message");
                exit(1);
        }
                
       

        int pid_fils_ecriture = fork();
        if (pid_fils_ecriture <0){
                printf("Erreur fork ecriture\n");
                exit(1);
        }

        if ((pid_fils_ecriture == 0)) {
                for (int i = 1; i<=30; i++){
                        if (i%10==0){
                                int fic_ouvert = open(fichier, O_WRONLY | O_TRUNC, S_IRUSR | S_IWUSR);
                                if (fic_ouvert < 0) {
                                        printf("Erreur ouverture pour ecriture %s\n",fichier);
                                        perror("Message");
                                        exit(1);
                                }
 
                                int ecrit = write(fic_ouvert,&i,1);
                                if (ecrit < 0){
                                        printf("Erreur écriture %d\n",i);
                                        perror("Message");
                                        exit(1);
                                }
                                int fermeture = close(fic_ouvert);
                                if (fermeture <0){
                                        printf("Erreur fermeture après écriture\n");
                                        perror("Message");
                                        exit(1);
                                }
                                sleep(1);

                        } else {
                                int fic_ouvert = open(fichier, O_WRONLY | O_APPEND, S_IRUSR | S_IWUSR);
                                if (fic_ouvert < 0) {
                                        printf("Erreur ouverture pour ecriture %s\n",fichier);
                                        perror("Message");
                                        exit(1);
                                }
                                int ecrit = write(fic_ouvert,&i,1);
                                if (ecrit < 0){
                                        printf("Erreur écriture %d\n",i);
                                        perror("Message");
                                        exit(1);
                                }
                                int fermeture = close(fic_ouvert);
                                if (fermeture <0){
                                        printf("Erreur fermeture après écriture\n");
                                        perror("Message");
                                        exit(1);
                                }
                                sleep(1);
                        }
                }
                        
        
        } else {
                int pid_fils_lecture = fork();
                if (pid_fils_lecture <0){
                        printf("Erreur fork lecture\n");
                        exit(1);
                }
                if ((pid_fils_lecture == 0)){
                        while (1){
                                int tampon_nb;
                                int lu = 1;
                                int fic_ouvert = open(fichier, O_RDONLY, S_IRUSR | S_IWUSR);
                                while(lu >= 1){
                                        lu = read(fic_ouvert, &tampon_nb,1);
                                        if (lu<0){
                                                printf("Erreur lecture\n");
                                                perror("Message");
                                                exit(1);
                                        }
                                        printf("%d\n",tampon_nb);
                                }
                                sleep(6);
                        }
                } else {
                        waitpid(pid_fils_ecriture,&status_ecrt,WUNTRACED | WCONTINUED);
                        kill(pid_fils_lecture,SIGQUIT);
                }

        }                   
        
        

}
