#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
        int bonne_eec = 0;
        int pid=fork();
        if (pid == 0){
                int bonne_exec = execlp("ls","ls","-l","test.txt",NULL);
                 exit(EXIT_FAILURE);
                       
        } else {
        wait(&bonne_eec);
        printf("%d\n",bonne_eec);
                if (bonne_eec == 0){
                        printf("bonne exécution\n");
                }else{                
                        printf("mauvaise exécution\n");
                }
        }
}
