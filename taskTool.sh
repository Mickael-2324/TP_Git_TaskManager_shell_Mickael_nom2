#!/bin/bash

ajouter_tache() {
    read -p "Description de la tâche : " desc
    if [ ! -f tasks.txt ]; then
        id=1
    else
        id=$(($(wc -l < tasks.txt) + 1))
    fi
    echo "$id | $desc | 0" >> tasks.txt
    echo "Tâche ajoutée : $id - $desc"
    git add tasks.txt
    git commit -m "feat: ajout fonction ajouter_tache"
}


supprimer_tache() {
    read -p "ID de la tâche à supprimer : " id_sup
    if [ ! -f tasks.txt ]; then
        echo "Erreur : fichier tasks.txt inexistant."
        return
    fi
    tmpfile=$(mktemp)
    while IFS= read -r line; do
        id=$(echo "$line" | cut -d'|' -f1 | xargs)
        if [ "$id" != "$id_sup" ]; then
            echo "$line" >> "$tmpfile"
        fi
    done < tasks.txt
    mv "$tmpfile" tasks.txt
    echo "Tâche $id_sup supprimée."
    git add tasks.txt
    git commit -m "feat: ajout fonction supprimer_tache"
}


marquer_terminee() {
    read -p "ID de la tâche à marquer terminée : " id_done
    if [ ! -f tasks.txt ]; then
        echo "Erreur : fichier tasks.txt inexistant."
        return
    fi
    tmpfile=$(mktemp)
    while IFS= read -r line; do
        id=$(echo "$line" | cut -d'|' -f1 | xargs)
        desc=$(echo "$line" | cut -d'|' -f2)
        statut=$(echo "$line" | cut -d'|' -f3 | xargs)
        if [ "$id" = "$id_done" ]; then
            echo "$id | $desc | 1" >> "$tmpfile"
        else
            echo "$line" >> "$tmpfile"
        fi
    done < tasks.txt
    mv "$tmpfile" tasks.txt
    echo "Tâche $id_done marquée comme terminée."
    git add tasks.txt
    git commit -m "feat: ajout fonction marquer_terminee"
}


afficher_taches() {
    if [ ! -f tasks.txt ]; then
        echo "Aucune tâche à afficher (fichier inexistant)."
        return
    fi
    echo "===== Liste des tâches ====="
    while IFS= read -r line; do
        id=$(echo "$line" | cut -d'|' -f1 | xargs)
        desc=$(echo "$line" | cut -d'|' -f2 | xargs)
        statut=$(echo "$line" | cut -d'|' -f3 | xargs)
        if [ "$statut" = "0" ]; then
            echo "[ ] $id - $desc"
        else
            echo "[X] $id - $desc"
        fi
    done < tasks.txt
    git add tasks.txt
    git commit -m "feat: ajout fonction afficher_taches"
}

