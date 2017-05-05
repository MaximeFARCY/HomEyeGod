HomEyeGod

APP G7B Project

Pour récupérer le git: 1ère connexion:

$ git config --global user.name 'Mon nom qui apparaîtra quand je ferais des modifs'

$ git config --global user.email 'Mon mail' (il faut que le mail corresponde à celui github (ça vous évite des emmerdes après))

$ git clone https://github.com/JeromeLEKIEFFRE/HomEyeGod.git

puis

$ git branch -a

(là ça renvoie la branche master en vert et des branches remotes/origin/... en rouge)

pour chaque branche remote en rouge (ça veux dire qu'il sait qu'elle existe sur github mais qu'il ne l'as pas importée):

(origin est une variable dans laquelle l'adresse du git as été enregistrée pendant le clone)

$ git checkout nomdelabranche

(fondamentalement cette ligne créé en local une branche dans laquelle il vas copier le contenu qui se trouve à l'adresse origin/nomdelabranche Par soucis de simplicité respectez la casse maj et orthographe sinon ça vas être un bordel quand vous allez push sur github)

$ git checkout master

(on retourne systematiquement dans la branche master pour créer les autres branches sinon en local elles vont se créer en sous branche de la branche dans laquelle vous vous situez et ça vas vous sortir des erreurs en permanence)

une fois que vous l'avez fais pour toutes les branches votre git est initialisé!

les commandes de bases:

$ git checkout nomdelabranche pour aller dans la branche nomdelabranche

$ ls pour lister les fichiers et les dossiers présents dans la branche (en blanc les fichiers en bleu les dossiers)

$ cd nomdudossier pour rentrer dans un dossier

$ cd .. pour retourner dans le dossier parent de celui actuel

$git commit -m 'description de la mise à jours' pour valider localement une mise à jours, à faire dans la branche dans laquelle on fais les modifications

$ git push permet de mettre en ligne ses mises à jours (préalablements validées via le commit sinon ça ne passe pas)

$ git pull permet de récupérer les dernières mises à jours, à faire à chaque début de session pour être sûre de bosser sur la dernière version de notre fichier

Voili voilou, si vous galérez, allez bien vous faire foutre! je vous pisse à la raie faces de culs!
