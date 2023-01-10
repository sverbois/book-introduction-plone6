Actions automatiques (règles)
=======================================

Effectuer une action (envoi de mail, déplacement de contenu,...) lors d'un événement (ajout d'un élément, changement d'état,...) sous certaines conditions (type de contenu,...).

Exemples
--------

- envoyer un mail lors de l'ajout d'un nouveau contenu
- envoyer un mail lors de la demande de publication d'un événement
- déplacer une actualité dans le dossier "Actualités" lors de sa publication

Ajouter une règle à votre site
------------------------------

Plone -> Configuration du site -> Règles -> Ajouter une règle

### Evénements déclencheurs principaux


- Contenu ajouté au dossier
- Contenu modifié
- Changement de l'état du contenu

### Types d'action

- envoyer un mail
- déplacer l'objet
- copier l'objet
- effacer l'objet
- changer l'état
- afficher un message (notification)
- ajouter une information dans le fichier de log

### Types de condition principaux

- Type de contenu
- Etat de processus documentaire
- Groupe de l'utilisateur
- Rôle de l'utilisateur

### Exemple

- envoyer un mail lors de l'ajout d'un nouveau contenu

Affecter une règle sur un conteneur
-----------------------------------

- Conteneur -> Règles -> Affecter une règle ici -> Ajouter
- Conteneur -> Règles -> Appliquer aux sous-dossiers

Autres content rules
--------------------

Faire une recherche sur "https://pypi.org" avec le mot clef "contentrules" pour trouver d'autres *content rules* disponibles.
