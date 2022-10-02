#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/wait.h>
#include <string.h>
#include <fcntl.h>

#define BUFSIZE 32


int main (int argc, char *argv[]){
        char tampon[BUFSIZE];
        int lu = BUFSIZE;
        int fic_src = open(argv[1],O_RDONLY, S_IRUSR | S_IWUSR);
        if (fic_src < 0) {
                printf("Erreur ouverture %s\n", argv[1]);
                perror("Message");
                exit(1);
        }

        int fic_dest = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR);
        if (fic_dest < 0) {
                printf("Erreur ouverture %s\n",argv[2]);                
                perror("Message");
                exit(1);
        }
        
        while(lu>=BUFSIZE){
                lu = read(fic_src, tampon,BUFSIZE);
                if (lu<0){
                        printf("Erreur lecture\n");
                        perror("Message");
                        exit(1);
                }
                int ecrit = write(fic_dest,tampon,lu);
                if (ecrit<0){
                        printf("Erreur écriture\n");
                        perror("Message");
                        exit(1);
                }
        }        

        int src_close = close(fic_src);

        if (src_close<0){
                printf("Erreur fermeture %s\n",argv[1]);
                perror("Message");
                exit(1);
        }

        int dest_close = close(fic_dest);
        if (dest_close<0){
                printf("Erreur fermeture %s\n",argv[2]);
                perror("Message");
                exit(1);       
        }





}
