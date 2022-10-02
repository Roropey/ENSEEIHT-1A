#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
        char buf[30];
        int ret = 1;
        while (ret == 1){
                
           
                int bonne_exec = 0;
                int pid = fork();
                if (pid == -1) {
                        printf("Erreur fork\n");
                        exit(1);
                }
                if (pid==0){
                        printf("fils\n");
                        bonne_exec = execlp(buf,buf,NULL);
                        exit(EXIT_FAILURE);
                } else {
                        printf("père\n");
                        ret = scanf("%s",buf);
                        wait(&bonne_exec);
                        printf("%d\n",bonne_exec);
                        if (ret == 1) {
                        if (bonne_exec == 0){
                                printf("SUCCES\n");
                        } else {
                                printf("ECHEC\n");
                        }}
           
                }

        }


}
