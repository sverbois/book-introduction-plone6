Gestion de contenu
============================

**Référence** : <https://5.docs.plone.org/working-with-content>

Configurations de base
----------------------

#### Fixer le français comme langue d'interface du site

- Plone -> Site Setup -> Language

### Configurer l'envoi de mail à partir du site

- Plone -> Configuration du site -> Envoi de courriels : utiliser la passerelle SMTP de votre fournisseur de courrier électronique
- Plone -> Contact : formulaire de contact

Quels sont les types de contenus disponibles ?
----------------------------------------------

- Plone -> Configuration du site -> Paramètres des types de contenus

**Types de contenus par défaut**

- contenus de base : Page Web, Lien, Fichier, Image, Evénement, Actualité
- conteneur : Dossier
- liste : Collection
- commentaire : Commentaire

Comment ajouter une page ?
--------------------------

- Plone -> Ajout d'un élément -> Page Web
- par défaut les "Page Web" sont dans l'état "Privé" (visible uniquement par l'éditeur)

Modifier un contenu
--------------------

### Modifier les identifiants

- Contenu -> Actions -> Renommer
- Contenu -> Modifier -> Paramètres -> Nom court

### Versionnement

Plone -> Configuration du site -> Paramètres des types de contenus -> Page Web : Automatique, Manuel, Pas de versionnement

### Autres formatages

- Plone -> Configuration du site -> Formatage du texte

Autres types de contenu : Lien/Fichier/Image
--------------------------------------------

- Plone -> Ajout d'un élément -> Lien

    + le lien redirige directement vers la cible quand l'utilisateur n'a pas le droit de modifier le contenu lien

- Plone -> Ajout d'un élément -> Fichier
- Plone -> Ajout d'un élément -> Image

    + différentes images de tailles différentes sont créées au chargement de l'image

        - Plone -> Configuration du site -> Gestion des images
        - <my-image-url>/@@images/image/large
        - <my-image-url>/@@images/image/preview
        - <my-image-url>/@@images/image/mini

    + insérer une image dans un document

Commenter un contenu
--------------------

#### Activer la possibilité de commenter des contenus

- Plone -> Configuration du site -> Discussion -> Activer globalement les commentaires

#### Valeur par défaut

- Plone -> Configuration du site -> Paramètres des types de contenus -> <content name> -> Autoriser les commentaires

#### Valeur personnalisée

- Contenu -> Modifier -> Paramètres -> Autoriser les commentaires

Comment structurer le contenu du site à l'aide de dossiers ?
------------------------------------------------------------

- Conteneur -> Ajout d'un élément -> Dossier
- déplacer des contenus : Conteneur -> Contenus -> Couper/Coller
- vues d'un dossier : Conteneur -> Affichage

### Créer un dossier d'images

- Conteneur -> Ajout d'un élément -> Dossier
- Dossier -> Contenus -> Transfert
- Conteneur -> Affichage -> Vue en vignette
- restreindre les contenus que l'on peut ajouter : Conteneur -> Ajout d'un élément -> Restriction
- navigation précédent/suivant : Conteneur -> Modifier -> Paramètres -> Activer la navigation "précédent/suivant"

Comment personnaliser la navigation ?
-------------------------------------

### Navigation automatique

Une navigation automatique est créée à 3 endroits : onglets, portlet de navigation, plan du site

- Plone -> Configuration du site -> Navigation
    + politique globale
    + par défaut, un onglet est créé pour chaque éléments à la racine du site
- exclure un contenu du menu de navigation : Contenu -> Modifier -> Paramètres -> Exclure de la navigation
- configurer la portlet de navigation pour afficher le contenu d'un sous-dossier
- désactiver l'onglet "Accueil" : Plone -> Configuration du site -> Actions -> Portal tabs -> Accueil -> Cacher

### Actions

- Plone -> Configuration du site -> Actions

Comment lier des contenus entre eux ?
-------------------------------------

### Liens hypertexte dans le texte

- Contenu -> Modifier -> Insérer/modifier un lien interne

### Contenus correlés

- Contenu -> Modifier -> Catégorisation -> Contenus correlés
- respecte les permissions
- possibilité de lien bidirectionnel

### Contenu de type Lien

- Plone -> Ajout d'un élément -> Liens
- un utilisateur qui n'a pas le droit de modifier le contenu Lien est directement redirigé

### Collections

Une collection est une liste automatique de contenus définie par des "critères" de recherche. Les éléments de cette liste sont affichés selon un ordre spécifié.

- exemple : liste des derniers documents ajoutés dans la sous-partie X du site affiché par ordre inverse de création.
- Plone -> Ajout d'un élément -> Collection

### Mots-clés

- Contenu -> Modifier -> Catégorisation -> Mots clés
- Rôles qui peuvent ajouter des nouveaux mot-clés : Plone -> Configuration du site -> Site -> Rôles qui peuvent ajouter des mot-clés

### URL alternatives (alias)

Un alias est automatiquement créé lors du changement d'identifiant (nom court) d'un contenu.
On peut également en créer manuellement.

- Content -> Actions -> Gestion des URL
- Plone -> Configuration du site -> Gestion des URL

Contenu "Actualité"
-------------------

- Plone -> Ajout d'un élément -> Actualité
- "Document" avec image intégrée
- analyser la collection "News"

Contenu "Evénement"
-------------------

- Plone -> Ajout d'un élément -> Evénement
- Contrôle du calendrier : Plone -> Configuration du site -> Calendrier
- analyser la collection "Events"

Contenus présents à la création du site ?
-----------------------------------------

- 'Actualités' (news) : dossier pour les actualités (type "Dossier") qui contient une 'Collection' (aggregator) comme vue par défaut
- 'Evénements' (events) : dossier pour les événements (type "Dossier") qui contient un 'Collection' (aggregator) comme vue par défaut
- 'Membres' (Members) : dossier pour les espaces personnels dans le cas d'un site communautaire (type "Dossier") dont la vue par défaut est la *browser view* '@@member-search'

Tous ces contenus peuvent être recréés et ne sont pas nécessaires pour le bon fonctionnement de Plone. Personnellement, je les efface dans un nouveau site.
