#include "readcmd.c"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <string.h>
#include <signal.h>

int main (int argc, char *argv[]){

        int pid = fork();

        if (pid == 0){
                printf("fils\n");
                exit(1);
        } else {
                printf("père\n");
                exit(1);
        }
}
