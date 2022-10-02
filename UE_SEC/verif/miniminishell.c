#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <string.h>

int main(int argc, char *argv[]){
        char buf[30];
        int ret = 1;
        while ((ret == 1) & (strcmp(buf,"exit")!=0)){
                
           
                int bonne_exec;
                printf(">>>");
                ret = scanf("%s",buf);
                if ((ret == 1) & (strcmp(buf,"exit")!=0)) {
                int pid = fork();
                if (pid == -1) {
                        printf("Erreur fork\n");
                        exit(1);
                }
                if (pid==0){
                        int bonne_exec = execlp(buf,buf,NULL);
                        exit(bonne_exec);
                } else {
                        //printf("père\n");
                        
                        wait(&bonne_exec);
                        if (bonne_exec == 0){
                                printf("SUCCES\n");
                        } else {
                                printf("ECHEC\n");
                                                }
           
                }
                }

        }


}
