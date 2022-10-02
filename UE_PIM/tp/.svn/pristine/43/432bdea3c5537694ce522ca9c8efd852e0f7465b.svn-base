#include <stdlib.h> 
#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

// Definition du type monnaie
struct monnaie {
        float valeur;
        char devise;
};
typedef struct monnaie monnaie;

/**
 * \brief Initialiser une monnaie
 * \param[out] monnaie* pointeur de la monnaie à initialiser
 * \param[in] float valeur de la monnaie
 * \param[in] char devise de la monnaie
 * \pre valeur > 0
 */ 
void initialiser(monnaie* m, float valeur_monnaie, char devise_monnaie){
        assert(valeur_monnaie>0.0);
        m->valeur = valeur_monnaie;
        m->devise = devise_monnaie;
}

/**
 * \brief Initialiser une monnaie nulle
 * \param[out] monnaie* pointeur de la monnaie à initialiser
 * \param[in] devise de la monnaie nulle
 */
void initialiser_nul(monnaie* m, char devise_monnaie){
        (*m).valeur = 0.0;
        (*m).devise = devise_monnaie;
}


/**
 * \brief Ajouter une monnaie m2 à une monnaie m1 
 * \param[in] monnaie* pointeur de m1
 * \param[in out] monnaie* pointeur de m2 qui renverra la somme
 */
bool ajouter(monnaie* m1, monnaie* m2){
        if ((*m1).devise != (*m2).devise) {
                return false;
        }else {
                (*m2).valeur+=(*m1).valeur;
                return true;
        }
}


/**
 * \brief Tester Initialiser 
 * \param[in] monnaie monnaie
 * \param[in] float valeur
 * \param[in] char devise
 */ 
void tester_initialiser(monnaie* m, float valeur, char devise){
    initialiser(m,valeur,devise);
    assert((*m).valeur==valeur);
    assert((*m).devise==devise);
}

/**
 * \brief Tester Ajouter 
 * \param[in] monnaie m1
 * \param[in] monnaie m2
 */ 
void tester_ajouter(monnaie m1, monnaie* m2){
    if (m1.devise==(*m2).devise) {
        float somme = m1.valeur+(*m2).valeur;
        assert(ajouter(&m1,m2));
        assert((*m2).valeur==somme);
    }else{
        assert(!(ajouter(&m1,m2)));
    }
}



int main(void){
    // Un tableau de 5 monnaies
    typedef monnaie t_porte_monnaie[5];
    t_porte_monnaie porte_monnaie;

    //Initialiser les monnaies
    for (int i=0;i<=4;i++){
        float valeur;
        char devise;
        printf("Entrer une monnaie (valeur + devise) (mettre espace entre les deux entrées) : ");
        scanf("%f %c", &valeur,&devise);
        tester_initialiser(&porte_monnaie[i],valeur,devise);
    }
    // Afficher la somme des toutes les monnaies qui sont dans une devise entrée par l'utilisateur.
        //Récupérer la devise de la somme
    char devise_somme;
    printf("Entrer une devise pour la somme : ");
    scanf(" %c",&devise_somme);
        //Initialiser la monnaie qui contiendra la somme
    monnaie monnaie_somme;
    initialiser_nul(&monnaie_somme,devise_somme);
        //Faire la somme
    for (int i=0;i<=4;i++){
        tester_ajouter(porte_monnaie[i],&monnaie_somme);
    }
        //Afficher le résultat de la somme
    printf("Le résultat de la somme %f %c \n",monnaie_somme.valeur,devise_somme);

    return EXIT_SUCCESS;
}
