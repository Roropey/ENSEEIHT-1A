/** Squelette du programme **/
/*********************************************************************
 *  Auteur  : PEYREMORTE Romain
 *  Version : V1
 *  Objectif : Conversion pouces/centimètres
 ********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#define UN_POUCE 2.54

int main()
{
        float valeur;
        char unité;
        float lg_cm;
        float lg_p;
        int volonté = 1;
        while (volonté==1){
    /* Saisir la longueur */
                printf("Entrer une longueur (valeur + unité) : ");
                scanf("%f %c", &valeur,&unité);
    /* Calculer la longueur en pouces et en centimètres */
                switch (unité) {
                case 'p':
                case 'P':
                        lg_p = valeur;
                        lg_cm = lg_p * UN_POUCE;
                        break;
                case 'c':
                case 'C':
                        lg_cm = valeur;
                        lg_p = lg_cm / UN_POUCE;
                        break;
                case 'm':
                case 'M':
                        lg_cm = valeur * 100;
                        lg_p = lg_cm / UN_POUCE;
                        break;
                default:
                        lg_p = 0;
                        lg_cm = 0;
                }        
      
    /* Afficher la longueur en pouces et en centimètres */
                printf("%f p = %f cm \nVoulez-vous recommencez ? (1 = oui, autre = non)",lg_p,lg_cm);
                scanf("%i", &volonté);
        }
    return EXIT_SUCCESS;
}
