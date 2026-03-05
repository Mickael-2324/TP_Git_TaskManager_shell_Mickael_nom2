initialiser_base() {
    if [ -f tasks.txt ]; then
        echo "La base existe déjà."
    else
        touch tasks.txt
        echo "Base initialisée : tasks.txt créé."
    fi
    git add tasks.txt
    git commit -m "feat: ajout fonction initialiser_base"
}

afficher_toutes_taches() {
    if [ -f tasks.txt ]; then
        cat tasks.txt
    else
        echo "Erreur : Base non initialisée."
    fi
    git add tasks.txt
    git commit -m "feat: ajout fonction afficher_toutes_taches"
}

sauvegarder_base() {
    if [ -f tasks.txt ]; then
        cp tasks.txt tasks_backup.txt
        echo "Sauvegarde créée : tasks_backup.txt"
    else
        echo "Erreur : Base inexistante, sauvegarde impossible."
    fi
    git add tasks_backup.txt
    git commit -m "feat: ajout fonction sauvegarder_base"
}

restaurer_base() {
    if [ -f tasks_backup.txt ]; then
        cp tasks_backup.txt tasks.txt
        echo "Base restaurée depuis la sauvegarde."
    else
        echo "Aucune sauvegarde disponible."
    fi
    git add tasks.txt
    git commit -m "feat: ajout fonction restaurer_base"
}

supprimer_base() {
    if [ -f tasks.txt ]; then
        read -p "Confirmez la suppression de tasks.txt (o/n) : " confirm
        if [ "$confirm" = "o" ]; then
            rm tasks.txt
            echo "Base supprimée."
            git add -u
            git commit -m "feat: ajout fonction supprimer_base"
        else
            echo "Suppression annulée."
        fi
    else
        echo "Erreur : Base inexistante."
    fi
}

