#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(){
        fork(); printf("fork 1 : processus %d, de père %d\n", getpid(), getppid());
        fork(); printf("fork 2: processus %d, de père %d\n", getpid(), getppid());
        fork(); printf("fork 3: processus %d, de père %d\n", getpid(), getppid());
        sleep(180);
        return EXIT_SUCCESS;
}
