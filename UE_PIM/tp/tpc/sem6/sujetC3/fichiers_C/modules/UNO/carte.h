

#ifndef carte__H
#define carte__H

#define NB_VALEURS 10

#include <assert.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <time.h>

//Définition du type enseigne
enum couleur {JAUNE, ROUGE, VERT, BLEU};
typedef enum couleur couleur;

//Tableau de caractères représentant les couleurs

//Définition du type carte
struct carte {
    couleur couleur;
    int valeur; // Invariant : valeur >= 0 && valeur < NB_VALEURS
    bool presente; // la carte est-elle presente dans le jeu ?
};
typedef struct carte carte;


void init_carte(carte* la_carte, couleur c, int v, bool pr);

bool est_conforme(carte c);

void copier_carte(carte* dest, carte src);

void afficher_carte(carte cte);
bool est_egale(carte c1, carte c2);
#endif
