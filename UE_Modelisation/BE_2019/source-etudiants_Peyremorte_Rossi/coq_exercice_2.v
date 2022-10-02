Require Import Naturelle.
Section Session1_2019_Logique_Exercice_2.

Variable A B : Prop.

Theorem Exercice_2_Naturelle : (~A) \/ B -> (~A) \/ (A /\ B).
Proof.
I_imp H1.
E_ou (~A) B.
Hyp H1.
I_imp H21.
I_ou_g.
Hyp H21.
I_imp H22.

E_ou A (~A).
TE.
I_imp H31.
I_ou_d.
I_et.
Hyp H31.
Hyp H22.
I_imp H32.
I_ou_g.
Hyp H32.
Qed.

Theorem Exercice_2_Coq : (~A) \/ B -> (~A) \/ (A /\ B).
Proof.
intro H1.
elim H1.
intro H2.
left.

exact H2.
intro H3.

cut (A\/(~A)).

intro H4.
elim H4.
intro H5.
right.
split.
exact H5.
exact H3.
intro H6.

left.
exact H6.
TE.





Qed.

End Session1_2019_Logique_Exercice_2.

