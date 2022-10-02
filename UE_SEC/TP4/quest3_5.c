#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>
#include <sys/wait.h>
#include <string.h>
#include <fcntl.h>

#define N 5

void handler(int sign_num){
        ;;
}

int main (int argc, char *argv[]){
        //int status;
        signal(SIGCONT,handler);

        int tab[N] = {10,2,33,4,10};

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
                printf("Exec fils de pid %d\n",getpid());
                int lecture;
                pause();
                printf("Recep signal\n");
                read(p[0],&lecture,10*N);
                close(p[0]);
                exit(EXIT_SUCCESS);
                
        } else {
                printf("Exec père\n");
                while (1){
                        int ecriture = write(p[1],&tab,N);
                        sleep(1);
                        printf("Retour écriture %d\n",ecriture);
                }
                close(p[1]);
                exit(EXIT_SUCCESS);
        }
}
