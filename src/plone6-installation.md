# Installation

## Installation avec Docker

**Référence** : <https://6.docs.plone.org/install/containers/images/backend.html>

### Créer et démarrer un container Plone 6

Créer la structure

    plone6intro
    └── docker-compose.yml

avec le fichier _docker-compose.yml_ suivant :

    services:
      backend:
        image: plone/plone-backend:6.0.0.2
        ports:
        - "8080:8080"

Créer et démarrer le container

    docker compose up

**Attention** : Les données stockées dans le site Plone sont à l’intérieur du conteneur docker. Si vous supprimer le conteneur, les données seront perdues.

### Créer un container Plone 6 avec stockage des données en dehors du container

Créer la structure

    plone6intro
    ├── data
    └── docker-compose.yml

avec le fichier _docker-compose.yml_ suivant :

    services:
      backend:
        image: plone/plone-backend:6.0.0.2
        ports:
        - "8080:8080"
        volumes:
        - type: bind
            source: ./data
            target: /data

Créer et démarrer le container

    docker compose up

### Créer un container Plone 6 avec des modules complémentaires

    services:
      backend:
        image: plone/plone-backend:6.0.0.2
        ports:
        - "8080:8080"
        environment:
        - ADDONS=collective.easyform==4.1.2 collective.taxonomy==3.0.0
        volumes:
        - type: bind
          source: ./data
          target: /data

### Créer un container Plone 6 avec un thème dans le système de fichier

    TODO

**Remarques** : Le thème doit se trouver dans le dossier _resources/theme/MyTheme_ où _MyTheme_ est le dossier qui contient votre thème.

### Créer un container Plone 6 avec un module Python en développement

    services:
      backend:
        image: plone/plone-backend:6.0.0.2
        ports:
        - "8080:8080"
        environment:
        - DEVELOP=/app/src/seba
        volumes:
        - type: bind
          source: ./data
          target: /data
        - type: bind
          source: ./seba
          target: /app/src/seba

## Installation avec _buildout_

**Référence** : <https://5.docs.plone.org/manage/installing/installation_minimal_buildout.html>

Installer les dépendances

    Python >= 3.8 (3.11 est la plus performante)
    libjpeg, libxml2, libxslt

Créer la structure

    plone6intro
    └── buildout.cfg

avec le fichier _buildout.cfg_ suivant :

    [buildout]
    extends = https://dist.plone.org/release/6.0.2/versions.cfg
    parts =
        instance

    [instance]
    recipe = plone.recipe.zope2instance
    user = admin:admin
    http-address = 8080
    eggs =
        Plone

Créer votre instance Plone

    python3.11 -mvenv .
    ./bin/pip install -r https://dist.plone.org/release/6.0.2/requirements.txt
    ./bin/buildout

Démarrer votre instance Plone

    ./bin/instance fg  # mode développement
