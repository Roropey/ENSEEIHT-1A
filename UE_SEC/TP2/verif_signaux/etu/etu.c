#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <signal.h>

void handler_SR(int num_sign){
        printf("\nReception %d\n",num_sign);
}



int main (int argc, char * argv[]){    

        pid_t pid_prog = getpid();

        //1.
        signal(SIGUSR1, handler_SR);
        signal(SIGUSR2, handler_SR);
        //2.
                //Masquage SIGINT
        sigset_t signal_sigint;
        sigemptyset(&signal_sigint);
        sigaddset(&signal_sigint,SIGINT);
        sigprocmask(SIG_BLOCK,&signal_sigint,NULL);
        
                //Masquage SIGUSR1
        sigset_t signal_sigusr1;
        sigemptyset(&signal_sigusr1);
        sigaddset(&signal_sigusr1,SIGUSR1);
        sigprocmask(SIG_BLOCK,&signal_sigusr1,NULL);

        //3.
        sleep(10);

        //4.
        kill(pid_prog,SIGUSR1); //premier SIGUSR1
        kill(pid_prog,SIGUSR1); //second SIGUSR1
        sleep(5);
        kill(pid_prog,SIGUSR2); //premier SIGUSR2
        kill(pid_prog,SIGUSR2); //second SIGUSR2

        //5.
        sigprocmask(SIG_UNBLOCK,&signal_sigusr1,NULL);

        //6.
        sleep(10);
        sigprocmask(SIG_UNBLOCK,&signal_sigint,NULL);

        //7.
        printf("Salut !\n");

}
