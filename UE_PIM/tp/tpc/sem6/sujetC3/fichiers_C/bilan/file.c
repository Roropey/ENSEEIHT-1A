/**
 *  \author Xavier Crégut <nom@n7.fr>
 *  \file file.c
 *
 *  Objectif :
 *	Implantation des opérations de la file
*/

#include <malloc.h>
#include <assert.h>

#include "file.h"


void initialiser(File *f)
{
    (*f).tete = NULL;
    (*f).queue = NULL;

    assert(est_vide(*f));
}

void detruire_cellule(Cellule *c){
        if (c != NULL){
                detruire_cellule((*c).suivante);
                c = NULL;
                free(c);
        }
}

void detruire(File *f)
{
        detruire_cellule((*f).tete);
        (*f).tete=NULL;
        free((*f).tete);
        (*f).queue=NULL;
        free((*f).queue);
        f=NULL;
        free(f);
}

char tete(File f)
{
    assert(! est_vide(f));

    
    return f.tete->valeur;
}


bool est_vide(File f)
{
    
    return (f.tete == NULL) && (f.queue == NULL);
}

/**
 * Obtenir une nouvelle cellule allouée dynamiquement
 * initialisée avec la valeur et la cellule suivante précisé en paramètre.
 */
static Cellule * cellule(char valeur, Cellule *suivante)
{
    Cellule *nouv_cellule;
    (*nouv_cellule).valeur = valeur;
    (*nouv_cellule).suivante = suivante;
    return nouv_cellule;
}


void inserer(File *f, char v)
{
    assert(f != NULL);
    if (est_vide(*f)){
        Cellule *nouv_cellule;
        (*nouv_cellule).valeur = v;
        (*nouv_cellule).suivante = NULL;
        (*f).tete = nouv_cellule;
        (*f).queue = nouv_cellule;
    } else {
        (*f).queue = cellule(v,(*f).queue);
    }
}

void extraire(File *f, char *v)
{
    assert(f != NULL);
    assert(! est_vide(*f));
    *v = ((*f).tete)->valeur;
    if (((*f).tete)->suivante == NULL){
        (*f).tete=NULL;
        (*f).queue=NULL;
    } else {
        (*f).tete=(*(*f).tete).suivante;
    }
}

int longueur_chaine(Cellule *c){
        if (c == NULL){
                return 0;
        } else {
                return 1 + longueur_chaine((*c).suivante);
        }
}

int longueur(File f)
{
    return longueur_chaine(f.tete);
}


