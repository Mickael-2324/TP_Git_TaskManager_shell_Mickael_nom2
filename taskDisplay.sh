#!/bin/bash

source taskTool.sh
source dataTask.sh

while true; do
echo '========================='
echo ' Gestionnaire de taches '
echo '========================='
echo '1 - Initialiser la base'
echo '2 - Ajouter une tache'
echo '3 - Supprimer une tache'
echo '4 - Marquer une tache terminee'
echo '5 - Afficher les taches'
echo '6 - Sauvegarder la base'
echo '7 - Restaurer la base'
echo '8 - Supprimer la base'
echo '0 - Quitter'
echo '========================='
read -p 'Votre choix : ' choix


if [ "$choix" = '1' ]; then
initialiser_base
elif [ "$choix" = '2' ]; then
ajouter_tache
# ... compléter avec les autres cas
elif [ "$choix" = '0' ]; then
echo 'Au revoir !'
break
else
echo 'Choix invalide.'
fi
done
