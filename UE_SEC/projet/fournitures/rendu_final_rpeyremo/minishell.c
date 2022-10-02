#include "readcmd.c"
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <string.h>
#include <signal.h>
#include <fcntl.h>


struct cmdline * cmd_lue;


//Création de la liste de processus
typedef enum {ACTIF, SUSPENDU} Etat; //Enumération des états possibles

typedef struct process *list_process; //Pointeur de la liste

struct process {        //Enregistrement des informations utiles d'un processus
        int id;
        int pid;
        Etat etat;
        char cmd[128];
        list_process process_suiv;
};

//Variables
int id;
int pid_fils;
list_process liste;
sigset_t signaux;
//Fonction utile à une liste :

int estVide(list_process liste){
        return liste==NULL;
}

int estPresent(int id, list_process liste){
        if (liste == NULL){
                return 0;
        } else {
                if (liste->id == id) {
                        return 1;
                } else {
                        return estPresent(id, liste->process_suiv);
                }
        }
}

void  ajouter (int pid, Etat etat, char *commande, list_process *liste) {
        list_process nouv_liste;
        nouv_liste = malloc(sizeof(struct process));
        if (estVide(*liste)) {
                nouv_liste -> id = 1;
        } else {
                nouv_liste->id = (*liste)->id + 1;
        }
        nouv_liste->pid = pid;
        nouv_liste->etat = etat;
        strncpy(nouv_liste -> cmd, commande, 128);
        nouv_liste->process_suiv = *liste;
        *liste = nouv_liste;
}

void supprimer (int id, list_process *liste){
        if (estVide(*liste)){
                printf("Erreur supression processus inexistant d'id %d\n",id);
                exit(1);
        } else {
                if ((*liste)->id == id) {
                        *liste = (*liste)->process_suiv;               
                }else if (estVide((*liste)->process_suiv)) {
                        printf("Erreur supression processus inexistant d'id %d\n",id);
                        exit(1);
                } else {
                        if (((*liste)->process_suiv)->id == id){
                                (*liste)->process_suiv = ((*liste)-> process_suiv)->process_suiv;
                        } else {
                                supprimer(id, &((*liste)->process_suiv));
                        }
                }
        }
}

void afficher_process(list_process liste){
        if (liste->etat == ACTIF) {
                printf("%d\t %d\t %s\t %s\n", liste->id, liste->pid, "ACTIF", liste->cmd);
        } else {
                printf("%d\t %d\t %s\t %s\n", liste->id, liste->pid, "SUSPENDU", liste->cmd);
        }
        if (!(estVide(liste->process_suiv))) {
                afficher_process(liste->process_suiv);
        }
}

void afficher_list(list_process liste){
        if (estVide(liste)){
                printf("Liste vide\n");
        }else{
                printf("ID\t PID\t Etat\t Commande entrée\n");
                afficher_process(liste);
        }
}

//Fonction propre aux processus
void suspendre(int id, list_process *liste){
        if (estVide(*liste)){
                printf("Erreur suspension processus inexistant d'id %d\n",id);
                exit(1);
        } else if ((*liste)->id == id) {
                (*liste)->etat = SUSPENDU;
        } else {
                suspendre(id, &((*liste)->process_suiv));
        }
}

void relancer (int id, list_process *liste){
        if (estVide(*liste)){
                printf("Erreur relancement processus inexistant d'id %d\n",id);
                exit(1);
        } else if ((*liste)->id == id){
                (*liste)->etat = ACTIF;
        } else {
                relancer(id, &((*liste)->process_suiv));
        }
}

int idtopid(int id, list_process liste){
        if (estVide(liste)) {
                return -1;
        } else if (liste->id == id){
                return liste->pid;
        } else {
                return idtopid(id, liste->process_suiv);
        }
}

int pidtoid(int pid, list_process liste){
        if (estVide(liste)){
                return -1;
        } else if (liste->pid == pid){
                return liste->id;
        } else {
                return pidtoid(pid,liste->process_suiv);
        }
}

int estActif(int id, list_process liste){
        if (estVide(liste)){
                printf("Erreur processus inexistant d'id %d\n",id);
                return 0;
        } else if (liste->id == id){
                return liste->etat == ACTIF;
        } else {
                return estActif(id, liste->process_suiv);
        }
}

//Fonction handler pour les signaux
void HandlerFin(int sign){
        int status,fils_fin;
        while((fils_fin = waitpid(-1,&status,WNOHANG))!=0 && fils_fin != -1){
                supprimer(pidtoid(fils_fin,liste), &liste);
        }
}

void HandlerStop(int sign){
        printf("\n");
        kill(pid_fils, SIGSTOP);
        if (estPresent(pidtoid(pid_fils,liste),liste) && estActif(pidtoid(pid_fils,liste),liste)){
                suspendre(pidtoid(pid_fils,liste),&liste);
        }        
}

void HandlerInt(int sign){
        printf("\n");
        kill(pid_fils, SIGINT);
}

