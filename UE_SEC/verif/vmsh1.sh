#!/bin/sh
# ZH 30/3/21 ; PM 2/4/21
verifer() {
    sed -i '/^$/d' $fres
	sed -i '/^$/d' $fref
    sed -i 's/\(^>>>.*\)\(SUCCES\).*/\1\n\2/g' $fres
    sed -i 's/\(^>>>.*\)\(ECHEC\).*/\1\n\2/g' $fres
    sed -i '/^>>>/d' $fres
    sed -i '/^>>>/d' $fres
    sed -i '/^Salut/d' $fres
    sres=$(cut -d' ' -f1 $1)
    sref=$(cut -d' ' -f1 $2)
    if [ "$sres" != "$sref" ]; then
		echo ''
        echo "---Erreur: $3"
		echo "$sres"
		echo "<>"
		echo "$sref"
    else
    	echo "---Succès: $3\n"
    fi
}

if [ -n "$1" -a -x "$1" ]; then
    fent=fic_ent.txt
    fref=fic_ref.txt
    fres=fic_res.txt
    pwd
    echo pwd exit > $fent
    echo pwd > $fent
    $1 <$fent >$fres
    pwd > $fref
    echo SUCCES >> $fref
    verifer $fres $fref pwd
    date
    echo date exit > $fent
    echo date > $fent
    $1 <$fent >$fres
    date > $fref
    echo SUCCES >> $fref
    verifer $fres $fref date
    #erreur :argument absent
    echo grep exit > $fent
    echo grep > $fent
    echo '' >$fres
    $1 <$fent 2>>$fres >>$fres
    grep 2> $fref
    echo ECHEC >> $fref
    verifer $fres $fref grep
    #erreur : commande non trouvée
    echo bonjour exit > $fent
    echo bonjour > $fent
    echo '' >$fres
    $1 <$fent 2>>$fres >>$fres
    bonjour 2> $fref
    echo ECHEC >> $fref
    sed -i "/vmsh1/d" $fref
	verifer $fres $fref bonjour
	#erreur : commande vide
    echo '' exit > $fent
    echo '' > $fent
    echo '' >$fres
    $1 <$fent 2>>$fres >>$fres
    echo '' >$fref
	verifer $fres $fref "commande vide"
else
    echo "USAGE : $0 nom_executable"
fi
