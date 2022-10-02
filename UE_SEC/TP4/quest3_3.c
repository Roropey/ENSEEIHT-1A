#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/wait.h>
#include <string.h>
#include <fcntl.h>

#define BUFSIZE 32

int main (int argc, char *argv[]){
        //int status;
        int p[2];
        int retour = pipe(p);
        if (retour == -1){
                printf("Erreur pipe\n");
                exit(1);
        }
        int pid = fork();
        if (pid < 0){
                printf("Erreur fork\n");
                exit(1);
        }

        if (pid == 0){
                printf("Exec fils\n");
                int entier;
                int lecture = 1;
                while(lecture>0){
                        lecture = read(p[0],&entier,sizeof(int));
                        printf("entier %d valeur retournée %d\n",entier,lecture);
                }
                printf("sortie de boucle\n");
                close(p[0]);
                exit(EXIT_SUCCESS);
                
        } else {
                printf("Exec père\n");
                for (int i = 1; i<=10;i++){
                        write(p[1],&i,sizeof(int));
                }
                sleep(10);
                close(p[1]);
                exit(EXIT_SUCCESS);
        }
}