//Programme principal
int main(int argc, char *argv[]){
       struct cmdline * cmd_lue;
       
       //int status_fils;

       liste = NULL;
       // Gestion des signaux
       signal(SIGCHLD, &HandlerFin);
       signal(SIGTSTP, &HandlerStop);
       signal(SIGINT, &HandlerInt);

       //Masquage des signaux pour pas tuer le père
       sigemptyset(&signaux);
       sigaddset(&signaux,SIGTSTP);
       sigaddset(&signaux,SIGINT);
       
       while (1){ //Boucle infini
                
                cmd_lue = readcmd(); // lecture de la ligne de commande
              
                int i = 0;

                int entree[2] = {0,0};
                int sortie[2] = {0,0};
                int read;
                int write;
                // Redirections
                if (cmd_lue -> in != NULL){
                        read = open(cmd_lue -> in, O_RDONLY);
                        if (read == -1){
                                printf("fichier non trouvé/inexistant : %s\n",cmd_lue -> in);
                                exit(1);
                        }
                }

                if (cmd_lue -> out != NULL){
                        write = open(cmd_lue -> in, O_WRONLY | O_CREAT | O_TRUNC, 0666);
                        if (write == -1){
                                printf("création fichier impossible \n");
                                exit(1);
                        }
                }


                while (cmd_lue->seq[i]!=NULL) {
                        if (strcmp(cmd_lue->seq[i][0],"exit")==0){
                                return EXIT_SUCCESS;
                        } else if (strcmp(cmd_lue -> seq[i][0], "cd") == 0){
                                chdir(cmd_lue->seq[i][1]);
                        } else if (strcmp(cmd_lue -> seq[i][0], "lj") == 0){
                                afficher_list(liste);
                        } else if (strcmp(cmd_lue -> seq[i][0], "sj") == 0){
                                id = atoi(cmd_lue  -> seq[i][1]);
                                if (estPresent(id,liste)){
                                        suspendre(id, &liste);
                                        kill(idtopid(id,liste), SIGSTOP);
                                        printf("Processus d'id %d suspendu\n",id);
                                }
                        } else if (strcmp(cmd_lue -> seq[i][0], "bg") == 0){
                                id = atoi(cmd_lue -> seq[i][1]);
                                if (estPresent(id,liste)){
                                        kill(idtopid(id,liste),SIGCONT);
                                        relancer(id, &liste);
                                        printf("Processus d'id %d relancé en arrière plan\n",id);
                                }
                        } else if (strcmp(cmd_lue -> seq[i][0],"fg") == 0){
                              id = atoi(cmd_lue -> seq[i][1]);
                              if (estPresent(id,liste)){
                                        kill(idtopid(id,liste),SIGCONT);
                                        relancer(id,&liste);
                                        waitpid(idtopid(id,liste),NULL,WUNTRACED);
                                        supprimer(id,&liste);
                              }
                        } else {

                                
                                entree[0] = sortie[0];
                                entree[1] = sortie[1];

                                if (cmd_lue->seq[i+1]!=NULL) {
                                        pipe(sortie);
                                }else if (cmd_lue -> out != NULL){
                                        sortie[0] = 0;
                                        sortie[1] = write;

                                } else {
                                        sortie[0] = 0;
                                        sortie[1] = 0;
                                }
                              
                                pid_fils = fork(); // création du fils


                                if (pid_fils == -1) { // vérification de la bonne création du fils
                                        printf("Erreur fork\n");
                                        exit(1);
                                }


                                if (pid_fils==0){
                                        
                                        //Gestion entrées et sorties du pipe
                                        if (entree[1]){
                                                close(entree[1]);
                                        }
                                        if (entree[0]){
                                                dup2(entree[0],0);
                                        }
                                        if (sortie[1]){
                                                dup2(sortie[1],1);
                                        }
                                        if (sortie[0]){
                                                close(sortie[0]);
                                        }
                                                      

                                        int bonne_exec = execvp(cmd_lue->seq[i][0], cmd_lue->seq[i]);
                                        return EXIT_SUCCESS;

                                        // Code normalement non-execute
                                        if (bonne_exec == 0) {
                                                printf("Bonne execution\n");
                                        } else {
                                                printf("Mauvaise execution\n");
                                        }
                                } else {
                                        if (sortie[1]){
                                                close(sortie[1]);
                                        }

                                        ajouter(pid_fils,ACTIF,cmd_lue->seq[i][0],&liste); 

                                        if (cmd_lue->backgrounded == NULL){
                                                waitpid(pid_fils, NULL, WUNTRACED);
                                                if (estActif(pidtoid(pid_fils,liste),liste)){
                                                        supprimer(pidtoid(pid_fils,liste),&liste);
                                                }
                                        }
                                }
                                if (entree[1]){
                                        close(entree[1]);                                      
                                }
                                if (entree[0]){
                                        close(entree[0]);
                                }

                        }
                i++;
                }
        }
}

